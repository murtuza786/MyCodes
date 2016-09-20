//opportunity trigger
public class OpportunityClasses 
{
    public static void oppNotiEmailAlert(List<Opportunity> newlist)
    {
        Map<id,User> newamp= new map<id,User> ([select id,ManagerId,email from User]);
        EmailTemplate templateId = [Select id from EmailTemplate where developername  = 'EMail_for_manager'];
        for(Opportunity op:newlist)
        {
             if (op.Amount>25000)
              {
             System.debug('Amount'+ op.amount);		
               id userid=op.ownerid;
                  string mgrmail = '';
                  if(newamp.get(op.OwnerId)!=null)
                  { 
                    String mngrid = newamp.get(op.OwnerId).ManagerId;
                    mgrmail= newamp.get(op.OwnerId).email;
                  }
            
            // User myUser = [select id, email from user where id =:userid]; //manager
            // id managerid = myUser.id;
       		 // Opportunity i= [select Ownerid,id,Owner.manager.email from opportunity where id=:userid LIMIT 1];            
       		// String managerid=newamp.get(email);

              Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
               String[] toAddresses = new String[]{mgrmail};
               mail.setToAddresses(toAddresses); 
                  
           
			   mail.setSubject('Automated email: Contact created');
               mail.setTemplateID(templateId.Id);
               String body = 'Opportunity more than or equal to 25000'; 
               mail.setPlainTextBody(body); 
			   Messaging.sendEmail(new Messaging.SingleEMailMessage[]{mail});           
           }    	 
        }
    }
   				 // For update
    public static void oppNotiEmailAlertUpdate(Map<id,Opportunity>newmap, Map<id,Opportunity>oldmap)
    {
        System.debug('newmap'+newmap);
        System.debug('oldmap'+oldmap);
        
        //Map<id,User> newamp= new map<id,User> ([select id,ManagerId,email from User]);
        EmailTemplate templateId = [Select id from EmailTemplate where developername  = 'EMail_for_manager'];
        List<id> owneridlist=new List<id>();
        ID tempid=templateId.Id;
        for(id old:newmap.keyset())
        {
            if(oldmap.get(old).amount<25000 && newmap.get(old).amount>25000)
            {
                owneridlist.add(newmap.get(old).createdById);
            }
        }
        
              List<user> ownerlist=new List<user>([select id,Manager.email from user where id in:owneridlist]);
               Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>();
        
        
         for(user u : ownerlist)
          {
          id managerid = u.Manager.id;
          String managerEmail = u.Manager.email;
          Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
          email.ToAddresses=new String[]{ managerEmail};
          email.setTemplateId(tempid);
           email.setSaveAsActivity(false);    //  The default value is true, meaning the email is saved as an activity
           email.setTargetObjectId(managerid);
          messages.add(email);

          }
        Messaging.sendEmail(messages);
          
            }
}