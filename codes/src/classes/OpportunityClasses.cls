public class OpportunityClasses 
{

    public static void oppNotiEmailAlert(List<Opportunity> newlist)
    {
      
        for(Opportunity op:newlist)
             if (op.Amount>25000)
        {
            // System.debug('Amount'+ op.amount);		
               id userid=op.ownerid;
             User myUser = [select id, email from user where id =:userid]; //manager
            id managerid = myUser.id;
       		 // Opportunity i= [select ownerid, id,Owner.manager.email,Owner.manager.name from opportunity where id=:userid];            
       		 

              Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
              String[] toAddresses = new String[] {managerid};
               mail.setToAddresses(toAddresses); 
			   mail.setSubject('Automated email: Contact created');
               String body = 'Opportunity more than or equal to 25000'; 
               mail.setPlainTextBody(body); 
			   Messaging.sendEmail(new Messaging.SingleEMailMessage[]{mail});
            
                  
             	 
        }
        
        
    }
}