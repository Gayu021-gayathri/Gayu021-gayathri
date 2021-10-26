<cfsavecontent variable="header">
<div id="navbar">
	<img src="https://cdn1.iconfinder.com/data/icons/phone-call-3/400/Calls-18-512.png" alt="logo" 
	height="50" width="55">
	<span>ADDRESS BOOK</span>
	
	<div id="links">
	<cfif structKeyExists(session,'signin') and 
	      session.signin eq false>
		
		<button class="logout" type="button" name="signup" id="signup" title='signup'>
		<span class="logs"><span class="glyphicon glyphicon-user"></span>Sign Up</span></button>
		<button class="logout" type="button" name="login" id="login" title='login'>
		<span class="logs"><span class="glyphicon glyphicon-log-in"></span> Login</span>
	    </button>
    <cfelse>
   		<cfform action="/TASK9OrmT/components/useraccess.cfc?method=logout">
   			<button class="logout" type="submit" name="logout" title='logout'>
   				<span class="logs"><span class="glyphicon glyphicon-log-out"></span> Logout</span>
   			</button>
   		</cfform> 	
    </cfif>
	</div>
	
</div>
</cfsavecontent>
