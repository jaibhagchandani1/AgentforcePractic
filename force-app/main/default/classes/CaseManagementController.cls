public class CaseManagementController {
    
    @InvocableMethod(label ='get case status' description = 'return case status')
    public static List<String> getCaseStatus(List<String> caseNumberList){
        
       List<Case> caseList = [Select id,status from case where casenumber IN:caseNumberList];
        if(caseList.size()>0){
            return new List<String>{caseList[0].status};
        }
        else{
            return new List<String>{'case number is not valid'};
        }
    }


}