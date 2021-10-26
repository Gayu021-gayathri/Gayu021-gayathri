<div class="container" >
 <div class="modal fade" role='dialog' id="mymodal">
   <div class="modal-dialog">
   <div class="modal-content">
   	<div class="modal-header bg-info">
   		<h4 class="modal-title text-warning pd20">
   		<span class="glyphicon glyphicon-alert"></span>&nbsp&nbspDelete Contact</h4></div>
   	<div class="modal-body text-danger text-center pd20">
    The Selected contact will be deleted <br>
    Are you sure ?<br>
    
    <span class="text-primary" id="showbasic">
    </span>
   	</div>
   	<div class="modal-footer pd20">
   	<cfform method="post" preservedata="false">
   		<cfinput name="dltref" id="dltref"
   		type="hidden">
    <button title='confirm delete' type="submit" class="btn btn-danger" id="deletecnt" style="float: left;" name="cnfrmdlt">
    	<span class="glyphicon glyphicon-trash"></span>
        &nbsp&nbspDelete
    </button>
    </cfform>
    <button title='abort'class="btn btn-default" data-dismiss='modal' style="float:right;">
    	Cancel
    </button>
   	</div>
   </div>
 </div>
</div>
</div>