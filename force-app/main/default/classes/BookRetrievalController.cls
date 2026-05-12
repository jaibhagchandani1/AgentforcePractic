public class BookRetrievalController {

    @InvocableMethod(label='Retrieve Books' Description='Fetch all the books from the system')
    public static List<BookResponse> getBooks(List<BookRequest> req){
        List<BookResponse> responses = new List<BookResponse>();
        BookResponse res = new BookResponse();
        res.aBookOptions = new AvailableBooks();
        res.aBookOptions.bookOptions = new List<Book>();
        for(Books__c bookRec : [SELECT Id,Author__c,Name,Quantity__c,Best_Seller__c,Year__c,Rating__c FROM Books__c where Rating__c >=:Integer.valueOf(req[0].filters.rating)]){
            Book bookConstructor = new Book(bookRec.Name,
                                            bookRec.Author__c,
                                            Integer.valueOf(bookRec.Quantity__c),
                                            Date.valueOf(bookRec.Year__c),
                                           Integer.valueOf(bookRec.Rating__c),
                                           bookRec.Best_Seller__c
                                           );
            res.aBookOptions.bookOptions.add(bookConstructor);
        }
        responses.add(res) ;
        return responses;
    }
    
    public class BookResponse{
        @invocableVariable public AvailableBooks aBookOptions;
    }
    public class AvailableBooks{
        public List<Book> bookOptions;
    }
    
    public class Book{
        @invocableVariable public string name;
        @invocableVariable public string author;
        @invocableVariable public Integer quantity;
        @invocableVariable public date year;
        @invocableVariable public Integer rating;
        @invocableVariable public boolean bestSeller; 
        public Book(String name,string author,Integer quantity, date year,integer rating,boolean bestseller){
            this.name = name;
            this.author = author;
            this.quantity = quantity;
            this.year = year;
            this.rating = rating;
            this.bestSeller = bestseller;
        }
    }
    public class BookRequest{
        @invocableVariable
        public BookFilter filters;
    }
    
    public class BookFilter{
         @invocableVariable
        public String rating;
    }
}