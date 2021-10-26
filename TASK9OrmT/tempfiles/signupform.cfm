<div id="modal" style="margin-top:90px;">
<div id="signupbox"  class="frm1" style="background-color:whitesmoke;">
	<div class="left">
		<img class="logo" src="https://cdn1.iconfinder.com/data/icons/phone-call-3/400/Calls-18-512.png"
	        height="100" width="120" alt="logo" align="center">
	</div>
	<div class="right">
		<h3 class="title">SIGN UP</h3>
		<cfform method="post" name="myform">
			<cfinput name="f_name" type="text" required="true"
			class="inpfields" placeholder='Full Name' message="Name required">
			<cfinput name="mail_id" type="text" required="true"
			class="inpfields" placeholder='Email id'
			validate="Email"  message="Invalid email">
			<cfinput name="u_name" type="text" required="true"
			 class="inpfields" placeholder="Username" 
			 maxlength="10" message="username required" 
			 autocomplete="username" onchange="userExist()">
			 <span id="uexist">username exists !Try Another*</span>
			<cfinput name="u_pwd" type="password" required="true" id="p1"
			class="inpfields" placeholder="Password"  maxlength="20" 
			onvalidate="chkpwd" message="invalid password"
			 autocomplete="new-password">
			<cfinput name="c_pwd" type="password"required="true"
			class="inpfields" placeholder='Retype password' maxlength="10"
			message="Password missmatch" id="p2" onvalidate="pwdmatch" 
			autocomplete='new-password'>
			<cfinput name="newuser" type="submit" 
			value="Register" id="signupbtn" 
			class="loginbtn">
			
		</cfform>
	</div>
</div>

</div>
<!--- check for signup --->
<cfif isDefined('form.newuser')>
  <!--- check data & upload --->
  <cfset signup=userAcessObj.signup(form)>
  <cfif signup eq 'added'>
  	<script>alert('user added\nLogin to continue')</script>
  <cfelseif signup eq 'exists'>
  	<script>alert('username exists\nPlease try another')</script>
  <cfelseif signup eq 'invalid'>
  	<script>alert('Invalid inputs!!\nPlease try again')</script>
  </cfif>
</cfif>
