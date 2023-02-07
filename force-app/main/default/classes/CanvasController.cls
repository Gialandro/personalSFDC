global class CanvasController{

public Integer ItemId{get;set;}
public String name{get;set;}
public List<Items> dr{get;set;}

public CanvasController(){

}

public void requestM(){

    String url = 'http://api.walmartlabs.com/v1/feeds/specialbuy?apikey=5amzkrmy235zddjwmu785hf8&categoryId=3944';

    HttpRequest req = new HttpRequest();
    req.setEndpoint(url);
    req.setMethod('GET');

    Http http = new Http();
    HttpResponse res = http.send(req);
    String responseBody = res.getBody();
    
    ResCls resItem = (ResCls)JSON.deserialize(responseBody, ResCls.class);
    List<Items> rl = resItem.items;
    List<Items> dr = new List<Items>();
    for(Items it:rl){
        system.debug('Item Name: ' + it);
        ItemId = it.ItemId;
        name = it.Name;
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

public Integer ItemId{get;set;}
public Integer ParentItemId{get;set;}
public String Name{get;set;}
public Double SalePrice{get;set;}
public String Upc{get;set;}
public String CategoryPath{get;set;}
public Boolean AvailableOnline{get;set;}
public String ShortDescription{get;set;}
public String LongDescription{get;set;}
public String BrandName{get;set;}
public String ThumbnailImage{get;set;}
public String LargeImage{get;set;}
public String ProductTrackingUrl{get;set;}
public Boolean FreeShipping{get;set;}
public Boolean NinetySevenCentShipping{get;set;}
public Double StandardShipRate{get;set;}
public Double TwoThreeDayShippingRate{get;set;}
public Double OvernightShippingRate{get;set;}
public String Size{get;set;}
public String Color{get;set;}
public Boolean Marketplace{get;set;}
public Boolean ShipToStore{get;set;}
public Boolean FreeShipToStore{get;set;}
public String ModelNumber{get;set;}
public String SellerInfo{get;set;}
public String ProductUrl{get;set;}
public List<Integer> Variants{get;set;}
public List<String> Shelves{get;set;}
public String CustomerRating{get;set;}
public String CustomerRatingImage{get;set;}
public Integer NumReviews{get;set;}
public String CategoryNode{get;set;}
public Boolean isRollBack{get;set;}
public Boolean isSpecialBuy{get;set;}
public String Isbn{get;set;}
public Boolean Bundle{get;set;}
public Boolean Clearance{get;set;}
public Boolean PreOrder{get;set;}
public String PreOrderShipsOn{get;set;}
public String Stoc{get;set;}
public Boolean Freight{get;set;}
public Long DealEndTime{get;set;}
public Long DealStartTime{get;set;}
public String Gender{get;set;}
public String Age{get;set;}
}


}