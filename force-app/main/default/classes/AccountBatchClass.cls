global class AccountBatchClass implements Database.Batchable<sObject>,Database.stateful {
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select id,name,phone,AnnualRevenue from account');
    }
    public void execute(Database.BatchableContext bc, List<sObject> records){
        List<Account> accToUpdate = new List<Account>();
        for(sObject sObj  : records){
            Account acc = (Account)sObj;
            Account accRec = new Account();
        	accRec.AnnualRevenue = 100; 
            accRec.id = acc.Id;
            accToUpdate.add(accRec);
        }
        UPDATE accToUpdate;
    }
    public void finish(Database.BatchableContext bc){
        
    }

}