@isTest
 // chk for mail and phone is same error
public class LeadtestClass 
{
  static testMethod void mailchkTest()
   {
        List<Lead> newlist =new List<Lead>{};
           for(integer i=0;i<5;i++)
        {
     lead origlead = new lead();
       origlead.FirstName='Ahmed'+i;
       origlead.LastName='Shaikh'+i;
       origlead.Company='Zeny';
       origlead.LeadSource='Web';
       origlead.State='Working - Contacted';
       origlead.phone='9876543212'+i;
       origlead.Email='ahmed'+i+'@gmail.com';
    // test.startTest();
       insert origlead;
     //  test.stopTest();
       newlist.add(origlead);
      
        }
        //duplicate
   try
    {
        lead duplead = new lead();
        for(integer i=4;i<10;i++)
        {
         duplead.FirstName='Ahmed'+i;
       	 duplead.LastName='Shaikh'+i;
         duplead.Company='Zeny';
         duplead.LeadSource='Web';
         duplead.State='Working - Contacted';
         duplead.phone='9876543212'+i;
         duplead.Email='ahmed'+i+'@gmail.com';
       			insert duplead;
                newlist.add(duplead);      
        }
      }
        catch(Exception e)
       {
          String s=e.getMessage();
          System.assert(s.contains('Duplicate Values'));
             System.debug(e.getMessage());
       }
       
              
   }
}