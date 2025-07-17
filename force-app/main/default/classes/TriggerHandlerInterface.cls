public interface TriggerHandlerInterface {
    void run(List<SObject> newList, Map<Id, SObject> oldMap);
}