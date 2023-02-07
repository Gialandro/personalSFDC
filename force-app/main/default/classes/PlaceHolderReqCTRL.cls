public class PlaceHolderReqCTRL {
	private Http http = new Http();
	private HttpResponse res{get; set;}
	public String usuarios {get; set;} //variable que contiene String de User a travez JSON
	public String strname{get;set;}
	public List<Items> dr{get;set;}
	public Integer ItemId{get;set;}
	public String stremail{get; set;}
	public String strWebSite{get; set;}


    public PlaceHolderReqCTRL (ApexPages.StandardController controller) {
        httpRequest();
    }
    //Función que extrae la información del webservice y la asigna a la variable usuarios
    public void httpRequest(){
    	HttpRequest req = new HttpRequest();
			req.setHeader('Accept','application/json;');
			req.setMethod('GET');
			req.setEndpoint('https://jsonplaceholder.typicode.com/users');
			req.setTimeout(60000);
		   	res = http.send(req);
		 	usuarios = res.getBody();
    	ResCls resItem = (ResCls)System.JSON.deserialize(usuarios, ResCls.class);
        // List<String> deser = (List<String>)System.JSON.deserialize(bodyReq, List<String>.class);
    	List<Items> rl = resItem.items;
        System.debug(rl);
    	dr = new List<Items>();
    	for(Items it:rl){
            	system.debug('Item Name: ' + it);
            	ItemId = it.ItemId;
            	strname = it.Name;
            	stremail = it.Email;
            	strWebSite = it.WebSite;

            		system.debug('ItemId: ' + it.ItemId);

            		system.debug('Name: ' + it.Name);
            	dr.add(it);
            }
       system.debug('List: ' + dr);
    }

    public class ResCls{
    	List<Items> items;
    }

    public class Items{
    	public Integer ItemId{get; set;}
    	public String Email{get; set;}
    	public String Name{get; set;}
    	// public String Street{get; set;}
    	// public String City{get; set;}
    	public String WebSite{get; set;}

    }
}