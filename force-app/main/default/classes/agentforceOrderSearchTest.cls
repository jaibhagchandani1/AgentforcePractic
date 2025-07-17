@isTest
public class agentforceOrderSearchTest {
    @IsTest
    static void findOrderTest(){
        Order__c order = new Order__c();
        order.Name = '123456789';
        order.Customer_Email__c = 'test@gmail.com';
        insert order;
        List<agentforceOrderSearch.Request> request = new List<agentforceOrderSearch.Request>();
        agentforceOrderSearch.Request req = new agentforceOrderSearch.Request();
        req.orderName = order.Name;
        req.email = order.Customer_Email__c;
        request.add(req);
        Test.startTest();
        List<agentforceOrderSearch.Response> response = agentforceOrderSearch.findOrder(request);
        Test.stopTest();
        System.assertEquals(1, response.size());
    }
}