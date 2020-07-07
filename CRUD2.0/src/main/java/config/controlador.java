package config;

import java.sql.ResultSet;
public class controlador extends conexion{
    public controlador(){}
    public ResultSet DevolverRegistro(String sql){
        try{
            this.st=this.Conectarjspmysql().createStatement();
            this.rs=this.st.executeQuery(sql);
        }catch(Exception e){
        }
        return this.rs;
    }
}
