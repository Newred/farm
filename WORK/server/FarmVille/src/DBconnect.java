import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DBconnect {
	
	FrameVille frameVille;
	Connection connection = null;
	Statement statement = null;
	ResultSet resultset = null;
	
	public DBconnect(FrameVille _frameVille){	
		
		frameVille = _frameVille;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("driver найден");
			
			
			String dbn = "farm";
			String dbt = "user";
			String dbquery = "SELECT * FROM "+dbt ;
			
			String url = "jdbc:mysql://localhost/"+dbn;
			String user = "test";
			String pass = "test";
			
			connection = DriverManager.getConnection(url, user, pass);
			statement = connection.createStatement();
			resultset = statement.executeQuery(dbquery);
			
			parseResult(resultset);
			
		} catch (ClassNotFoundException e) {
			System.out.println("Driver не найден");
		}catch (SQLException e) { e.printStackTrace(); }
	}
	
	private void parseResult(ResultSet rs)
	{
		
		String answer;
		
		answer = "<country ><field zero_x='0' zero_y='0' size_x='60' size_y='60'>";
		try {
		
			while(rs.next())
			{
				String str = "<"+rs.getString("type")+
						"id='"+rs.getInt("id")+
						"' x='"+rs.getInt("x")+
						"' y='"+rs.getInt("y")+
						"' process_end='"+rs.getInt("process_end")+"' />";
				answer += str;
			}
			answer += "</field></country>";
			
			//System.out.println("xml: "+answer);
			
			frameVille.sendToClient(answer);
			
			//statement.executeUpdate("UPDATE `farm`.`user` SET `money` = "+(rs.getDouble("money")+100)+" WHERE `table1`.`name` ='Тина'");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
