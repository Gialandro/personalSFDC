@isTest
global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        String [] arr = new List<String>();
        arr.add('Anamudi Shola National Park');
        arr.add('Anshi National Park');
        arr.add('Bandipur National Park');
        ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
            response_x.return_x = arr;
        // end
        response.put('response_x', response_x); 
   }
}