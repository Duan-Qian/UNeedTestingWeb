<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="javax.sql.*" %>

<jsp:include page="header/header.jsp" />
<%
		if (session.getAttribute("user")==null)
		{
			response.sendRedirect("login.jsp");
		}
%>
		<div class="container" id="accountSettings">
    		<div style="text-align:center">
    		    <h1>Settings</h1>
    		</div>
    		<hr>
    		<%
				try (
					// Step 1: Allocate a database 'Connection' object
					java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/UNeedTesting?useSSL=false", "root", "0908");
					Statement stmt = conn.createStatement();
				) {
					String username = (String) session.getAttribute("user");
					String strSelect = "select * from users where username = '" + username + "'";
					int level;
					int points;
					String icon = "";
					String email = "";
					String testCaseNum = "";
					ResultSet rset = stmt.executeQuery(strSelect);
					while(rset.next()) {   // Move the cursor to the next row
						level = rset.getInt("level");
						points = rset.getInt("points");
						icon = rset.getString("icon");
						email = rset.getString("email");
						testCaseNum = rset.getString("testCaseNum");
			%>	
			
			<div class="row" style="margin-top:30px;padding-left:0px;">
				<div class="col-xs-4" >
					<img src="<%=icon %>" alt="" id="user_icon">
				</div>
				<div class="col-xs-8">
					<div>
						<Label id="userInfo">User: <%=username %></Label>
						<!-- change user name modal -->
						<button type="button" class="btn btn-primary" id="changeUserInfoBtn" data-toggle="modal" data-target="#changeUserName"><span class="glyphicon glyphicon-pencil"></span></button>
						
						<form action="AccountServlet" method="post">
							<div class="modal fade bs-example-modal-sm text-center" id="changeUserName" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
								<div class="modal-dialog modal-sm" role="document">
							    	<div class="modal-content">
							    		<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">Change User Name</h4>
										</div>
										<div class="modal-body">
										    <div>
										   		<input type="text" name="newUsername" id="changeUserInfoInput" minlength="4" maxlength="12" placeholder="New User Name" required/>
										   	</div>
										   	<p style="padding-top:30px;font-size:12px;">* You will log out after saving the change.</p>
										</div>
									    <div class="modal-footer">
											<button type="button" class="btn pull-left" id="changeUserInfoBtn" data-dismiss="modal">Close</button>
											<button type="submit" class="btn pull-right" id="changeUserInfoBtn">Save New Username</button>
										</div>
								    </div>
								</div>
							</div> <!-- modal close -->
						</form>
					</div>
					<div>
						<Label id="userInfo">Email: <%=email %></Label>
						<!-- change user email modal -->
						<button type="button" class="btn btn-primary" id="changeUserInfoBtn" data-toggle="modal" data-target="#changeUserEmail"><span class="glyphicon glyphicon-pencil"></span></button>
						<form action="AccountServlet" method="post">
							<div class="modal fade bs-example-modal-sm text-center" id="changeUserEmail" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
								<div class="modal-dialog modal-sm" role="document">
							    	<div class="modal-content">
								    	<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">Change Email Address</h4>
										</div>
										<div class="modal-body">
										    <div>
										   		<input type="email" name="newEmail" id="changeUserInfoInput" placeholder="New Email" />
										   	</div>
										   	<p style="padding-top:30px;font-size:12px;">* You will log out after saving the change.</p>
										</div>
									    <div class="modal-footer">
											<button type="button" class="btn pull-left" id="changeUserInfoBtn" data-dismiss="modal">Close</button>
											<button type="submit" class="btn pull-right" id="changeUserInfoBtn">Save New Email</button>
										</div>
								    </div>
								</div>
							</div> <!-- modal close -->
						</form>
					</div>
					<div>
						<Label id="userInfo">Level: <%=level %></label>
					</div>
					<div>
						<label id="userInfo">Points: <%=points %></label>
					</div>
					<div>
						<!-- change user password modal -->
						<button type="button" class="btn btn-primary" id="changeUserInfoBtn" data-toggle="modal" data-target="#changePassword">Change Password</button>
						<form action="AccountServlet" method="post">
							<div class="modal fade bs-example-modal-sm text-center" id="changePassword" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
								<div class="modal-dialog modal-sm" role="document">
							    	<div class="modal-content">
								    	<div class="modal-content">
								    		<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												<h4 class="modal-title" id="myModalLabel">Change User Password</h4>
											</div>
											<div class="modal-body">
											    <div>
											   		<input type="password" name="newPassword" id="newPassword" minlength="4" maxlength="12" placeholder="New Password" required/>
											   	</div>
											   	<div>
											   		<input type="password" name="reNewPassword" id="reNewPassword" minlength="4" maxlength="12" placeholder="Confirm Password" required/>
											   	</div>
											   	<span id='message' style="font-size:12px;padding-top:10px"></span>
											   	<p style="padding-top:30px;font-size:12px;">* You will log out after saving the change.</p>
											</div>
										    <div class="modal-footer">
												<button type="button" class="btn pull-left" id="changeUserInfoBtn" data-dismiss="modal">Close</button>
												<button type="submit" class="btn pull-right" id="reSetPasswordBtn">Save New Password</button>
											</div>
									    </div>
								    </div>
								</div>
							</div> <!-- modal close -->
						</form>
					</div>
				</div>
			</div>

			<%
				}
				} catch(Exception ex) {
					ex.printStackTrace();
			}
			%>
			<hr>
    	</div>
	
		<div class="container text-left">
    		<div style="text-align:center">
    		    <h1>Achievements</h1>
    		</div>
    		<div>	
    			<div class="row text-center">
    				<div class="col-xs-6">
						<input type="radio" name="achievementRadio" id="achieved" value="achieved" checked>
						<label id="radioBtnLabel" for="achieved"> Achieved</label>
    				</div>
    				<div class="col-xs-6">
						<input type="radio" name="achievementRadio" id="unfinished" value="unfinished">
						<label id="radioBtnLabel" for="unfinished"> Unfinished</label>
    				</div>
			    </div>
		</div>
		<hr>
		<div class="achieved box">
		<%
				try (
					// Step 1: Allocate a database 'Connection' object
					java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/UNeedTestingWeb?useSSL=false", "root", "0908");
					Statement stmt = conn.createStatement();
				) {
					
					String achievementStage = "stage = 1 or stage = 2 or stage =3";
					int userId = (int) session.getAttribute("userId");
					String strSelect = "select * from achievements where " + achievementStage + " and userId = '" + userId + "' order by stage DESC";
					String event = "";
					String description = "";
					int points;
					int stage;
					int categoryId;
					int totalNum;
					int curNum;
					ResultSet rset = stmt.executeQuery(strSelect);

					while(rset.next()) {   // Move the cursor to the next row
						event = (String) rset.getString("event");
						description = (String) rset.getString("description");
						points = rset.getInt("points");
						stage = rset.getInt("stage");
						categoryId = rset.getInt("categoryId");
						totalNum = 1000;
						curNum = 40;
						
			
			%>	

			<ul style="margin-top:10px;padding-left:0px;" class="no_bullets">
				<div class="row">
					<div class="col-xs-1">
						<img src="images/category_icon/<%=categoryId %>.png" alt="" id="account_icon">	
					</div>
					<div class="col-xs-5">
						<ul style="margin-top:10px;padding-left:0px;" class="no_bullets">
							<li>
								<b><%=event %></b> (<%=points %> points)	
							</li>
							<li>
								<%=description %>
							</li>
						</ul>
					</div>
					<div class="col-xs-5">
						<div class="progress">
  							<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<%=curNum %>" aria-valuemin="0" aria-valuemax="<%=totalNum %>" style="width: 60%;"><%=curNum %>/<%=totalNum %></div>
						</div>
					</div>
					<div class="col-xs-1">
						<img src="images/achievement_event/<%=stage %>.png" alt="" id="account_icon">	
					</div>
				</div>
				<hr>
			</ul>
			<%
				}
				} catch(Exception ex) {
					ex.printStackTrace();
			}
			%>
		</div>
		
		<div class="unfinished box" hidden>
		<%
				try (
					// Step 1: Allocate a database 'Connection' object
					java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/UNeedTestingWeb?useSSL=false", "root", "0908");
					Statement stmt = conn.createStatement();
				) {
					int userId = (int) session.getAttribute("userId");
					String strSelect = "select * from achievements where stage = 0 and userId = '" + userId + "'";
					String event = "";
					String description = "";
					int points;
					int stage;
					int categoryId;
					int totalNum = 1000;
					int curNum = 88;

					ResultSet rset = stmt.executeQuery(strSelect);

					while(rset.next()) {   // Move the cursor to the next row
						event = (String) rset.getString("event");
						description = (String) rset.getString("description");
						points = rset.getInt("points");
						stage = rset.getInt("stage");
						categoryId = rset.getInt("categoryId");

			%>	

			<ul style="margin-top:10px;padding-left:0px;" class="no_bullets">
				<div class="row">
					<div class="col-xs-1">
						<img src="images/category_icon/<%=categoryId %>.png" alt="" id="account_icon">	
					</div>
					<div class="col-xs-5">
						<ul style="margin-top:10px;padding-left:0px;" class="no_bullets">
							<li>
								<b><%=event %></b> (<%=points %> points)	
							</li>
							<li>
								<%=description %>
							</li>
						</ul>
					</div>
					<div class="col-xs-5">
						<div class="progress" id="progress_bar">
  							<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<%=curNum %>" aria-valuemin="0" aria-valuemax="<%=totalNum %>" style="width: 60%;"><%=curNum %>/<%=totalNum %></div>
						</div>
					</div>
					<div class="col-xs-1">
						<img src="images/achievement_event/locked.png" alt="" id="account_icon">	
					</div>
				</div>

				<hr>
			</ul>
			<%
				}
				} catch(Exception ex) {
					ex.printStackTrace();
			}
			%>
		</div>		
    </div>

<jsp:include page="footer/footer.jsp" />
