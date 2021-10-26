component hint="handles request for contacts"{
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
  // helper function to get contacts 
  public array  function showContact(required string uId){
  	contData = entityLoad('ormusers',{username=arguments.uId},true);
  	if (contData.hasContact()){
  		return contData.getContact();
  	}else{
  		return [];
  	}
  }
  // helper function to safe display 
  public  function display(required scope){
  	for (item in scope){
  		item = encodeForHTML(item);
  	}
  	return scope;
  }
 // helper function to validate contacts addition 
  public function isnone(scope){
    for (item in scope){
   	  if (item eq 'photo'){continue;}
   	  else if(trim(item) eq ''){
   	  	return true;
   	  }
    }
    return false;
  }
   // helper function to upload photo
   public string function addphoto(){
   	var filesrc='no image';
   	if (isDefined('form.photo') and form.photo neq ''){
   		try{
        pic=fileUpload('#getTempDirectory()#','form.photo',
        	             'image/jpg,image/png,image/jpeg',
        	              'makeunique');
        // check if file is valid 
        if (listFindNoCase('jpg,jpeg,png',pic.serverfileExt)){
        	filesrc='no image';
        }else{
        	filesrc=pic.serverfile;
        }        
   		}catch (any e){
   			filesrc='no image';
   		}
   	}else{
   		filesrc='no image';
   	}
   	return filesrc;
   }
   // helper function to add contact
  public boolean function addnew(required struct scope){
  	 // upload photo
  	 if (not scope.photo eq ''){
      filesrc=addphoto();
  	 }else{
  	 	filesrc='no image';
  	 }
  	 try{
	     transaction{
	     	user=entityLoad('ormusers',{username=session.userId},true);
	     	newcontact=entityNew("ormcontacts",{title=scope.title,
	            fname=scope.firstname,lname=scope.lastname,gender=scope.gender,
	            dob=scope.dob,filepath=filesrc,addres=scope.add,
	            street=scope.street,county=scope.state,zip=scope.zip,
	            mailid=scope.cmail,phone=scope.cnum});
	        entitySave(newcontact);
	        user.addContact(newcontact);
	        entitySave(user);
	        return true;
	               }
        }catch(any e){
	    	return false;
	                 }

  }
  // adding new contact to a user
  remote boolean function newcontact() output='false'{
    if (structKeyExists(session,'signin') 
	     and isDefined('form.create')){
        decodescope(form);
    // check if inputs are valid
        if(not isnone(form) and 
      	isValid('email',form.cmail) and
      	isValid('telephone',form.cnum) and 
      	form.dob lt now()){
      	   if (addnew(form)){
      	     return true;
      	   }else{
      	   	return false;
      	   }
        }
      else{
      	return false;
      }

	 }
   
	}
	//function to update contact info
	public boolean function updateInfo(required struct scope){
		
		compObj=createObject('component','TASK9OrmT.components.useraccess');
		// check for photo
		if (scope.photo neq ''){
			filesrc=addphoto();
		}else{
			filesrc='no image';
		}
		// check for null values
    if (not isnone(scope) and not compObj.chkvalid(scope)){
    	return false;
    }
    //canonicalize
    scope=decodescope(scope);
    try{
    	transaction{
    		edit_Contact=entityLoad("ormcontacts",{id=form.contid},true);
        edit_contact.setTitle(form.Etitle);
        edit_contact.setFname(form.Efirstname);
        edit_contact.setLname(form.Elastname);
        edit_contact.setGender(form.Egender);
        edit_contact.setDob(form.Edob);
        edit_contact.setFilepath(filesrc);
        edit_contact.setAddres(form.Eadd );
        edit_contact.setStreet(form.Estreet);
        edit_contact.setCounty(form.Estate);
        edit_contact.setZip(form.Ezip);
        edit_contact.setMailid(form.Ecmail);
        edit_contact.setPhone(form.Ecnum);
        entitySave(edit_contact);
    	}
    	return true;
    }catch (any e){
    	return false;
    }

	}
	// function to delete contact data
	public void function deleteData(){
		try{
			transaction{
				dltuser=entityLoad('ormcontacts',{id=form.dltref},true);
				entityDelete(dltuser);
			}
			writeOutput("<script>alert('contact Deleted');
      document.getElementById('rfrsh').click();</script>");
		}catch (any e){
			writeOutput("<script>alert('contact cannot be deleted');
      </script>");
		}
	}
}
