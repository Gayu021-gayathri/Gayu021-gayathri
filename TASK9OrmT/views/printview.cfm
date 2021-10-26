<div id="toprint" align="center" style="display:none;">
  <h1>Contacts</h1>
  <p><i>Powered by Address Book</i></p>
 
  <cfoutput>
  <table>
  <tr>
    <th style="padding: 15px;">Name</th>
    <th style="padding: 15px;">Email</th>
    <th style="padding: 15px;">Contact No.</th>
    <th style="padding: 15px;">Address</th>
    <th style="padding: 15px;">Pin code</th>
  </tr>
  <cfloop array="#contactData#" index="contact">
    <tr>
    <td style="padding: 15px;">#contact.getFname()#</td>
    <td style="padding: 15px;">#contact.getMailid()#</td>
    <td style="padding: 15px;">#contact.getPhone()#</td>
    <td style="padding: 15px;">#contact.getAddres()#</td>
    <td style="padding: 15px;">#contact.getZip()#</td>
  </tr>
</cfloop>
</table>
</cfoutput>

</div>