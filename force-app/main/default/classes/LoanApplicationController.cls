public class LoanApplicationController {

    public class inputWrapper{
        @invocableVariable(label='Loan Application Id' Description = 'Pass the loan application id given by the user' required=true)
        public string loanApplicationId;
        
        @invocableVariable(label='Loan Type' Description = 'Pass the loan type given by the user' required=true)
        public string loanType;
        
        @invocableVariable(label='Interest Rate APR' Description = 'Pass the interest rate given by the Agentforce Data Library' required=true)
        public string interestRateAPR;
        
        @invocableVariable(label='Max Tensure' Description = 'Pass the Maximum Tenure given by the Agentforce Data Library' required=true)
        public string maxTenure;
        
        @invocableVariable(label='ProcessingFee' Description = 'Pass the Processing Fee given by the Agentforce Data Library' required=true)
        public string processingFee;
        
        @invocableVariable(label='eligibilityCriteria' Description = 'Pass the Eligibility Criteria given by the Agentforce Data Library' required=true)
        public string eligibilityCriteria;
        
        @invocableVariable(label='documentChecklist' Description = 'Pass the Document Checklist given by the Agentforce Data Library' required=true)
        public string documentChecklist;
        
    }
    
    public class OutputWrapper{
        @invocableVariable(label='Updated Loan Application Record' Description = 'Once loan application is updated then display this record in the UI')
        public Loan_Application__c loanAppRecord; 
    }
    
    @invocableMethod(label='Update Loan Application Record' Description='update the loan application record and values are coming from the agenforce data library')
    public static List<OutputWrapper> updateLoanApplication(List<inputWrapper> inputWrapperList){
        
        List<OutputWrapper> outputWrapperList = new List<OutputWrapper>();
        OutputWrapper output = new OutputWrapper();
        Loan_Application__c loanObj = [Select Id,Loan_Type__c,Interest_Rate_APR__c,
                                       Max_Tenure__c,Processing_Fee__c,
                                       Eligibility_Criteria__c,Document_Checklist__c
                                       from Loan_Application__c where Id=:inputWrapperList[0].loanApplicationId LIMIT 1];
        
        loanObj.Interest_Rate_APR__c = inputWrapperList[0].interestRateAPR;
        loanObj.Max_Tenure__c = inputWrapperList[0].maxTenure;
        loanObj.Processing_Fee__c = inputWrapperList[0].processingFee;
        loanObj.Eligibility_Criteria__c = inputWrapperList[0].eligibilityCriteria;
        loanObj.Document_Checklist__c = inputWrapperList[0].documentChecklist;
        Update loanObj;
        output.loanAppRecord = loanObj;
        outputWrapperList.add(output);
        return outputWrapperList;
    }
}