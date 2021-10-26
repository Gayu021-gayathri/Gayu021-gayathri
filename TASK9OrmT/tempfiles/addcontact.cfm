<div id="cntct-modal">
<div class="addform">
  <div class="cntctform">
  <div class="form-container">
  	<div class="well well-sm wellhd"><span align="center">CREATE CONTACT</span></div>
  	<h4 class="head2">Personal Contact</h4>
  	<form method="post" enctype="multipart/form-data"
     preservedata='true'>
  	  <div class="row">
  	    <div class="col-sm-3 hd">Title*</div>
  	    <div class="col-sm-5 hd">First Name*</div>
  	    <div class="col-sm-4 hd">Last Name*</div>	
  	  </div>
  	  <div class="row">
  	  	<div class="col-sm-3">
  	  	 <select name="title" class="frm" title="prefix">
  	  	   <option>Mr.</option>
  	  	   <option>Mrs.</option>
  	  	   <option>Miss.</option>
  	  	 </select>
  	  	</div>
  	    <div class="col-sm-5">
  	     <input type="text" name="firstname" required="required" class="form-control"
          placeholder="First Name">
  	    </div>
  	    <div class="col-sm-4">
  	     <input type="text" name="lastname" required="required" class="form-control"
          placeholder="Last Name">
  	    </div>
  	  </div>
  	  <div class="row">
  	    <div class="col-sm-6 hd">Gender*</div>
  	    <div class="col-sm-6 hd">DOB*</div>
  	  </div>
  	  <div class="row">
  	  	<div class="col-sm-6">
  	  	   <select name="gender" class="frm" title="gender">
  	  	   <option>Female</option>
  	  	   <option>Male</option>
  	  	   <option>Others</option>
  	  	 </select>
  	  	</div>
  	  	<div class="col-sm-6">
  	  	  <input type="date" name="dob" required="required" class="form-control"
           title="date of birth" >
  	  	</div>
  	  </div>
  	  <div class="row">
  	  	<div class="col-sm-10 hd">Upload photo</div>
  	  </div>
  	  <div class="row">
  	  	<div class="col-sm-10">
  	  		<input type="file" name="photo" class="form-control" title="photo upload">
  	  	</div>
  	  </div>
  	  <h4 class="head2">Contact Details</h4>
  	  <div class="row">
  	  	<div class="col-sm-6 hd">Address*</div>
  	  	<div class="col-sm-6 hd">Street*</div>
  	  </div>
  	  <div class="row">
  	  	<div class="col-sm-6 hd">
  	  		<input type="text" name="add" required="required"
  	  		class="form-control" placeholder="Addres">
  	  	</div>
  	  	<div class="col-sm-6 hd">
  	  		<input type="text" name="street" required="required"
  	  		class="form-control" placeholder="street Name" >
  	  	</div>
  	  </div>
  	  <div class="row">
  	  	<div class="col-sm-6 hd">State*</div>
  	  	<div class="col-sm-6 hd">Zip code*</div>
  	  </div>
  	  <div class="row">
  	  	<div class="col-sm-6 hd">
  	  		<input type="text" name="state" required="required"
  	  		class="form-control" placeholder="State" >
  	  	</div>
  	  	<div class="col-sm-6 hd">
  	  		<input type="text" name="zip" required="required"
  	  		class="form-control" placeholder="Pincode">
  	  	</div>
  	  </div>
  	  <div class="row">
  	  	<div class="col-sm-6 hd">Email*</div>
  	  	<div class="col-sm-6 hd">phone Number*</div>
  	  </div>
  	  <div class="row">
  	  	<div class="col-sm-6 hd">
  	  		<input type="text" name="cmail" required="required"
  	  		class="form-control" placeholder="Contact Mail">
  	  	</div>
  	  	<div class="col-sm-6 hd">
  	  		<input type="text" name="cnum" required="required"
  	  		class="form-control" placeholder="Contact No.">
  	  	</div>
  	  </div>
  	  <div class="row lrow">
  	  	<div class="col-sm-2"></div>
  	  	<div class="col-sm-3">
  	  	  <input type="submit" name="create" Value="Create Contact" class="btn"></div>
  	  	 <div class="col-sm-2"></div>
  	  	 <div class="col-sm-3">
  	  	 	<input type="button" name="cancel" class="btn" 
  	  	 	value="cancel" id="cancel" title="cancel">
  	  	 </div>
  	  </div>
  	</form>
  </div> 

  </div>
</div>
</div>