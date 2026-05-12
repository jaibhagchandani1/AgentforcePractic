public with sharing class EscalateCasesController {
	
    public class wrapperRequest{
        @invocableVariable(required=true description='Pass the case number given by the user')
        public String caseNumber;
    }
    
    public class wrapperResponse{
        @invocableVariable(description='Show the message to the user')
        public string message;
    }
    
    @InvocableMethod(label='Escalate Cases' Description='Escalate Cases to the correct team')
    public static List<wrapperResponse> transferCases(List<wrapperRequest> request){
        Case caseObj =[Select Id,casenumber,Type from CASE where casenumber =:request[0].caseNumber LIMIT 1];
        Group groupId = [Select id,name from Group where type='Queue' and Name=:caseObj.Type LIMIT 1];
        caseObj.ownerId = groupId.Id;
        update caseObj;
        wrapperResponse obj = new wrapperResponse();
        obj.message = caseObj.casenumber + '' + ' is transferred to the ' + groupId.Name;
        return new List<wrapperResponse>{obj};
    } 
}