@isTest
global class AnimalLocatorMock implements HttPCalloutMock {
    global HTTPResponse respond(HTTPRequest request) {
        HTTPResponse resp = new HTTPResponse();
        resp.setHeader('Content-Type', 'applcation/json');
        resp.setBody('{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}');
        resp.setStatusCode(200);
        return resp;
    }
}