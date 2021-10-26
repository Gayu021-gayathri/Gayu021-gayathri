<cfscript>
  // contact handler object
  contObj=createObject('component','TASK9OrmT.components.contacthandler');
  contactData=contObj.showContact(session.userId);
</cfscript>
<cfcontent type="application/pdf"/>
<cfdocument format="PDF">
  <cfdocumentitem type="header" >
  	<h4 style="text-align:center;">Printed with coldfusion</h4>
  </cfdocumentitem>
<cfoutput>
<div class="jumbotron" style="background-color: lightskyblue;
padding: 30px;text-align: center;">
	<h1>Address Book</h1> 
</div>
<h2>Contacts </h2>

<table class="table">
	<tr>
		<th style="padding: 20px;">Name</th>
		<th style="padding: 20px;">Email</th>
		<th style="padding: 20px;">Contact No.</th>
		<th style="padding: 20px;">Address</th>
		<th style="padding: 20px;">Pin code</th>
	</tr>
	<cfloop array="#contactData#" index="contact">
		<tr>
		<td style="padding: 20px;">#contObj.display(contact.getFname())#</td>
		<td style="padding: 20px;">#contObj.display(contact.getMailid())#</td>
		<td style="padding: 20px;">#contObj.display(contact.getPhone())#</td>
		<td style="padding: 20px;">#contObj.display(contact.getAddres())#</td>
		<td style="padding: 20px;">#contObj.display(contact.getZip())#</td>
	</tr>
</cfloop>
</table>
</cfoutput>
<cfdocumentitem type="footer">
	<cfoutput>
	<h4 style="text-align: center;">Page #cfdocument.currentPageNumber# of #cfdocument.totalPageCount#</h4>
</cfoutput>
</cfdocumentitem>
</cfdocument>

