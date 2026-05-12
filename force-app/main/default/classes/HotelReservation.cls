public class HotelReservation {
    @InvocableMethod(label='Find hotels ' description='Find Available Hotels')
    public static List<HotelResponse> findHotels(List<HotelRequest> req) {

        // Hardcoding the data for example and not focusing on how we retrieve it.
        // However, consider that we are receiving available hotels from a service,
        // and then iterating through the data to generate the final response.

        List<HotelResponse> hotelResponseList = new List<HotelResponse>();

        Room r1 = new Room('DELUX', 2, 15.15d, 2000l, false);
        List<Room> rooms = new List<Room>();
        rooms.add(r1);

        HotelCategory fourStar = new HotelCategory('four');
        Hotel hotel1 = new Hotel('Sahara Hotels', 'Gacchibowli Hyderabad', rooms, fourStar);
        HotelCategory fiveStar = new HotelCategory('five');
        Hotel hotel2 = new Hotel('Taj Vivanta', 'Kokapet', rooms, fiveStar);
        List<Hotel> hotels = new List<Hotel>();
        hotels.add(hotel1);
        hotels.add(hotel2);

        HotelResponse hotelresponse = new HotelResponse(hotels);

		hotelResponseList.add(hotelresponse);

        return hotelResponseList;
    }

    public class HotelRequest {
        @InvocableVariable
        public String city;

        @InvocableVariable
        public Date checkInDate;

        @InvocableVariable
        public Date checkOutDate;

    }


    public class HotelResponse {

        @InvocableVariable
        public List<Hotel> hotels;

        public HotelResponse(List<Hotel> hotels) {
            this.hotels = hotels;
        }
    }


    public class HotelCategory{
        @InvocableVariable
        public String star;

        public HotelCategory(String star) {
            this.star = star;
        }
    }

    public class Hotel {
        @InvocableVariable
        public String name;

        @InvocableVariable
        public String address;

        @InvocableVariable
        public List<Room> rooms;
        @InvocableVariable
        public HotelCategory hotelCategory;

        public Hotel(String name, String address, List<Room> rooms,HotelCategory hotelCategory) {
            this.name = name;
            this.address = address;
            this.rooms = rooms;
            this.hotelCategory = hotelCategory;
        }
    }

    public class Room {
          @InvocableVariable
        public String type;

        @InvocableVariable
        public Integer available;

        @InvocableVariable
        public Double discountPercentage;

        @InvocableVariable
        public Long price;

        @InvocableVariable
        public Boolean petAllowed;

        public Room(String type, Integer available, Double discountPercentage, Long price, Boolean petAllowed) {
              this.type = type;
            this.available = available;
            this.discountPercentage = discountPercentage;
            this.price = price;
            this.petAllowed = petAllowed;
        }
    }
}