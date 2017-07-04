package DataBase;

public class User {
	private int id;
	private String username;
	private String password;
	private String email;
	private String icon;
	private int level;
	private int status;
	private int testCaseNum;
	
	// get & set user primary key
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	// get & set account name
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	// get & set account password
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	// get & set account email
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	// get & set account icon
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	 
	// get & set account level
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
	// get & set account status
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	// get & set account total test case number
	public int getTestCaseNum() {
		return testCaseNum;
	}
	public void setTestCaseNum(int testCaseNum) {
		this.testCaseNum = testCaseNum;
	}

}