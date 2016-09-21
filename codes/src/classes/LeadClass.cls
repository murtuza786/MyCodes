//Create a new (Trigger) handler class on lead that will check for duplicates before allowing a new record into the database, 
//validate against the Email Address and Phone Number field. It will throw an error if the value is present.

public class LeadClass 
{
public static void chkMailPhone(List<Lead> newlist)
     {
      //  List<Lead> l1=new List<Lead>();
           //fetch from database
           System.debug('list'+newlist);
         for(Integer i=0;i<newlist.size();i++)     // for(Lead li : newlist)
         		{
         for(Lead le :[select id,Email,Phone from Lead])
         {
                    System.debug('records'+i);
                    
                    if(newlist[i].Id != le.Id)    // for update
                    {
                        
                       if ((newlist[i].Email==le.Email) || (newlist[i].Phone==le.Phone))
                        {
                         System.debug ('Duplicate Values');
                          newlist[i].addError('Duplicate Values');
                        }
                    }    
                  
         		}
                 
         }   
         } 
    // new method for lead, New task create after inserting record
    //  Assig2
     public static void addtask(List<Lead> l1)
     {
         
         List<Task> tasklist = new List<Task>();
         for(Lead lead: l1)
         {
             Task t=new task();
           //  tasklist.add(new Task(Subject='Call', Status='Completed', Priority='Low',WhatId = lead.Id));
             t.Subject='call';
             t.Status='In Progress'; 
             t.Priority='Low'; 
             t.WhoId=lead.Id;
             tasklist.add(t);
             
         }
         System.debug('task'+tasklist);
         if (tasklist.size()>0)
                          
                            insert tasklist;
                          
         }
     //Write a new trigger on lead which will check for ‘Open-Not Contacted’ leads and then creates a duplicate 
    //entry of the same lead but with status as ‘Working – Contacted’, rest
    // all information will be the same except for Name, Email and Phone (append a character at the 
    // beginining and at the end to avoid a duplicate check)
   
   public static void doClone(List<Lead> newLead)
    {

       List<Lead> newLeads=new List<Lead>();


        for(Lead ld: newLead)
        {
          if(ld.Status== 'Open - Not Contacted')
          {

              Lead le=new Lead();
              le=ld.clone(false,true,false,false); 
              le.Email='MS' + ld.Email;
              le.Company=ld.Company;
              le.Phone=ld.Phone;
              le.Status='Working - Contacted';
              newLeads.add(le);

          }

        }
       insert newLeads;
    }
}