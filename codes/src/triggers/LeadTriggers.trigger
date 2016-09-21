trigger LeadTriggers on Lead (before insert, before update, after insert,after update) 
{
     if(Trigger.isBefore)
     {
        if(Trigger.isInsert)
         {
           LeadClass.chkMailPhone(Trigger.new);
         }   
           if(Trigger.isUpdate)
          {
              LeadClass.chkMailPhone(Trigger.new);
           }
      } 
           if (Trigger.isAfter)
           {
               if (trigger.isInsert) 
               {
                 LeadClass.addtask(Trigger.new);
                   
				LeadClass.doClone(Trigger.new);                   
               }
               if (Trigger.isUpdate)
               {
                  LeadClass.doClone(Trigger.new);   
               }
           }

}