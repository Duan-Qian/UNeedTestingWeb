package DataBase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
	
	// save user info to database
	public void saveUser (User user) {
		Connection conn = ConnectDB.getConnection();
		String sql = "insert into users(username,password,email,icon,level,status,testCaseNum) values(?,?,?,?,0,0,0)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getIcon());
			
			ps.executeUpdate();
			
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectDB.closeConnection(conn);
		}
	}
	
	
	// verify username and password
	public User login (String username, String password) {
		User user = null;
		Connection conn = ConnectDB.getConnection();
		String sql = "select * from users where username = ? and password = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				user = new User();
				
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setIcon(rs.getString("icon"));
				user.setLevel(rs.getInt("level"));
				user.setStatus(rs.getInt("status"));
				user.setTestCaseNum(rs.getInt("testCaseNum"));

			}
			rs.close();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectDB.closeConnection(conn);
		}
		return user;
	}
	
	// get user info by username
	public User value (String username) {
		User user = null;
		Connection conn = ConnectDB.getConnection();
		String sql = "select * from users where username = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			
			ResultSet rs = ps.executeQuery();
				
			if (rs.next()) {
				user = new User();
					
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setIcon(rs.getString("icon"));
				user.setLevel(rs.getInt("level"));
				user.setStatus(rs.getInt("status"));
				user.setTestCaseNum(rs.getInt("testCaseNum"));

			}
			
			rs.close();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectDB.closeConnection(conn);
		}
		return user;
	}
		
	// get user info by user id
		public User valueId (int userId) {
			User user = null;
			Connection conn = ConnectDB.getConnection();
			String sql = "select * from users where id = ?";
			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, userId);

				ResultSet rs = ps.executeQuery();
						
				if (rs.next()) {
					user = new User();
							
					user.setId(rs.getInt("id"));
					user.setUsername(rs.getString("username"));
					user.setPassword(rs.getString("password"));
					user.setEmail(rs.getString("email"));
					user.setIcon(rs.getString("icon"));
					user.setLevel(rs.getInt("level"));
					user.setStatus(rs.getInt("status"));
					user.setTestCaseNum(rs.getInt("testCaseNum"));
				}					
				rs.close();
				ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectDB.closeConnection(conn);
			}
			return user;
		}
	// user change password
	public void changePassword (String password, int userId) {
		Connection conn = ConnectDB.getConnection();
		String sql = "update users set password=? where id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setInt(2, userId);

			ps.executeUpdate();					
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectDB.closeConnection(conn);
		}
	}
	
	// user change user email
	public void changeEmail (String email, int userId) {
		Connection conn = ConnectDB.getConnection();
		String sql = "update users set email=? where id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setInt(2, userId);
				
			ps.executeUpdate();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectDB.closeConnection(conn);
		}

	}
		
	// user change username
	public void changeUsername (String username, int userId) {
		Connection conn = ConnectDB.getConnection();
		String sql = "update users set username=? where id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setInt(2, userId);
			
			ps.executeUpdate();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectDB.closeConnection(conn);
		}

	}
	// if username exists, prevent sign up & change user name
	public boolean sameUsername (String username) {
		Connection conn = ConnectDB.getConnection();
		String sql = "select * from users where username = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			
			if (!rs.next()) {
				return true;
			}
			
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectDB.closeConnection(conn);
		}
		return false;
	}
	
	// if email exists, prevent sign up & change email
	public boolean sameEmail (String email) {
		Connection conn = ConnectDB.getConnection();
		String sql = "select * from users where email = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
				
			if (!rs.next()) {
				return true;
			}
				
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectDB.closeConnection(conn);
		}
		return false;
	}
		
	public boolean userExists (int id) {
		Connection conn = ConnectDB.getConnection();
		String sql = "select * from users where id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			if (!rs.next()) {
				return true;
			}
			
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectDB.closeConnection(conn);
		}
		return false;
	}
	
	// delete user function
	public void deleteUser(int id) {
		Connection conn = ConnectDB.getConnection();
		String sql = "delete from users where id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ps.executeUpdate();					
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectDB.closeConnection(conn);
		}
	}
}