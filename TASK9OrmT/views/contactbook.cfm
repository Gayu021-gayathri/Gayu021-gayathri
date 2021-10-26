 
 <cfscript>
if ( structKeyExists(session,'signin') and 
	 session.signin eq false ){
	location('../index.cfm');
}
</cfscript>
<!--- ajax proxy for view/edit/delete contact --->
<cfajaxproxy cfc="TASK9OrmT.components.asynccfc" jsclassname="asy">
<!DOCTYPE html>
<html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="../css/styles.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <title>AddressBook</title>
  <script type="text/javascript" src="../js/script.js"></script>  
</head>
<body>
<!--- header file --->
<cfinclude template="../shared/header.cfm">
<cfoutput>#header#</cfoutput>
<!--- title bar --->
<div class="container">
  <div class="well">
    <cfoutput>
    <b style="color:rgb(213, 26, 26);">Welcome #uCase(session.userId)#</b></cfoutput>
    <span class="fr"><a href="pdfview.cfm">
        <button class="prntbtn" title="view pdf">
        <img src="https://img.icons8.com/ios/50/fa314a/pdf--v1.png"/ alt="pdficon" 
        width="30">
    </button></a>
    <a href="excelview.cfm">
    <button class="prntbtn" title="view in excel">
        <img src="https://img.icons8.com/windows/32/26e07f/file-excel.png"/ alt="spreadsheet icon" 
        width="35">
    </button></a>
    <button class="prntbtn" title='print out' onclick="window.printpart()">
        <img src="https://img.icons8.com/color/48/000000/print.png" width="30" alt="print icon">
    </button>
    </span>
  </div>
</div>
<!--- contacts display tab --->
<div class="container">
  <!--- Profile info --->
  <div class="imgcont bgw ">
    <img src="https://i1.wp.com/soychef.es/wp-content/uploads/2016/11/user-1.png?resize=150%2C150"
     class="img-circle" width="75" alt="account image">
    <p id="userdet">
      <cfoutput>#uCase(session.userId)#</cfoutput>
    </p>
    <button class="cntct-btn" id="crtcnt" title="Create contact">Create Contact</button>
    <div class="pr">
        <form>
        
        </form>
    </div>
  </div><!--- imgcont close--->
  <!--- list of contacts  --->
  <div class="cntcttb">
  <cfscript>
    // contact handler object
    contObj=createObject('component','TASK9OrmT.components.contacthandler');
    contactData=contObj.showContact(session.userId);
  </cfscript>
  <cfoutput>
  <cfif not arrayIsEmpty(contactData)>
    <table class="table table-striped table-hover" id="pos">
      <thead>
        <tr>
        <th> </th>
        <th>NAME</th>
        <th>EMAIL</th>
        <th>PHONE</th>
        <th>     </th>
        <th>     </th>
        <th>     </th>
        </tr>
      </thead>
      <tbody>
      <cfloop array="#contactData#" index="contact">
      <tr>
        <cfif contObj.display(contact.getGender()) eq "Male">
          <td><img src="https://i1.wp.com/orangebabiesnamibia.com/wp-content/uploads/2020/01/User_Male-512.png?fit=512%2C512&ssl=1"
          	width="70" alt="male icon"></td>
        <cfelse>
          <td><img src="https://cdn0.iconfinder.com/data/icons/people-groups/512/User_Female-512.png" 
          	width="70" alt="female icon"></td>
        </cfif>
        <td>#uCase(contObj.display(contact.getTitle()&contact.getFname()&' '&
         contact.getLname()))#</td>
        <td>#contObj.display(contact.getMailid())#</td>
        <td>#contObj.display(contact.getPhone())#</td>
        <td><input type="hidden" value="#contObj.display(contact.getId())#">
        <button class="btn-custom openview" title='view details'>VIEW</button></td>
        <td><input type="hidden" value="#contObj.display(contact.getId())#">
            <button class="btn-custom openedit" title='edit contact'>EDIT</button></td>
        <td><input type="hidden" value="#contObj.display(contact.getId())#" class="refvalue">
            <button class="btn-custom opendelete" title='delete contact'>DELETE</button></td>
       </tr>
       </cfloop>
       </tbody>
    </table>
  <cfelse>
  	<div class="cntcttb">
  	
    <span><b>No Contact To Show!Please Add Contact.</b></span>
    </div>
  </cfif>
  </cfoutput>
 </div>
</div>
<!--- add contact form --->
<cfinclude template="../tempfiles/addcontact.cfm">
<!--- upload new contact data --->
<cfif isDefined('form.create')>
	<cfset addNew=contObj.newcontact()>
	<cfif addNew eq true>
	  <script>alert('contact added successfully')
	  $('#rfrsh').click()</script>
	<cfelse>
      <script>
      alert('Please check your inputs');
	    </script>
	</cfif>
</cfif>
<!--- templates for view/ edit / delete data --->
<cfinclude template="../tempfiles/viewdata.cfm">
<cfinclude template="../tempfiles/editdata.cfm">
<cfinclude template="../tempfiles/deletedata.cfm">
<!--- update contact info --->
<cfif isDefined('form.editinfo')>
  <cfset updated=contObj.updateInfo(form)>
  <cfif updated>
    <script>
    alert('contact updated succesfully');
    $('#rfrsh').click();
    </script>
  <cfelse>
    <script>alert('contact cannot be updated!Please try again!')</script>
  </cfif>
</cfif>
<!--- delete contact data --->
<cfif isDefined('form.cnfrmdlt')>
  <cfset contObj.deleteData()>
</cfif>
<cfinclude template="printview.cfm">
</body>
</html>

