package br.edu.insper.mvc.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO {
	private Connection connection = null;
	public DAO() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost/projeto1", "root", "Argentina123");
		
	}
	public List<Tarefa> getLista() throws SQLException {
		List<Tarefa> tarefas = new ArrayList<Tarefa>();
		
		PreparedStatement stmt = connection.prepareStatement("SELECT * FROM Tarefa");
		ResultSet rs = stmt.executeQuery();
		
		while (rs.next()) {
			Tarefa tarefa = new Tarefa();
			tarefa.setId(rs.getInt("id"));
			tarefa.setDescription(rs.getString("description"));
			tarefas.add(tarefa);
		}
		
		rs.close();
		stmt.close();
		
		return tarefas;
	}
	
	public void adiciona (Tarefa tarefa) throws SQLException {
		
		String sql = "INSERT INTO Tarefa (description) VALUES (?)";
		
		PreparedStatement stmt = connection.prepareStatement(sql);
		
		stmt.setString(1, tarefa.getDescription());
		stmt.execute();
		stmt.close();
		
	}
	
	public void remove (Integer id) throws SQLException {
		PreparedStatement stmt = connection.prepareStatement("DELETE FROM Tarefa WHERE id=?");
		
		stmt.setLong(1, id);
		stmt.execute();
		stmt.close();
	}
	
	public void altera (Tarefa tarefa) throws SQLException {
		String sql = "UPDATE Tarefa SET description=? WHERE id=?";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setString(1, tarefa.getDescription());
		stmt.setInt(2, tarefa.getId());
		stmt.execute();
		stmt.close();
	}
	
	public void close() throws SQLException {
		connection.close();
	}

}
