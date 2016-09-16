//Create a new (Trigger) handler class on lead that will check for duplicates before allowing a new record into the database, 
//validate against the Email Address and Phone Number field. It will throw an error if the value is present.
//using map
public class Assig1_dulicates 
{
    public static void dublicate1(List<Lead> newlist)
     {
      //  List<Lead> l1=new List<Lead>();
           //fetch from database
         for(Lead le :[select Email,Phone from Lead])
         {   
             for(Integer i=0;i<newlist.size();i++)     // for(Lead li : newlist)
         		{
                    System.debug('records'+i);
                    if ((newlist[i].Email==le.Email) && (newlist[i].Phone==le.Phone))
                    {
                     System.debug ('duplicate');
                       
                      newlist[i].addError('Duplicate Values');
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
    public static void cloneassig(List<Lead> newlist1)
    {
        List <Lead> leadlist = new List<Lead>();
       						// for (Lead l1:[select FirstName,LastName,Company,LeadSource,Phone,Email,Status from Lead])
         for(Lead li: newlist1)
        {
        	if (li.Status=='Open - Not Contacted')
        	{
                 // create clone copy of record
                   Lead cloneleadlist = li.Clone(false,true,false,false);
                 system.debug('@@@@@@@@' +cloneleadlist);
                 cloneleadlist.status='Working – Contacted';
        	    cloneleadlist.FirstName='M'+li.FirstName;
                cloneleadlist.LastName='s'+li.LastName;
        		 cloneleadlist.Email='ms'+li.Email;
        		 cloneleadlist.Phone='001'+li.Phone;
               leadlist.add(cloneleadlist);
                  
                 system.debug('@@@@@@@@' +leadlist); 
               // insert leadlist;
            }
        	}
        
    }
        
     }