public class allEmail implements Schedulable {
    public void execute(SchedulableContext sc) {
      
      list<Messaging.SingleEmailMessage> Multiemail = new list<Messaging.SingleEmailMessage>();

      list<string> eId=new List<string>{'nitesh.dimri@cynoteck.com','mohit.kumar@cynoteck.com','deepak.pundir@cynoteck.com','deepak.sahu@cynoteck.com','satyam.sharma@cynoteck.com','abhishek.bhandari@cynoteck.com','suraj.dobhal@cynoteck.com','nitin.kaintura@cynoteck.com','sidharth.negi@cynoteck.com','kunal.garg@cynoteck.com','shrishti.dhyani@cynoteck.com','pallak.sharma@cynoteck.com','praveen.dhoundiyal@cynoteck.com','rishabh.mishra@cynoteck.com','shubham.bisht@cynoteck.com','anshuman.chauhan@cynoteck.com'};


      batchIterator batchProcessor = new batchIterator(eId);
      Database.executeBatch(batchProcessor,10 );
      
    }
  }
