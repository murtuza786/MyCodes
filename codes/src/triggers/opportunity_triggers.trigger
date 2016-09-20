trigger opportunity_triggers on Opportunity (before insert,before update,after insert, after update) 
{
   if (Trigger.isBefore)
   {
       if (Trigger.isInsert)
       {
           
       }
       if (Trigger.isUpdate)
       {
           
       }
       
   }
    if (Trigger.isAfter)
    {
        if (Trigger.isInsert)
       {
           OpportunityClasses.oppNotiEmailAlert(Trigger.new);
       }
       if (Trigger.isUpdate)
       {
           OpportunityClasses.oppNotiEmailAlertUpdate(Trigger.newmap,Trigger.oldmap);
       }       
    }           
}