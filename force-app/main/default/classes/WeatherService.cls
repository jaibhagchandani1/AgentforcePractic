public class WeatherService {

    public static String getWeather(String city) {

        Http http = new Http();

        HttpRequest req = new HttpRequest();

        req.setEndpoint(
            'callout:Weather_API/weather?q='
            + city +
            '&units=metric'
        );

        req.setMethod('GET');

        HttpResponse res = http.send(req);

        if(res.getStatusCode() == 200) {

            return res.getBody();

        }

        return 'Error';
    }
}