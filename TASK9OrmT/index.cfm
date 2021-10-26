<cfif session.signin eq true>
  <cflocation url="views/contactbook.cfm">
</cfif>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="google-signin-client_id" content="7686540719-lnrb2ha2gqiv603ublt9c3omaa2012hq.apps.googleusercontent.com">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/styles.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <title>AddressBook</title>
  <script src="https://apis.google.com/js/platform.js" async defer></script>
  <script type="text/javascript" src="js/script.js"></script>  
</head>
<body>

<cfinclude template="shared/header.cfm">
<cfoutput>#header#</cfoutput>

<cfset userAcessObj=createObject('component','components.useraccess'>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v11.0&appId=154095826837941&autoLogAppEvents=1" nonce="yk5i4Dr9"></script>
<!--- login form shown on login btn click --->
 <div id="loginbox">
   <div  class="left">
     <img class="logo" src="https://cdn1.iconfinder.com/data/icons/phone-call-3/400/Calls-18-512.png"
         height="100" width="120" alt="logo" align="center">
   </div>
   <div class="right">
     <h3 class="title">LOGIN</h3>
     <cfoutput>
     <form  method="post" id="loginform"
      name="loginform" 
      action="components/useraccess.cfc?method=userValid">
       <input class="inpfields" type="text" name="j_username" id="lgnUser"  
       required="true" placeholder="Username" autocomplete="username">
       <input class="inpfields" name="j_password" type="password" required="true" placeholder="Password" 
       maxlength="20" autocomplete="current-password" id="lgnPwd" >
       <p id="demo">invalid credentials*</p>
       <button class="loginbtn" type="submit" name="userLogin"
        title="Login Button" id="loginbtn"
        >LOGIN</button>
     </form>
       <img src="https://c.tenor.com/XK37GfbV0g8AAAAi/loading-cargando.gif"
        width="30" id="loaderimg" />
       <span id="logok" class="text-success">
       <img src="https://www.legalpillers.com/wp-content/uploads/2020/09/success.gif"
        width="50"/><strong>Logged in</strong><small>&nbspRedirecting..</small></span>
     <p class="signintext">Or Sign in using </p>
     
     <div class="g-signin2" id="gbutton" data-onsuccess="onSignIn" data-theme='dark'></div>
    
     <div class="fb-login-button" data-width="" data-size="medium" data-button-type="login_with" data-layout="rounded" data-auto-logout-link="false" data-use-continue-as="false" scope="public_profile,email"
            onlogin="checkLoginState();" id="fbbutton" 
            ></div>
    
     <p align="center" class="pstyle">
      Don't Have an Account?<a id="newacnt">Register Here</a></p>
    </cfoutput>
 </div>
</div>
<cfinclude template="tempfiles/signupform.cfm">
<cfform style="display:none">
<cfinput name="oauthname" type="hidden" id="fbname">
<cfinput name="oauthmail" type="hidden" id="fbmail">
<cfinput name="oauthid" type="hidden" id="fbid">
<cfinput name="fbsubmit" type="submit" id="fbsubmit">
</cfform>
<cfform style="display:none" >
 <cfinput type="text" name="oauthname" id="gname" value="myname">
 <cfinput name="oauthmail" type="text" id="gmail" value="mymail">
 <cfinput name="gsubmit" type="submit" id="gsubmit">
</cfform>
<!--- check for login oauthdata --->
<cfif isDefined('form.gsubmit') or
      isDefined('form.fbsubmit')>
  <cfset userAcessObj.oauthuser(form)>
  <cflocation url="index.cfm">
</cfif>
</body>
</html>


