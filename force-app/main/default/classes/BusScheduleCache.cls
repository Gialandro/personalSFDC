public class BusScheduleCache {
    private Cache.OrgPartition part;
    public BusScheduleCache() {
        part = Cache.Org.getPartition('local.busSchedule') != null ? Cache.Org.getPartition('local.busSchedule') : null;
    }
    public void putSchedule(String busLine, Time[] schedule) {
        if(part != null) {
            part.put(busLine, schedule);
        }
    }
    public Time[] getSchedule(String busLine){
        Time[] times = new List<Time>();
        Object result = part.get(busLine);
        if(result != null) {
            times.add((Time)result);
        } else{
            times.add(Time.newInstance(8, 00, 0, 00));
            times.add(Time.newInstance(17, 00, 0, 00));
        }
        return times;
    }
}