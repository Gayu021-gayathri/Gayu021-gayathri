component{
 
 remote function getdata(ref){
   retstruct={};
   contactobj=entityLoad("ormcontacts",{id=arguments.ref},true);
   var fullname=contactobj.getTitle()&contactobj.getFname()&' '&
                contactobj.getLname();
   var addres=contactobj.getAddres()&' ,'&contactobj.getCounty();
   structInsert(retstruct,'fullname',fullname);
   structInsert(retstruct,'gender',contactobj.getGender());   
   structInsert(retstruct,'dob',contactobj.getDob());
   structInsert(retstruct,'addres',addres);
   structInsert(retstruct,'zip',contactobj.getZip());
   structInsert(retstruct,'mailid',contactobj.getMailid());
   structInsert(retstruct,'phone',contactobj.getPhone());
   structInsert(retstruct,'title',contactobj.getTitle());
   structInsert(retstruct,'lname',contactobj.getLname());
   structInsert(retstruct,'fname',contactobj.getFname());
   structInsert(retstruct,'street',contactobj.getStreet());
   structInsert(retstruct,'county',contactobj.getCounty());
   structInsert(retstruct,'id',contactobj.getId());
   obj=createObject('component','TASK9OrmT.components.contacthandler');
   retstruct=obj.display(retstruct);
   return retstruct;
 }	
 
 remote function getbasic(ref){
    basicdet={};
    contactobj=entityLoad("ormcontacts",{id=arguments.ref},true);
    fullname=contactobj.getTitle()&contactobj.getFname()&' '&
             contactobj.getLname();
    structInsert(basicdet,"fullname", fullname);
    structInsert(basicdet,"phone", contactobj.phone);
    structInsert(basicdet,"mailid", contactobj.mailid);
    return basicdet;
 }

}