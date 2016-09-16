trigger DeDupeCheck_ass1 on Lead (before insert, before update, after insert,after update) 
{
     if(Trigger.isBefore)
     {
        if(Trigger.isInsert)
         {
           Assig1_dulicates.dublicate1(Trigger.new);
         }   
           if(Trigger.isUpdate)
          {
              Assig1_dulicates.dublicate1(Trigger.new);
           }
      } 
           if (Trigger.isAfter)
           {
               if (trigger.isInsert) 
               {
                 Assig1_dulicates.addtask(Trigger.new);
                   
				Assig1_dulicates.cloneassig(Trigger.new);                   
               }
               if (Trigger.isUpdate)
               {
                  
               }
           }
}