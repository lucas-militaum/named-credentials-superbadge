public class ResearchServiceController {
    
    public static Integer processEquipmentsRequest() {
        String endpoint = 'https://integration-security-proxy-33i1n3.5sc6y6-4.usa-e2.cloudhub.io/equipments'; 
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:Research_Guardian/equipments');
        request.setHeader('client_id', '{!$Credential.Secure_Research.client_id}');
        request.setHeader('client_secret', '{!$Credential.Secure_Research.client_secret}');
        
        request.setMethod('GET');
        HttpResponse response = new Http().send(request);
        
        if (response.getStatusCode() == 200) {
            String responseBody = response.getBody();
            System.debug('Available Equipments: ' + responseBody);
        } else {
            System.debug('Callout failed with status code: ' + response.getStatusCode());
        }
        return response.getStatusCode();
    }

}