public class ABC_Corporation {
    public void invoiceDetails(integer noOfRecord){
       List<Invoice_Line_Item__c> ilicList = new List<Invoice_Line_Item__c>();
        Invoice__c ic = new Invoice__c(Amount_Paid__c=300, Due_on__c=date.newInstance(2022, 12, 23),Status__c='Open');//parent
        insert ic;
        for(integer i=0; i<=noOfRecord; i++){
            Invoice_Line_Item__c ilic = getInvoiceLineDetails(i,ic);
            ilicList.add(ilic);
           }
        system.debug('md record==='+ilicList);
        insert ilicList;  
    }
 
        public Invoice_Line_Item__c getInvoiceLineDetails(integer index, Invoice__c ic) {
            Invoice_Line_Item__c ilic = new Invoice_Line_Item__c();
            ilic.Cost_price__c=getCostPrice(index);
            ilic.Name=getname(index);
            ilic.Quantity__c=getQuantity(index);
            ilic.Invoice__c=ic.Id;
            return ilic;
        } 
        public Decimal getCostPrice(integer index){
            List<Decimal> cpc = new List<Decimal>();
            cpc.add(300);
            cpc.add(400);
            cpc.add(600);
            cpc.add(700);
            return cpc[index];
        }
        public String getname(integer index){
            List<String> n = new List<String>();
            n.add('32-GB pendrive');
            n.add('60 KG Refrigenrator');
            n.add('High Class Air Conditioner');
            n.add('13 TB Hard-Disc');
            return n[index];
         }
        public Integer getQuantity(integer index){
            List<Integer> qc = new List<Integer>();
            qc.add(5);
            qc.add(3);
            qc.add(4);
            qc.add(8);
            return qc[index];
        }
    }