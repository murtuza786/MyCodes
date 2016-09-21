@isTest
public class TaskTetstclass {
    // if lead insert add task
     static testMethod void taskCreate()
   {
   
      lead tasklead = new lead();
       tasklead.FirstName='Ahmed';
       tasklead.LastName='Shaikh';
       tasklead.phone='9876543212';
       tasklead.Email='ahmed@gmail.com';
       tasklead.Company='Zenny';
       insert tasklead;
        task t= [select whoID from task];
        System.assertEquals(tasklead.Id,t.WhoId);  
     
   }
       static testMethod void taskCreatebulk() 
       {
         List<Lead> newlist=new  List<Lead>();
         for(Integer i =0; i<10; i++)
        	{
            Lead le = new Lead(Email=i+'ahmed@gmail.com',phone=i+'123456',lastname=i+'shaikh',company=i+'zenny');
            newlist.add(le);
        	}

        insert newlist;

        Map<id,Task> newtask =new Map<id,Task>();

         for(Task t1 : [select id,whoid from Task])
        {
            newtask.put(t1.WhoId,t1);
        }
            
          for(Lead l1: newlist)
          {
                System.assertEquals(newtask.containsKey(l1.id),true);
          }
            
        }
}