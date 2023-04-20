public class Triggerdispatcher {
    public static set<id> sortAccountid(List<Contact> conNewList, Map<id, Contact> conOldMap){
        set<id> setAccountid = new set<id>();
        for(Contact con:conNewList){
            if(String.isNotBlank(con.Accountid)){
                setAccountId.add(con.Accountid);
            }
            else if(String.isNotBlank(con.Accountid)&&(con.Accountid!=conOldMap.get(con.id).Accountid)){
                setaccountid.add(conOldMap.get(con.id).Accountid);
                
            }
        }
        return setAccountid;
    }
    
}