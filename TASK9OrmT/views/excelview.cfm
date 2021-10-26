<cfscript>
  // contact handler object
  contObj=createObject('component','TASK9OrmT.components.contacthandler');
  contactData=contObj.showContact(session.userId);
  cont_array=queryNew("Name,Phone,Emailid,Address");
</cfscript>
<cfloop array="#contactData#" index="contact">
<cfset fullname=contObj.display(contact.getTitle()&contact.getFname()&" "&
   contact.getLname())>
<cfset  #queryAddRow(cont_array,{'Name':'#fullname#',
  'Phone':'#contObj.display(contact.getPhone())#',
     'Emailid':'#contObj.display(contact.getMailid())#','Address':
     '#contObj.display(contact.getAddres())#'})#>
</cfloop>
<cfset sheet = SpreadSheetNew()>
<cfscript>
num=cont_array.recordCount+1;
spreadsheetAddRows(sheet,cont_array,1,1,true,[],true);
spreadsheetFormatRow(sheet,{bold:'true',alignment:'center',color:'red'},1)
spreadsheetFormatRows(sheet,{alignment:'center'},"2-#num#");
 </cfscript>
<!--- stream it to the browser --->
<cfheader name="Content-Disposition" value="inline; filename=contacts.xls">
<cfcontent type="application/vnd.ms-excel" variable="#SpreadSheetReadBinary(sheet)#">