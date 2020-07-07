package config;
import java.sql.*;
/**
 * @author bere
 */
public class conexion {
    public conexion(){}
    private String usuario="root";
    private String pass="";
    private String url="com.mysql.jdbc.Driver";
    private String url1="jdbc:mysql://localhost/libros";
    protected ResultSet rs;
    protected Statement st;
    //String msg="";
    Connection conectar=null;
    public Connection Conectarjspmysql(){
        try{
            Class.forName(url);
            conectar=DriverManager.getConnection(url1,usuario,pass);
            //msg="La Conexion fue exitosa";
    }catch(Exception e){
        e.printStackTrace();
        //msg="Error en la conexion";
    }
        return conectar;      
    }
}
