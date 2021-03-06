public with sharing class CommandButtonOnCompleteController {
    
    // メッセージ
    public String message {get; set;}
    
    /*
     * コンストラクタ
     * @param   : なし
     * @return  : なし
     */
    public CommandButtonOnCompleteController() {
        System.debug('◆◆◆◆CommandButtonOnCompleteController:START');
        
        // メッセージ
        this.message = '';
        
        System.debug('◆◆◆◆CommandButtonOnCompleteController:END');
    }
    
    /*
     * ボタン押下処理
     * @param   : なし
     * @return  : なし
     */
    public void doButtonClick() {
        System.debug('◆◆◆◆doButtonClick:START');
        
        // メッセージ
        this.message = 'OK';
        
        System.debug('◆◆◆◆doButtonClick:END');
    }
}