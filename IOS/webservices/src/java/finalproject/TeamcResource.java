/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalproject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


/**
 * REST Web Service
 *
 * @author 1590175
 */
@Path("teamc")
public class TeamcResource {
  String sql2;
    Connection myCon = null;
    Statement myStmt = null;

    public void NoVishwash(String input) {
        sql2 = input;
    }
    @Context
    private UriInfo context;

    /**
     * Creates a new instance of TeamcResource
     */
    public TeamcResource() {
    }
 @Path("login&{username}&{password}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String login(@PathParam("username") String username, @PathParam("password") String password) throws SQLException {
      JSONObject JSON_output = new JSONObject();
        
        try{
           Class.forName("oracle.jdbc.OracleDriver");
            myCon = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "HR", "cegepgim");
            
            
            
          
          myStmt = myCon.createStatement();
        char kamal = username.charAt(0);
        NoVishwash("SELECT username, password FROM HR.TC_USERS where username like '" + kamal + "%'");
        ResultSet myResult = myStmt.executeQuery(sql2);
       
        String confirmUsername;

        boolean flag = true;
        while (myResult.next() && flag) {
            String uName = myResult.getString("username");
            if (uName.equals(username)) {
                confirmUsername = username;
                NoVishwash("SELECT username, password froM HR.TC_USERS where username = '" + confirmUsername + "'");
                ResultSet myResult2 = myStmt.executeQuery(sql2);
                while (myResult2.next()) {
                    String confirmPassword = myResult2.getString("password");
                    if (confirmPassword.equals(password)) {
                        //return "true";
                        return getJson2(username);
                    }
                }
                flag = false;
                return "there is something wrong";
            }
        }

        return null;
      }
      
      catch(SQLException e)
      {
          JSON_output.accumulate("Status", "Wrong");
          int j = (int) (new Date().getTime() / 1000);
        JSON_output.accumulate("timeStamp", j);
        JSON_output.accumulate("Username",username);
         return JSON_output.toString();
      } catch (ClassNotFoundException ex) {
          
            JSON_output.accumulate("Status", "Error");
          int j = (int) (new Date().getTime() / 1000);
        JSON_output.accumulate("timeStamp", j);
        JSON_output.accumulate("message","java.lang.ClassNotFoundException");
           return JSON_output.toString();
        }
    }
    
     @Path("userprofile&{gn}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getJson2(@PathParam("gn") String parm) throws SQLException {
   
   JSONObject JSON_output = new JSONObject();
      try {
           Class.forName("oracle.jdbc.OracleDriver");
            myCon = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "HR", "cegepgim");
        myStmt = (Statement) myCon.createStatement();
        NoVishwash("SELECT * FROM HR.TC_USERS where username= '" + parm + "'");
        ResultSet myResult = myStmt.executeQuery(sql2);
       
        JSON_output.accumulate("Status", "ok");
        int j = (int) (new Date().getTime() / 1000);
        JSON_output.accumulate("timeStamp", j);
        JSONArray array = new JSONArray();
        int i = 0;
        while (myResult.next()) {
            JSONObject index = new JSONObject();
            Integer id = myResult.getInt("user_id");
            
            String uName = myResult.getString("username");
            if(uName != null)
            {index.accumulate("Username", uName);}
            
            String fName = myResult.getString("first_name");
            if(fName != null )
            {index.accumulate("first_name", fName);}
            
            String lName = myResult.getString("last_name");
            if(lName != null )
            {index.accumulate("last_name", lName);}
            
            String email = myResult.getString("email_id");
            if(email != null )
            {index.accumulate("email id", email);}
            
            Integer age = myResult.getInt("age");
            if(age != null )
            { index.accumulate("Age", age);}
            
            Double height = myResult.getDouble("height");
            if(height != null )
            {index.accumulate("height", height);}
            
            Double weight = myResult.getDouble("weight");
            if(weight != null )
            {index.accumulate("weight", weight);}
            
            String sex = myResult.getString("sex");
            if(sex != null )
            {index.accumulate("sex", sex);}
            
            String btype = myResult.getString("bodytype");
            if(btype != null )
            {index.accumulate("Body type", btype);}
            
//  Date dob=myResult.getDate("dob");
            Double lng = myResult.getDouble("longitude");
            if(lng != null )
            {index.accumulate("longitude", lng);}
            
            Double lat = myResult.getDouble("latitude");
            if(lat != null )
            {index.accumulate("latitude", lat);}
            
            String qualification = myResult.getString("qualification");
            if(qualification != null )
            {index.accumulate("Qualification", qualification);}
            
            String Pnumber = myResult.getString("phone_number");
            if(Pnumber != null )
            {index.accumulate("Phone number", Pnumber);}
            
            Integer status = myResult.getInt("status");
            if(status != null )
            { index.accumulate("Status", status);}
            
            String password = myResult.getString("password");
            if(password != null )
            { index.accumulate("Password", password);}

            array.add(i, index);
            i++;
        }
        JSON_output.accumulate("employee", array);
        return JSON_output.toString();
      } 
         catch(SQLException e)
      {
          JSON_output.accumulate("Status", "Wrong");
          int j = (int) (new Date().getTime() / 1000);
        JSON_output.accumulate("timeStamp", j);
        JSON_output.accumulate("Username",parm);
         return JSON_output.toString();
      } catch (ClassNotFoundException ex) {
           // Logger.getLogger(TeamcResource.class.getName()).log(Level.SEVERE, null, ex);
            JSON_output.accumulate("Status", "Error");
          int j = (int) (new Date().getTime() / 1000);
        JSON_output.accumulate("timeStamp", j);
        JSON_output.accumulate("message","java.lang.ClassNotFoundException");
           return JSON_output.toString();
        }    
}
    
    @Path("allmessage")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getallMessage() throws SQLException {
        
       JSONObject JSON_output = new JSONObject();
      try {
           Class.forName("oracle.jdbc.OracleDriver");
            myCon = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "HR", "cegepgim");
        myStmt = myCon.createStatement();
        NoVishwash("SELECT * FROM HR.TC_MESSAGE");
        ResultSet myResult = myStmt.executeQuery(sql2);
        
        JSON_output.accumulate("Status", "ok");
        int j = (int) (new Date().getTime() / 1000);
        JSON_output.accumulate("timeStamp", j);
        JSONArray array = new JSONArray();
        int i = 0;
        while (myResult.next()) {

            Integer userid = myResult.getInt("user_id");
            Integer messageid = myResult.getInt("message_id");
            String message = myResult.getString("message");
            String sender = myResult.getString("sender");
           
            JSONObject index = new JSONObject();
            index.accumulate("user_id", userid);
            index.accumulate("message_id", messageid);
            index.accumulate("message", message);
            index.accumulate("sender", sender);
         
            array.add(i, index);
            i++;
        }
        JSON_output.accumulate("message_list", array);
        return JSON_output.toString();
    }
  catch(SQLException e)
      {
          JSON_output.accumulate("Status", "Wrong");
          int j = (int) (new Date().getTime() / 1000);
        JSON_output.accumulate("timeStamp", j);
       // JSON_output.accumulate("Username",username);
         return JSON_output.toString();
      } 
catch (ClassNotFoundException ex) {
           // Logger.getLogger(TeamcResource.class.getName()).log(Level.SEVERE, null, ex);
            JSON_output.accumulate("Status", "Error");
          int j = (int) (new Date().getTime() / 1000);
        JSON_output.accumulate("timeStamp", j);
        JSON_output.accumulate("message","java.lang.ClassNotFoundException");
           return JSON_output.toString();
        }
}
    
    @Path("allusers")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getJson() throws SQLException {
      JSONObject JSON_output = new JSONObject();
      try {
           Class.forName("oracle.jdbc.OracleDriver");
            myCon = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "HR", "cegepgim");
          myStmt = myCon.createStatement();
        NoVishwash("SELECT * FROM HR.TC_USERS");
        ResultSet myResult = myStmt.executeQuery(sql2);
        
        JSON_output.accumulate("Status", "ok");
        int j = (int) (new Date().getTime() / 1000);
        JSON_output.accumulate("timeStamp", j);
        JSONArray array = new JSONArray();
        int i = 0;
        while (myResult.next()) {

            JSONObject index = new JSONObject();
 
            Integer id = myResult.getInt("user_id");
            
            String uName = myResult.getString("username");
            if(uName != null)
            {index.accumulate("Username", uName);}
            
            String fName = myResult.getString("first_name");
            if(fName != null )
            {index.accumulate("first_name", fName);}
            
            String lName = myResult.getString("last_name");
            if(lName != null )
            {index.accumulate("last_name", lName);}
            
            String email = myResult.getString("email_id");
            if(email != null )
            {index.accumulate("email id", email);}
            
            Integer age = myResult.getInt("age");
            if(age != null )
            { index.accumulate("Age", age);}
            
            Double height = myResult.getDouble("height");
            if(height != null )
            {index.accumulate("height", height);}
            
            Double weight = myResult.getDouble("weight");
            if(weight != null )
            {index.accumulate("weight", weight);}
            
            String sex = myResult.getString("sex");
            if(sex != null )
            {index.accumulate("sex", sex);}
            
            String btype = myResult.getString("bodytype");
            if(btype != null )
            {index.accumulate("Body type", btype);}
            
//  Date dob=myResult.getDate("dob");
            Double lng = myResult.getDouble("longitude");
            if(lng != null )
            {index.accumulate("longitude", lng);}
            
            Double lat = myResult.getDouble("latitude");
            if(lat != null )
            {index.accumulate("latitude", lat);}
            
            String qualification = myResult.getString("qualification");
            if(qualification != null )
            {index.accumulate("Qualification", qualification);}
            
            String Pnumber = myResult.getString("phone_number");
            if(Pnumber != null )
            {index.accumulate("Phone number", Pnumber);}
            
            Integer status = myResult.getInt("status");
            if(status != null )
            { index.accumulate("Status", status);}
            
            String password = myResult.getString("password");
            if(password != null )
            { index.accumulate("Password", password);}
            // index.accumulate("date of birth", dob);
            
            array.add(i, index);
            i++;
        }
        JSON_output.accumulate("employee", array);
        return JSON_output.toString();
         }
      
      catch(SQLException e)
      {
          JSON_output.accumulate("Status", "Wrong");
          int j = (int) (new Date().getTime() / 1000);
        JSON_output.accumulate("timeStamp", j);
       // JSON_output.accumulate("Username",username);
         return JSON_output.toString();
      } catch (ClassNotFoundException ex) {
           // Logger.getLogger(TeamcResource.class.getName()).log(Level.SEVERE, null, ex);
            JSON_output.accumulate("Status", "Error");
          int j = (int) (new Date().getTime() / 1000);
        JSON_output.accumulate("timeStamp", j);
        JSON_output.accumulate("message","java.lang.ClassNotFoundException");
           return JSON_output.toString();
        }
    }
    
    @Path("allmessage&{username}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getallMessagePerUser(@PathParam("username") String username) throws SQLException {
        
           JSONObject JSON_output = new JSONObject();
      try {
           Class.forName("oracle.jdbc.OracleDriver");
            myCon = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "HR", "cegepgim");
        myStmt = myCon.createStatement();
        NoVishwash("SELECT * FROM HR.TC_MESSAGE where sender= '"+username+"'");
        ResultSet myResult = myStmt.executeQuery(sql2);
       
        JSON_output.accumulate("Status", "ok");
        int j = (int) (new Date().getTime() / 1000);
        JSON_output.accumulate("timeStamp", j);
        JSONArray array = new JSONArray();
        int i = 0;
        while (myResult.next()) {

            Integer userid = myResult.getInt("user_id");
            Integer messageid = myResult.getInt("message_id");
            String message = myResult.getString("message");
            String sender = myResult.getString("sender");
           
            JSONObject index = new JSONObject();
            index.accumulate("user_id", userid);
            index.accumulate("message_id", messageid);
            index.accumulate("message", message);
            index.accumulate("sender", sender);
         
            array.add(i, index);
            i++;
        }
        JSON_output.accumulate("message_list", array);
        return JSON_output.toString();
    }
        catch(SQLException e)
      {
          JSON_output.accumulate("Status", "Wrong");
          int j = (int) (new Date().getTime() / 1000);
        JSON_output.accumulate("timeStamp", j);
        JSON_output.accumulate("Username",username);
         return JSON_output.toString();
      } catch (ClassNotFoundException ex) {
           // Logger.getLogger(TeamcResource.class.getName()).log(Level.SEVERE, null, ex);
            JSON_output.accumulate("Status", "Error");
          int j = (int) (new Date().getTime() / 1000);
        JSON_output.accumulate("timeStamp", j);
        JSON_output.accumulate("message","java.lang.ClassNotFoundException");
           return JSON_output.toString();
        }
}
    
    @Path("hobbies&{username}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String gethobbies(@PathParam("username") String username) throws SQLException {
        
           JSONObject JSON_output = new JSONObject();
      try {
           Class.forName("oracle.jdbc.OracleDriver");
            myCon = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "HR", "cegepgim");
        myStmt = myCon.createStatement();
        NoVishwash("SELECT * FROM (tc_hobbies NATURAL JOIN tc_hobbies_users) NATURAL JOIN tc_users where username='"+username+"'");
        ResultSet myResult = myStmt.executeQuery(sql2);
       
        JSON_output.accumulate("Status", "ok");
        int j = (int) (new Date().getTime() / 1000);
        JSON_output.accumulate("timeStamp", j);
        JSONArray array = new JSONArray();
        JSONArray newarraylist=new JSONArray();
        int i = 0;
        String username23=null;
        Integer userId=null;
        while (myResult.next()) {

            userId = myResult.getInt("user_id");
            Integer hobbieId = myResult.getInt("hobbies_id");
            
            String hobbies = myResult.getString("hobbies");
            String description = myResult.getString("description");
          username23 = myResult.getString("username");
            JSONObject index = new JSONObject();
            
            index.accumulate("hobbies_id", hobbieId);
            index.accumulate("hobbie", hobbies);
            index.accumulate("description", description);
         
            newarraylist.add(i, index);
            i++;
        }
        
        JSON_output.accumulate("user_id", userId);
           JSON_output.accumulate("username", username23);
        JSON_output.accumulate("hobbies_list", newarraylist);
        return JSON_output.toString();
    }
        catch(SQLException e)
      {
          JSON_output.accumulate("Status", "Wrong");
          int j = (int) (new Date().getTime() / 1000);
        JSON_output.accumulate("timeStamp", j);
        JSON_output.accumulate("Username",username);
         return JSON_output.toString();
      } catch (ClassNotFoundException ex) {
           // Logger.getLogger(TeamcResource.class.getName()).log(Level.SEVERE, null, ex);
            JSON_output.accumulate("Status", "Error");
          int j = (int) (new Date().getTime() / 1000);
        JSON_output.accumulate("timeStamp", j);
        JSON_output.accumulate("message","java.lang.ClassNotFoundException");
           return JSON_output.toString();
        }
}
}