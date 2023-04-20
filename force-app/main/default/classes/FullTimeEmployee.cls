public class FullTimeEmployee extends Employee {
    Decimal salary;
    public void fullTimeEmployee(Decimal salary){
        this.salary=salary;
    }
    public override void calculateSalary(){
        system.debug('FullTimeemployee salary is : : '+salary);
        
    }
    public override void deposit(){
        money_deposited=money_deposited+salary;
    }
    Public void withdraw(Decimal money_withdrawn){
        this.money_withdrawn=money_withdrawn;
    }
    public override void checkBalance(){
        Decimal minimum_balance=3000;
        Decimal available_balance=money_deposited- money_withdrawn;
        if(available_balance>minimum_balance){
            system.debug('Available balance is :: '+available_balance);
        }
        else{
            system.debug('Maintain sufficient balance');
        }
        
    }
    

}