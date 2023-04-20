public abstract class Employee {
    public String firstName;
    public String lastName;
    public Integer empId;
    public Date joiningDate;
    public Decimal salary;
    public Decimal money_withdrawn;
    public Decimal available_balance;
    public Decimal  money_deposited=0;
    public abstract void calculateSalary();
    public abstract void deposit();
    public abstract void checkBalance();
    public void employeeDetails(String firstName, String lastName, Integer empId, Date joiningDate) {
       this.firstName = firstName;
       this.lastName = lastName;
       this.empId = empId;
       this.joiningDate = joiningDate;
        System.debug( firstName + ' ' + lastName + ' ' + empId + ' ' + joiningDate );
    }
    
}