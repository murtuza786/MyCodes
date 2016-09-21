@isTest
public class OpportunityTestclass {
static testMethod void oppAmountchk()
{
    List<Opportunity> newlist=new  List<Opportunity>();
    Opportunity op;
    for(Integer i =0; i<10; i++)
    {  	
    op=new Opportunity();
    op.Name='Newtestamt+i';
    op.CloseDate=System.today();
    op.StageName='Closed Won';
    op.Amount=20000;
        newlist.add(op);
     }
    //insert newlist;    
    
  
    for(Integer i =0; i<10; i++)
    { 
    Opportunity op1=new Opportunity();
    op1.Name='oppnewtest'+i;
     op1.CloseDate=System.today()-5;
          // op.CloseDate=date.ValueOf('9/18/2016');
    op1.StageName='Closed Won';
    op1.Amount=28000;
   newlist.add(op1);
    }
    try
    {
    insert newlist;    
    }
    catch(Exception e)
    {
        System.debug('Opportunity'+e.getMessage());
    }
  }
}