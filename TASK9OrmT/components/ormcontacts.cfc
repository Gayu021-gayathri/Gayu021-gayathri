component persistent='true'{

    property name="id" column="contactid" fieldtype="id" generator="increment";
    property name="title";
    property name="fname";
    property name="lname";
    property name="gender";
    property name="dob";
    property name="filepath";
    property name="addres";
    property name="street";
    property name="county";
    property name="zip";
    property name="mailid";
    property name="phone";
    // property name="userid";
    property name="user" fieldtype="many-to-one" fkcolumn="userid"
    cfc="ormusers" lazy="true";

   

}