public class ParkLocator {
    public static List<String> country(String place) {
        List<String> srvs = new List<String>();
        ParkService.ParksImplPort ws = new ParkService.ParksImplPort();
        String [] res = ws.byCountry(place);
        for(String cnt: res) {
            srvs.add(cnt);
        }
        return srvs;
    }
}