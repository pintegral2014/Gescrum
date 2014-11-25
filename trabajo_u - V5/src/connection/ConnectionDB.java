package connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionDB {
    final private static String servidor = "jdbc:mysql://localhost:3306/gescrum";
    final private static String user = "root";
    final private static String pass = "root";
    final private static String driver = "com.mysql.jdbc.Driver";
    private Connection connectionDB;

    public ConnectionDB(){
        try {
            Class.forName(driver);//levanto el driver
            System.out.print(driver);
            connectionDB = DriverManager.getConnection(servidor,user,pass);//establezco conexion
            Statement stm = connectionDB.createStatement();
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public  Connection getConnectionDB(){
        return connectionDB;//devuelvo el objeto conecction
    }

    public Connection cerrarConexion() {
        try {
            connectionDB.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        connectionDB=null;
        return  connectionDB;
    }

}
