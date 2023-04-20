public class PartTimeEmployee extends Employee {
    public Decimal hourlyPay;
    public Integer workingHours;
    public Integer days;
   
    Decimal sal;
    public void PartTimeEmp(Decimal hourlyPay, Integer workingHours,Integer days){
        this.hourlyPay = hourlyPay;
        this.workingHours = workingHours;
        this.days=days;
    }
    public override void calculateSalary() {
        sal = hourlyPay * workingHours*days;
        System.debug('Part-Time Emp Salary :: ' + sal);
    }
     public override void deposit(){
        money_deposited =money_deposited +sal;
    }
    Public void withdraw(Decimal money_withdrawn){
        this.money_withdrawn=money_withdrawn;
    }
    public override void checkBalance(){
        Decimal minimum_balance=1000;
        available_balance=money_deposited- money_withdrawn;
        if(available_balance>minimum_balance){
            system.debug('Available Balance is  :: '+available_balance);
        }
        else{
            system.debug('Maintain sufficient balance');
        }
        
    }

}