public class CaseListTable {
	
    public class caseWrapper{
        @InvocableVariable
        public String caseNumber;

        @InvocableVariable
        public String caseStatus;

    }
    
     public class caseResponse {
        @InvocableVariable
        public List <caseWrapper> caseWrapperList;
    }
    
    public class CaseRequest {
        @InvocableVariable
        public String caseStatus;
    }
   
    
    @InvocableMethod(label='Return the case list')
    public static List<caseResponse> getCaseData(List<CaseRequest> caseRequestObj){
        List < caseWrapper > caseWrapperList = new List < caseWrapper > ();
        List < caseResponse> caseResponseList = new List< caseResponse >();
        CaseRequest caseRequestRec = caseRequestObj[0];
        List<case> caseList = [Select id,casenumber,status from case where status=:caseRequestRec.caseStatus LIMIT 5];
        for(case caseRec : caseList){
            caseWrapper obj = new caseWrapper();
            obj.caseNumber = caseRec.casenumber;
            obj.caseStatus = caseRec.status;
            caseWrapperList.add(obj);
        }
        caseResponse responseObj = new caseResponse();
        responseObj.caseWrapperList = caseWrapperList;
        caseResponseList.add(responseObj);

        System.debug( 'caseResponseList ' + caseResponseList );
        return caseResponseList;
        
    }
}