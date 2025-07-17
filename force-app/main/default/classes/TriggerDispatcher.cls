public class TriggerDispatcher {
    public static void dispatch(String sObjectName, String eventType, List<SObject> newList, Map<Id, SObject> oldMap) {
        List<Trigger_Configuration__mdt> configs = [
            SELECT Object_Name__c, Event_Type__c, Handler_Class__c, isActive__c
            FROM Trigger_Configuration__mdt
            WHERE Object_Name__c = :sObjectName AND Event_Type__c = :eventType AND isActive__c = true
        ];

        for (Trigger_Configuration__mdt config : configs) {
            Type handlerType = Type.forName(config.Handler_Class__c);
            if (handlerType == null) continue;

            Object handlerInstance = handlerType.newInstance();
            if (handlerInstance instanceof TriggerHandlerInterface) {
                ((TriggerHandlerInterface)handlerInstance).run(newList, oldMap);
            }
        }
    }
}