public with sharing class FollowerFeedController {
    
    public FollowerFeedController() {}
        
    public List<NewsFeed> getMyFeed()  {
    
         List<NewsFeed> myfeed = [SELECT Id, 
                                    CreatedById, CreatedBy.FirstName, CreatedBy.LastName, CreatedDate,
                                    FeedPostId, FeedPost.Body, FeedPost.Title, FeedPost.CreatedById
                                     FROM NewsFeed
                                     WHERE FeedPost.Body != ''
                                     ORDER BY CreatedDate DESC, ID DESC
                                     LIMIT 100];
           return myfeed;
    }

    public List<NewsFeed> getMyFeedWithComment()  {
         Datetime fromDate = Datetime.valueOf(ApexPages.currentPage().getParameters().get('from'));
         Datetime toDate = Datetime.valueOf(ApexPages.currentPage().getParameters().get('to'));
         List<NewsFeed> myfeed = [SELECT Id, Type, 
                                    CreatedById, CreatedBy.FirstName, CreatedBy.LastName, CreatedDate,
                                    ParentId, Parent.Name, 
                                    FeedPostId, FeedPost.Body, FeedPost.Title, FeedPost.CreatedById,
                                    (SELECT Id, FieldName, OldValue, NewValue 
                                              FROM FeedTrackedChanges ORDER BY Id DESC), 
                                    (SELECT Id, CommentBody, CreatedDate,
                                            CreatedById, CreatedBy.FirstName, CreatedBy.LastName
                                            FROM FeedComments 
                                            ORDER BY CreatedDate ASC LIMIT 10)
                                     FROM NewsFeed
                                     WHERE FeedPost.Body != ''
                                     AND CreatedDate > :fromDate
                                     AND CreatedDate < :toDate
                                     ORDER BY CreatedDate DESC
                                     LIMIT 100];
           return myfeed;
    }
}