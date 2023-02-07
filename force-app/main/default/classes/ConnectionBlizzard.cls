public with sharing class ConnectionBlizzard {
    public static void login() {
        HttpRequest req = new HttpRequest();
        Http http = new Http();

        String endpoint = 'https://us.battle.net/oauth/token';
        String acc = 'c3ace7a4f8034366818a9ea9a9704837';
        String tkn = '9T34d0VxLCz190VzVn4pYbgalq9eLuoW';
        String boundary = String.valueOf(DateTime.now().getTime());
        String body = '';
        // String cont = 'Content-Disposition: form-data; name="grant_type"' + '\r\n\r\n' + 'client_credentials' + '\r\n\r\n';
        body += '--' + boundary + '\r\n\r\n';
        body += 'Content-Disposition: form-data; name="grant_type"' + '\r\n\r\n';
        body += 'client_credentials' + '\r\n\r\n';
        body += '--' + boundary + '--';
        Blob headerVal = Blob.valueOf(acc + ':' + tkn);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerVal);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type', 'multipart/form-data; boundary=--' + boundary);
        req.setMethod('POST');
        req.setEndpoint(endpoint);
        req.setBody(body);
        HttpResponse res = http.send(req);
        System.debug('body=>>' + res.getBody());
        System.debug('status=>>' + res.getStatus());
        System.debug('statusCode=>>' + res.getStatusCode());
    }
}