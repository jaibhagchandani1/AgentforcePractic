public with sharing class agentforceOrderSearch {
   
    @InvocableMethod(label='Find Order' description='Searches an order on the basis of the order name and email')   
    public static List<Response> findOrder(List<Request> request){

        OrderFilter reqObj = request[0].Filter;
        List<Order__c> orderList= [Select Id,Name,Customer_Email__c,Order_Status__c,createddate From Order__c where Customer_Email__c =:reqObj.email and Name=:reqObj.orderName];
        Response resObj = new Response();
        resObj.order.orderId =  orderList[0].Id;
        resObj.order.orderStatus = orderList[0].Order_Status__c;
        resObj.order.orderDate = Date.valueOf(orderList[0].createddate);
        return new List<Response>{resObj};
    }


    public class Request{
        @InvocableVariable(description='The Order Filter To Apply for the order search')
        public OrderFilter Filter;
    }

    public class OrderFilter{
         @InvocableVariable(label='Order Name' description='Take the input of order name from the user' )
        public String orderName;

        @InvocableVariable(label='Email' description='Take the input of Email from the user' )
        public String Email;
    }

    public class Response{
        @InvocableVariable(label='Order' description='Returns The order of the order' )
        public Order order;

    }
    public class Order{
        @InvocableVariable(label='Order Id' description='Returns The order id order of the order' )
        public String orderId;

        @InvocableVariable(label='Order Status' description='Returns the Order Status of the order' )
        public String orderStatus;

        @InvocableVariable(label='Order Date' description='Returns the Order Date of the order' )
        public Date orderDate;
    }
}