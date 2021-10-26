component{
	this.name='Contactbook';
	this.sessionManagement=true;
	this.sessionTimeout=createTimespan(0,0,20,0);
	this.datasource = "edu";
    this.ormEnabled = true;
    this.ormSettings = { logsql : true };
    this.invokeImplicitAccessor = true
	this.ormSettings.cflocation='/TASK9OrmT/components/';
	
	this.scriptProtect="all";
	this.lgnPage='/TASK9OrmT/index.cfm';
	this.authPage='/TASK9OrmT/components/useraccess.cfc';

	
    public void function onRequestStart(targetPage){
    	
        cfparam( name="session.signin",type="boolean",default="false" );
    	
    	if (not structKeyExists(session,'userId')){
    		if (not ((targetPage eq this.lgnPage) or
    		        (targetPage eq this.authPage))){
    			location('/TASK9OrmT/index.cfm');
    		}
    	} 
    }

    

}