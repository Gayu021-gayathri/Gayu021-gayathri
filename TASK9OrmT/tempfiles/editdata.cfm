<div id="editModal">
  <div class="addform" id="editcontactfrm">
  	<div class="cntctform">
  	  <div class="form-container">
  	  	<div class="well well-sm wellhd"><span align="center">EDIT CONTACT</span></div>
  	  	<h4 class="head2">Personal Contact</h4>
  	  	<cfoutput>
  	    <form method="post" enctype="multipart/form-data"
        preservedata='false'>
  	    <div class="row">
  	      <div class="col-sm-3 hd">Title*</div>
  	      <div class="col-sm-5 hd">First Name*</div>
  	      <div class="col-sm-4 hd">Last Name*</div>	
  	    </div>
  	    <div class="row">
  	    	<div class="col-sm-3">
  	  	  <select name="Etitle" class="frm" id="Etitle" title="salutation">
  	  	   <option>Mr.</option>
  	  	   <option>Mrs.</option>
  	  	   <option>Miss.</option>
  	  	  </select>
  	  	  </div>
  	      <div class="col-sm-5" id="ac1">
  	       <input type="text" name="Efirstname" required="required" class="form-control" id="Efname" title="firstname">
  	      </div>
  	      <div class="col-sm-4">
  	       <input type="text" name="Elastname"class="form-control"
           id="Elname" title="lastname">
  	      </div>
  	     </div>
  	    <div class="row">
  	      <div class="col-sm-6 hd">Gender*</div>
  	      <div class="col-sm-6 hd">DOB*</div>
  	    </div>
  	    <div class="row">
  	  	  <div class="col-sm-6">
  	  	    <select name="Egender" class="frm" id="Egender" title="gender">
  	  	     <option>Female</option>
  	  	     <option>Male</option>
  	  	     <option>Others</option>
  	  	    </select>
  	  	  </div>
  	  	  <div class="col-sm-6" id="ac2">
  	  	   <input type="date" name="Edob" required="required" class="form-control" id="Edob" title="date of birth">
  	  	  </div>
  	    </div>
  	    <div class="row">
  	  	  <div class="col-sm-10 hd">Upload photo</div>
  	    </div>
  	    <div class="row">
  	  	  <div class="col-sm-10">
  	  	  	<input type="file" name="photo" class="form-control"
            title="photo upload">
  	  	  </div>
  	    </div>
  	    <h4 class="head2">Contact Details</h4>
  	    <div class="row">
  	  	  <div class="col-sm-6 hd">Address*</div>
  	  	  <div class="col-sm-6 hd">Street</div>
  	    </div>
  	    <div class="row">
  	  	  <div class="col-sm-6 hd" id="ac3">
  	  		  <input type="text" name="Eadd" required="required"
  	  		  class="form-control" id="Eaddres" title="address">
  	  	  </div>
  	  	  <div class="col-sm-6 hd">
  	  		  <input type="text" name="Estreet"
  	  		  class="form-control" id="Estreet" title="street">
  	  	  </div>
  	    </div>
  	    <div class="row">
  	  	  <div class="col-sm-6 hd">State*</div>
  	  	  <div class="col-sm-6 hd">Zip code*</div>
  	    </div>
  	    <div class="row">
  	  	  <div class="col-sm-6 hd" id="ac4">
  	  	  	<input type="text" name="Estate" required="required"
  	  	  	class="form-control" id="Ecounty" title="state">
  	  	  </div>
  	  	  <div class="col-sm-6 hd" id="ac5">
  	  	  	<input type="text" name="Ezip" required="required"
  	  	  	class="form-control" id="Ezip" title="pincode">
  	    	</div>
  	    </div>
  	    <div class="row">
  	  	  <div class="col-sm-6 hd">Email*</div>
  	  	  <div class="col-sm-6 hd">phone Number*</div>
  	    </div>
  	    <div class="row">
  	  	  <div class="col-sm-6 hd" id="ac6">
  	  	  	<input type="text" name="Ecmail" required="required"
  	  		  class="form-control" id="Emailid" title="mail id">
  	  	  </div>
  	  	  <div class="col-sm-6 hd" id="ac7">
  	  		  <input type="text" name="Ecnum" required="required"
  	  	  	class="form-control" id="Ephone" title="phone number">
            <input type="hidden" name="contid" id="contid">
  	  	  </div>
  	    </div>
  	    <div class="row">
  	  	  <div class="col-sm-2"></div>
  	  	  <div class="col-sm-3">
  	  	    <input type="submit" name="editinfo" Value="edit contact" class="btn btn-info"></div>
  	  	  <div class="col-sm-2"></div>
  	  	  <div class="col-sm-3">
  	  	 	  <input type="button" name="Ecancel" class="btn btn-danger" 
  	  	 	  value="cancel" id="Ecancel">
  	  	  </div>
  	    </div>
  	    </form>
        </cfoutput>
  	  </div>
    </div>
  </div>
</div>
