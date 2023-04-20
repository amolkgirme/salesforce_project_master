public class LeadTriggerHandler {
    public static boolean isfirstrun=True;
    public static void updateRating(List<Lead> leadList){
        for(Lead l : leadList){
            if(l.LeadSource=='Web'){
                l.Rating='Cold';
            }
            else{
                l.Rating='Hot';
            }
        }
    }
    public static void uniqueEmail(List<Lead> newList){
        Map<String, Contact> conMap = new Map<String, Contact>();
        for(Contact con : [SELECT ID, email FROM Contact]){
            conMap.put(con.email, con);
        }
        for(Lead l : newList){
            if(l.email!=Null){
                if(conMap.containskey(l.email)){
                    l.email.addError('You cannot use '+l.email+' because it is already in the contact');
                }
                
               }
        }
            
	}
    /* Create a duplicate lead when a lead in insert. 
     * to create a duplicate record we use deepclone() function. Deepclone() function keeps the IDs 
     * doesn't support primitive data type
     * parameters are applicable
     * Generally it clone the object but don't hold any reference
     * In this case recursion is happening so we avoid recursion using static boolean variable
*/ 
    public static void createDuplicateLead(List<Lead> leadList){
        
        List<lead> ldList = new List<lead>();
        ldList=leadList.deepClone();
       	insert ldList;
      }
   
}