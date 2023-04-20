public interface BankingInterface {
    void checkBalance();
    void deposit(Decimal deposit);
    void withdraw(Decimal withdraw);
    void accountDetails();
}