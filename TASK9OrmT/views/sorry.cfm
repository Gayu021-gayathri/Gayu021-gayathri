<img src="https://th.bing.com/th/id/R.63df95953ba78c808a1c6db1c472de86?rik=IwKSr2fTBdyL7g&riu=http%3a%2f%2f1.bp.blogspot.com%2f-1T2uTBQ-5RQ%2fVAxRDK2ApSI%2fAAAAAAAALxA%2fFAkzLN1K_sU%2fs1600%2foops-smiley.jpg&ehk=BXRiBsYtLtwdirD%2fGlwkD7h0S8z3Ntiu11%2beUA1TM%2fg%3d&risl=&pid=ImgRaw&r=0" 
width="150">
<h3>There seems to be an error!<br>
Please contact web administrator</h3>
<cfscript>
cfmail( 
			  from="gayathrimolg98@gmail.com", 
			  subject="An error has occured", 
			  to="gayathrimolg98@gmail", 
			  type='html'){
			   writeOutput("
               Message: #arguments.exception.message#<br>
               Detail:#arguments.exception.detail#
               Type: #arguments.exception.type#<br>
        ");
		}
</cfscript>