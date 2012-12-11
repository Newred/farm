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
			System.out.println("Driver mysql не найден");
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
						" id='"+rs.getInt("id")+
						"' x='"+rs.getInt("x")+
						"' y='"+rs.getInt("y")+
						"' process_end='"+rs.getInt("process_end")+"' />";
				answer += str;
			}
			answer += "</field></country>";
			frameVille.sendToClient(answer);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void clearPlant(String [] data){
		try {
			statement.executeUpdate("DELETE FROM `user` WHERE `id` = "+data[1]);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void addPlant(String [] data){
		
		try {
			
			statement.executeUpdate("INSERT INTO `user` ( `type` , `x` , `y` , `process_end` ) VALUES ('"+
		data[1]+"', "+data[2]+", "+data[3]+", "+1312341+")");
			
			selectThis(data);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void addLevels(){
		try {
			statement.executeUpdate("UPDATE `user` SET `process_end`= `process_end`+ 1 WHERE `process_end` < 1312345");
			resultset = statement.executeQuery("SELECT * FROM user");
			parseResult(resultset);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	private void selectThis(String [] data){
		
		try {
			resultset = statement.executeQuery("SELECT * FROM `user` WHERE `x` = "+data[2]+" and `y`= "+data[3]);
			parseResult(resultset);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//parseResult(resultset);
	}
}
