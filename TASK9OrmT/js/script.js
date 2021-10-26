$(document).ready(function(){
  // ajax login submit
   $('#loginform').submit(function(e){
     e.preventDefault();
     $('#loaderimg').show();
     var frm= $(this);
     var url=frm.attr('action');
     $.ajax({
      type:'post',
      url:url,
      data:frm.serialize(),
      success:function(data){
        var v=$(data).find('string')[0].innerHTML;
        if (v == 'invalid' || v=='error'){
          $('#demo').show();
        }else if (v=='missmatch'){
          $('#lgnPwd').css('background-color','#f2dede');
          $('#lgnPwd').css('border','1px solid red')
        }
        else{
          $('#loginbtn').hide();
          $('#logok').show();
          window.location.reload();
        }
        $('#loaderimg').hide();
      },
      error:function(er){
        alert(er);
        $('#loaderimg').hide();
      }
     });
   });
   $('#modal').hide();
   // login modal show
   $('#login').click(function(){
      $('#modal').fadeOut();
      $('#loginbox').show();
   });
   // signup form modal display
   $('#signup').click(function(){
      $('#loginbox').hide();
      $('#modal').fadeIn(350);
   });
   // login display close
   $('#close').click(function(){
      $('#modal').hide();
      $('#loginbox').show();
   });
   // add contact modal display
      $('#crtcnt').click(function(){
      $('#cntct-modal').fadeIn(400);
   });
   // add contact modal close
      $('#cancel').click(function(){
      $('#cntct-modal').fadeOut(300);
   });
   // sign up link 
      $('#newacnt').click(function(){
      $("#signup").click();
   });
  // open view template
      $('.openview').click(function(){
       var ref =$(this).prev().val();
       viewdetail(ref);
   });
  // close view
      $('#closeview').click(function(){
      $('#view').hide();
   });
   // async function to view contact details 
   // on view btn click event
  var viewdetail = function(ref){ 
  // create an instance of the proxy. 
    var e = new asy(); 
    // Setting a callback handler for the proxy automatically makes 
    // the proxy's calls asynchronous. 
    e.setCallbackHandler(populatedata); 
    e.setErrorHandler(myErrorHandler); 
    // The proxy getdata function represents the CFC 
    // getdata function. 
    e.getdata(ref); 
  } 
  var myErrorHandler=function(code,msg){
    alert(msg);
  }
  var populatedata =function(data){
    // populate data
    $('#viewtb').html(
      "<table>"+
      '<tr><td class="items">Name</td>'+
      '<td class="text-danger">: '+
       data.fullname.toUpperCase()+'</td></tr>'+
      '<tr><td class="items">Gender</td>'+
      '<td>: '+data.gender+'</td></tr>'+
      '<tr><td class="items">Date of Birth:</td>'+
      '<td>: '+data.dob+'</td></tr>'+
      '<tr><td class="items">Address</td>'+
      '<td>: '+data.addres+'</td></tr>'+
      '<tr><td class="items">Pincode</td>'+
      '<td>: '+data.zip+'</td></tr>'+
      '<tr><td class="items">Email</td>'+
      '<td>: '+data.mailid+'</td></tr>'+
      '<tr><td class="items">Phone:</td>'+
      '<td>: '+data.phone+'</td></tr></table>'
    );
    $('#view').fadeIn(350);
  }
  // update info function
  $('.openedit').click(function(){
    var ref=$(this).prev().val();
    var edit=new asy();
    edit.setCallbackHandler(updateform); 
    edit.setErrorHandler(myErrorHandler);
    edit.getdata(ref);
  });
  // close edit view
  $('#Ecancel').click(function(){
    $('#editModal').fadeOut(350);
  });
  // populate edit template
  var updateform= function(data){
    $('#Efname').val(data.fname);
    $('#Etitle').val(data.title);
    $('#Elname').val(data.lname);
    $('#Egender').val(data.gender);
    $('#Edob').val(data.dob);
    $('#Eaddres').val(data.addres);
    $('#Estreet').val(data.street);
    $('#Ecounty').val(data.county);
    $('#Ezip').val(data.zip);
    $('#Emailid').val(data.mailid);
    $('#Ephone').val(data.phone);
    $('#contid').val(data.id);
    $('#editModal').fadeIn(350);
  }
  // open delete template
  $('.opendelete').click(function(){
    var ref =$(this).prev().val();
    $('#dltref').val(ref);
    var e=new asy();
    e.setCallbackHandler(confirmchoice);
    e.setErrorHandler(myErrorHandler);
    e.getbasic(ref);
  });
  // alert for delete confirmation
  var confirmchoice=function(data){
    $('#showbasic').html(
      'Name  :'+data.fullname+
      '<br>Phone :'+data.phone+
      '<br>Email :'+data.mailid
    );
    $('#mymodal').modal();
  }

});
// pwd input match validation 
function pwdmatch(frm,inp,val){
  if ($('#p1').val() != val){
     return false;
  }else{
     return true;
  }
}
// pwd strongness validity
function chkpwd(frm,inp,val){
  var regex = "^(?=.*[0-9])"
                       + "(?=.*[a-z])(?=.*[A-Z])"
                       + "(?=.*[@#$%*!^&+=])"
                       + "(?=\\S+$).{8,20}$";
  var p = val.match(regex);
  if(p == null){
    alert('Password must contain atleast 1 uppercase,1 lowercase \n'+
      'and 1 special charcter(min length 8)')
    return false;
  }else{
    return true;
  } 
}
// google oauth api 
gapi.load('auth2',function(){
    gapi.auth2.init();
  });
// fb async api
window.fbAsyncInit = function() {
    FB.init({
      appId      : '154095826837941',
      cookie     : true,
      xfbml      : true,
      version    : 'v11.0'
    });
    FB.AppEvents.logPageView();   
};
(function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
    FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
});
function checkLoginState() {
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
});
function statusChangeCallback(response){
    // console.log(response);
    FB.api('/me', { locale: 'en_US', fields: 'name, email,id' },
        function(response) {
          console.log(response.email);
          console.log(response.id);
          console.log(response.name);
           $('#fbmail').val(response.email);
           $('#fbname').val(response.name);
          $('#fbid').val(response.id);
          $('#fbsubmit').click();
        }
      );  
    }
}
// google sigin function
function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
  var id_token = googleUser.getAuthResponse().id_token;
  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
  signOut();
  var name = profile.getName();
  var imgsrc=profile.getImageUrl();
  var clientmail=profile.getEmail();
  $('#gname').val(name);
  $('#gmail').val(clientmail);
  $('#gsubmit').click();
  console.log('Name ' + name);
  //console.log('imgsrc' + imgsrc);     
}
function signOut() {
   var auth2 = gapi.auth2.getAuthInstance();
   auth2.signOut().then(function () {
   console.log('User signed out.');
   });
}
// async function to view contact details 
// on view btn click event
var viewdetail = function(ref){ 
  // create an instance of the proxy. 
  var e = new asy(); 
  // Setting a callback handler for the proxy automatically makes 
  // the proxy's calls asynchronous. 
  e.setCallbackHandler(populatedata); 
  e.setErrorHandler(myErrorHandler); 
  // The proxy getdata function represents the CFC 
  // getdata function. 
  e.getdata(ref); 
} 
var myErrorHandler=function(code,msg){
  alert(msg);
}
var populatedata =function(data){
  var fullname= data.title+data.fname.toUpperCase()+' '+
  data.lname.toUpperCase();
  // populate data
  $('#viewtb').html(
    "<table>"+
    '<tr><td class="items">Name</td>'+
    '<td class="text-danger">: '+fullname+'</td></tr>'+
    '<tr><td class="items">Gender</td>'+
    '<td>: '+data.gender+'</td></tr>'+
    '<tr><td class="items">Date of Birth:</td>'+
    '<td>: '+data.dob+'</td></tr>'+
    '<tr><td class="items">Address</td>'+
    '<td>: '+data.addres+","+data.county+'</td></tr>'+
    '<tr><td class="items">Pincode</td>'+
    '<td>: '+data.zip+'</td></tr>'+
    '<tr><td class="items">Email</td>'+
    '<td>: '+data.mailid+'</td></tr>'+
    '<tr><td class="items">Phone:</td>'+
    '<td>: '+data.phone+'</td></tr></table>'
  );
  $('#view').fadeIn(350);
}
function printpart() {
    var printwin = window.open("");
    printwin.document.write(document.getElementById("toprint").innerHTML);
    printwin.stop();
    printwin.print();
    printwin.close();
}
function userExist(){
    var val =$('#u_name').val();
    var strx={'value':val};
    $.ajax({
      type:'post',
      url:'/TASK9OrmT/components/useraccess.cfc?method=uexist',
      data:strx,
      success:function(data){
        var e=$(data).find('string')[0].innerHTML;
        if (e=='true'){
          $('#signupbtn').prop('disabled',true);
          $('#uexist').show();
          $('#u_name').css('background-color','#f2dede');
        }else{
          $('#signupbtn').prop('disabled',false);
          $('#uexist').hide();
          $('#u_name').css('background-color','#dff0d8');
        }
      },
      error:function(data){
        alert(data);
      }
    });
}
