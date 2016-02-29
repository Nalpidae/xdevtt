global class CreateTaskEmailExample implements Messaging.InboundEmailHandler {
    
    private List<Messaging.SingleEmailMessage> messages;
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, 
                                                       Messaging.InboundEnvelope env) {
                                                           
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
    
        String myPlainText= email.plainTextBody;
    
        Task[] newTask = new Task[0];
        
        try {
            // Taskつくるよ
            Contact vCon = [SELECT Id, Name, Email
                FROM Contact
                WHERE Email = :email.fromAddress
                LIMIT 1];
            
            newTask.add(new Task(Description =  myPlainText,
                                    Priority = 'Normal',
                                    Status = 'Inbound Email',
                                    Subject = email.subject,
                                    IsReminderSet = true,
                                    ReminderDateTime = System.now()+1,
                                    WhoId =  vCon.Id));
                
            insert newTask;    
 
            System.debug('New Task Object: ' + newTask );   
            
            // メール返すよ
            OutboundEmail mail = new OutboundEmail();
            mail.createSendMessage(email.fromAddress
                                    , '差出人名'
                                    , new String[]{email.fromAddress}
                                    , null
                                    , '件名'
                                    , '本文');
            mail.send();
            
        } catch (QueryException e) {
            System.debug('Query Issue: ' + e);
        }
        
        result.success = true;
        
        return result;
    }
    
}