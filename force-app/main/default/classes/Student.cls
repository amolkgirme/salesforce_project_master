public class Student extends Teacher {
    public void studentResult()
    {
       if(Total_marks<35)
           System.debug('Fail');
        else if(Total_marks>=35)
            System.debug('Pass');
        else
            system.debug('invalid data');
    }

}