@isTest
public class LeadcloneTestclass {
static testMethod void doclone()
{
    // clone if status = Open - Not Contacted
    List<Lead> leadlist = new List<Lead>();
     Lead leadclone;
    for(integer i=0;i<5;i++)
    {
        leadclone = new Lead();
       leadclone.FirstName='Ahmedj'+i;
       leadclone.LastName='Shaikh'+i;
       leadclone.Company='Zeny'+i;
       leadclone.LeadSource='Web';
       leadclone.Status='Working - Contacted';
       leadclone.phone='98765431'+i;
       leadclone.Email='ahmed'+i+'@gmail.com';
        leadlist.add(leadclone);    
         System.debug('REcords working'+leadlist);
    }
        
   
   // List <Lead> leadlist1 = new List<Lead>();
     Lead leadclone1;
    for(integer i=0;i<5;i++)
    {
        leadclone1 = new Lead();
       leadclone1.FirstName='JK'+i;
       leadclone1.LastName='Smith'+i;
       leadclone1.Company='Zeny'+i;
       leadclone1.LeadSource='Web';
       leadclone1.Status='Open - Not Contacted';   
       leadclone1.Phone='99995433'+i;
       leadclone1.Email='JK'+i+'@gmail.com';
       
         leadlist.add(leadclone1);  
          System.debug('REcords open'+leadlist); 
    }
         
        insert leadlist;   
        List<Lead> di = new List<Lead>([select id,Status from Lead where Status ='Working - Contacted']);
       System.assertEquals(leadlist.size(),di.size());  
    
    
    }
}