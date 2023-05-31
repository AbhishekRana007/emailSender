global class batchIterator implements Database.Batchable<String>, Database.Stateful {
    //use this variable to store incoming data from trigger
     private Iterable<String> accounts;
 
     //make a constructor call 
     public batchIterator(Iterable<string> Eaccounts) {
         this.accounts = Eaccounts;
         }
     
     global Iterable<string> start(Database.BatchableContext bc) {
         return accounts;
     }
     
     global void execute(Database.BatchableContext bc, List<string> scope) {
         // Process the batch of records here
         list<Messaging.SingleEmailMessage> Multiemail = new list<Messaging.SingleEmailMessage>();
         
         list<string> eId=scope;
         
        String emailBody = '<html><body>';
   emailBody += '<p>Here is a list of supersets to complete based on their experience, starting from the lowest level. These will be part of your KRA going forward, so make sure to complete them as soon as possible. </p>';       
 emailBody += '<table border="1">';
 emailBody += '<tr><th>Supersets </th><th>Exp</th></tr>';
 emailBody += '<tr><td>Associate Administrator </td><td>0 to 1</td></tr>';
 emailBody += '<tr><td>Associate Platform App Builder </td><td>1 to 2</td></tr>';
 emailBody += '<tr><td>Associate Platform Developer I  </td><td>1 to 2</td></tr>';
 emailBody += '<tr><td>Associate Billing Specialist  </td><td>2 to 3</td></tr>';
 emailBody += '<tr><td>Associate Einstein Consultant  </td><td>3 to 4</td></tr>';
 emailBody += '</table><br><br>';
 emailBody += '<b><p>NOTE:- Please confirm receipt of this message by liking it.</p></b><br>';
 emailBody+=' Thanks & Regards, <br>';
 emailBody+='Sourabh Kumar | IT Trainer<br>';
 emailBody+='(US) +1-415-429-6641|(India) +91-135-2608366 <br>';
 emailBody+='Cynoteck Technology Solutions <br>';
 emailBody += '</body></html>';

             for(string nid:eId)
         {
 
 Messaging.SingleEmailMessage email= new Messaging.SingleEmailMessage();
  email.setToAddresses(new list<string>{nid});
 email.setSubject('Monthly reminder call to complete their supersets');
 
 // Set the email body
// email.setPlainTextBody('Here is a list of supersets to complete based on their experience, starting from the lowest level. These will be part of your KRA going forward, so make sure to complete them as soon as possible.');
 
 // Set additional email attributes (optional)
 
 email.setReplyTo('nitin.dangwal@cynoteck.com');
      email.setHtmlBody(emailBody);
  email.setSenderDisplayName('Cynoteck Technology Solutions Private Limited');
         Multiemail.add(email);}
 
 // Send the email
 Messaging.sendEmail(Multiemail);
         
     }
     
     global void finish(Database.BatchableContext bc) {
         // Batch job has finished
         System.debug('Batch job has finished');
     }
 }