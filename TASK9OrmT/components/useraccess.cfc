component{
	// helper function to canonicalise data
	public function decodescope(required struct scope) output=false{
			var key="";
			for (key in arguments.scope){
				if(isSimpleValue(arguments.scope[key])){
					try{
						arguments.scope[key]=canonicalize(arguments.scope[key],true,true);
						
					}
					catch (any cfactch){
						cflog( text='#key#', application=true, file="encodingErrors", type="error" );
	                    arguments.scope[key] = " ";
					}
				}
			}
			return arguments.scope;
		}
	// helper function to check validity
	public function chkvalid(required struct scope){
         if (isValid('email',scope.Ecmail) and 
         	isValid('telephone',scope.Ecnum)){
         	return true;
         }
         else {
         	return false;
         }
	}
	// user validation function
	remote string function userValid(){
		decodescope(arguments);
		
		//retrive user data
        try{
          userdata=entityLoad('ormusers',{username='#arguments.j_username#'});
          if (arrayIsEmpty(userdata)){
          	return 'invalid';
          }
          else if(userdata[1].Userpass eq '#arguments.j_password#'){
          	// 
          	cflock( timeout="20",scope="Session",type="exclusive" ){
          		session.signin=true;
          		session.userId=arguments.j_username;
          	}
          	return 'loggedin';
          }
          else{
          	return 'missmatch';
          }
        }catch (any e){
        	// document error here and return
        	return 'error';
        }
	}

	// function to signup 
	public string function signup(required struct scope){
		arguments.scope=decodescope(arguments.scope);
		// check if inputs are valid
		if (isValid('email',form.mail_id)){
			// check if username exists
			chkUsername=entityLoad('ormusers',{username=scope.u_name});
			if (arrayIsEmpty(chkUsername)){
				transaction{
				  newUser=entityNew('ormusers');
				  newUser.setUsername(form.u_name);
				  newUser.setUserpass(form.u_pwd);
				  newuser.setFullname(form.f_name);
	  	          newuser.setUsermail(form.mail_id);
	  	          entitySave(newuser);
				}
				return 'added';
			}else{
				// username exists
				return 'exists';
			}
		}else{
			// inputs are invalid
			return 'invalid';
		}

	}

	// oauth login 
	public void function oauthuser(required struct scope){
   decodescope(scope);
   if (scope.oauthmail neq 'undefined'
       or trim(scope.oauthmail) neq ''){
     userdata=entityLoad('ormusers',{usermail=scope.oauthmail});
    }else{
     userdata=entityLoad('ormusers',{username=scope.oauthname});
    }
   if (arrayIsEmpty(userdata)){
   //no existing user, create a new user
     transaction{
     	new_acnt=entityNew('ormusers');
     	new_acnt.setUsername(scope.oauthname);
     	new_acnt.setUserpass('PASSWORD');
     	new_acnt.setUsermail(scope.oauthmail);
     	new_acnt.setFullname(scope.oauthname);
     	entitySave(new_acnt);
     }
     // login user
     cflock( timeout="20",scope="Session",type="exclusive" ){
          		session.signin=true;
          		session.userId=scope.oauthname;
          	}
   }else{
   	// user exists 
   	cflock( timeout="20",scope="Session",type="exclusive" ){
          		session.signin=true;
          		session.userId=userdata[1].getUsername();
          	}
   } 
	}

  // logout 
	remote void function logout(){
		structClear(session);
		location('/TASK9OrmT/');
	}
	// check for username availability
	remote string function uexist(val){
		decodescope(arguments);
		chkUsername=entityLoad('ormusers',{username=arguments.value});
		if(arrayIsEmpty(chkUsername)){
			return 'false';
		}else{
			return 'true';
		}
	}
  
}