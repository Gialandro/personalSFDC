public class AnimalLocator {
    public static String getAnimalNameById(Integer numAnimal) {
        String anm;
        Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + numAnimal);
		request.setMethod('GET');
		HttpResponse response = http.send(request);
		if (response.getStatusCode() == 200) {
            // Mapa base (puede traer varios objetos/mapas dentro)
		    Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Mapa interno para cada elemento
		    Map<String, Object> animal = (Map<String, Object>) results.get('animal');
            anm = (String) animal.get('name');
		}
        return anm;
    }
}