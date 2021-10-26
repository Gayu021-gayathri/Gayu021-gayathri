component persistent="true" table="ormusers" {

    property name="id" column="userid" fieldtype="id" generator="increment";
    property name="username";
    property name="userpass";
    property name="usermail";
    property name="fullname";
    property name="contact" type="array" cfc="ormcontacts" fieldtype="one-to-many" fkcolumn="userid" ;

}