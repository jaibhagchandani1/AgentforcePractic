public class AfterInsertAccountHandler implements TriggerHandlerInterface {
    public void run(List<SObject> newList, Map<Id, SObject> oldMap) {
        List<Account> accounts = (List<Account>) newList;
        for (Account acc : accounts) {
<<<<<<< HEAD
            acc.Name = acc.Name + ' - Modified Again 13';
=======
            acc.Name = acc.Name + ' - Modified Again 14 changed again';
>>>>>>> devBranch
        }
    }
}
