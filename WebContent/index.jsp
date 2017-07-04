<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="javax.sql.*" %>

<jsp:include page="header/header.jsp" />

    <div class="container" id="dashboard">
    	<div class="col-xs-7">
    		<div style="text-align:center">
    		    <h1>Achievements</h1>
    		</div>
			<ul style="margin-top:30px;padding-left:0px;" class="no_bullets">
				<li id="category_list">
					<img src="images/category_icon/1.png" alt="" id="category_icon">
					<a tabindex="0" class="btn btn-lg btn-default" role="button" id="category_popover" data-toggle="popover" data-trigger="focus" data-content="This is for test coverage.">Coverage</a>
				</li>
				<li id="category_list">
					<img src="images/category_icon/2.png" alt="" id="category_icon">
					<a tabindex="0" class="btn btn-lg btn-default" role="button" id="category_popover" data-toggle="popover" data-trigger="focus" data-content="This is for counting errors which user made during testing.">Errors</a>
					<hr>
					<ul class="no_bullets">
						<li>
							<div class="row">
								<div class="col-xs-2">
									<img src="images/category/errors.png" alt="" id="achievemetn_list_icon">	
								</div>
								<div class="col-xs-10">
									<p><strong>It should pass!</strong> (50 points)</p>
									<p>Test cases failed 100 times.</p>
								</div>
							</div>	
						</li>
						<hr>
					</ul>
				
				</li>
				<li id="category_list">
					<img src="images/category_icon/3.png" alt="" id="category_icon">
					<a tabindex="0" class="btn btn-lg btn-default" role="button" id="category_popover" data-toggle="popover" data-trigger="focus" data-content="This is for how many cases failed.">Failures</a>
				</li>
				<li id="category_list">
					<img src="images/category_icon/4.png" alt="" id="category_icon">
					<a tabindex="0" class="btn btn-lg btn-default" role="button" id="category_popover" data-toggle="popover" data-trigger="focus" data-content="This is for how many testing user has done.">Hard Work</a>
				</li>
				<li id="category_list">
					<img src="images/category_icon/5.png" alt="" id="category_icon">
					<a tabindex="0" class="btn btn-lg btn-default" role="button" id="category_popover" data-toggle="popover" data-trigger="focus" data-content="This is hidden achievements.">Hidden Achievements</a>
					<hr>
					<ul class="no_bullets">
						<li>
							<div class="row">
								<div class="col-xs-2">
									<img src="images/category/hidden_achievements.png" alt="" id="achievemetn_list_icon">	
								</div>
								<div class="col-xs-10">
									<p><strong>Ring</strong> (100 points)</p>
									<p>Testing around 00:00.</p>
								</div>
							</div>	
						</li>
						<hr>
					</ul>
				</li>
				<li id="category_list">
					<img src="images/category_icon/6.png" alt="" id="category_icon">
					<a tabindex="0" class="btn btn-lg btn-default" role="button" id="category_popover" data-toggle="popover" data-trigger="focus" data-content="I love testing!">I Love Testing</a>
					<hr>
					<ul class="no_bullets">
						<li>
							<div class="row">
								<div class="col-xs-2">
									<img src="images/category/i_love_testing.png" alt="" id="achievemetn_list_icon">	
								</div>
								<div class="col-xs-10">
									<p><strong>The More, The Better.</strong> (30 points)</p>
									<p>Total number of the testing cases is more than 100.</p>
								</div>
							</div>
						</li>
						<hr>
					</ul>
				</li>
				<li id="category_list">
					<img src="images/category_icon/7.png" alt="" id="category_icon">
					<a tabindex="0" class="btn btn-lg btn-default" role="button" id="category_popover" data-toggle="popover" data-trigger="focus" data-content="How many bugs fixed from unit testing.">Kill All Bugs</a>
				</li>
				<li id="category_list">
					<img src="images/category_icon/8.png" alt="" id="category_icon">
					<a tabindex="0" class="btn btn-lg btn-default" role="button" id="category_popover" data-toggle="popover" data-trigger="focus" data-content="For how fast finishing one test suite.">Speed</a>
				</li>
				<li id="category_list">
					<img src="images/category_icon/9.png" alt="" id="category_icon">
					<a tabindex="0" class="btn btn-lg btn-default" role="button" id="category_popover" data-toggle="popover" data-trigger="focus" data-content="For the quality of testing code.">Quality</a>
				</li>
			</ul>
    	</div>
    	<%-- <div class="col-xs-6">
    		<div style="text-align:center">
    		    <h1>Achievements</h1>
    		</div>
    		<%
				try (
					// Step 1: Allocate a database 'Connection' object
					java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/UNeedTesting?useSSL=false", "root", "0908");
					Statement stmt = conn.createStatement();
				) {
					String strSelect = "select * from category where status = 1";
					String type = "";
					String icon = "";
					String description = "";
					ResultSet rset = stmt.executeQuery(strSelect);

					while(rset.next()) {   // Move the cursor to the next row
						type = (String) rset.getString("type");
						icon = (String) rset.getString("icon");
						description = (String) rset.getString("description");						
			%>	

			<ul style="margin-top:30px;padding-left:0px;" class="no_bullets">
				<li>
					<img src="<%=icon %>" alt="" id="category_icon">
					<a tabindex="0" class="btn btn-lg btn-default" role="button" id="category_popover" data-toggle="popover" data-trigger="focus" data-content="<%=rset.getString("description")%>"><%=rset.getString("type")%></a>
				</li>
			</ul>
			<%
				}
				} catch(Exception ex) {
					ex.printStackTrace();
			}
			%>
    	</div> --%>
    	
    	<div class="col-xs-5" id="leaderboarder_container">
    		<h1>Leaderboard</h1>
    		<img src="images/leaderboard/gold.png" id="leaderboard_icon_gold" class="leaderboard_icon">
    		<img src="images/leaderboard/silver.png" id="leaderboard_icon_silver" class="leaderboard_icon">
    		<img src="images/leaderboard/bronze.png" id="leaderboard_icon_bronze" class="leaderboard_icon">
			<%
				try (
					// Step 1: Allocate a database 'Connection' object
					java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/UNeedTesting?useSSL=false", "root", "0908");
					Statement stmt = conn.createStatement();
				) {
					String strSelect = "select * from users order by level DESC limit 10";
					String username = "";
					String icon = "";
					int level = 0;
					int points = 0;
					ResultSet rset = stmt.executeQuery(strSelect);
					while(rset.next()) {   // Move the cursor to the next row
						username = (String) rset.getString("username");
						icon = (String) rset.getString("icon");
						level = (int) rset.getInt("level");
						points = (int) rset.getInt("points");
			%>	
			<div class="col-xs-4" style="margin-top:30px">
				<img src="<%=icon %>" alt="" class="img-thumbnail" id="user_icon">				
				<label id="userInfo">User: <%=username %></label> <br>
				<label id="userInfo">Level: <%=level %></label> <br>
				<div style="text-align:center">
					<button id="showUserDetails" class="btn btn-primary" data-username="<%=rset.getString("username")%>" data-level="<%=rset.getString("level")%>" data-points="<%=rset.getInt("points")%>" data-icon="<%=rset.getString("icon") %>"
						        data-toggle="modal" data-target="#myModal">User Details</button>
				</div>
			</div>

			<%
				}
				} catch(Exception ex) {
					ex.printStackTrace();
			}
			%>
		</div>
		
		<!-- Modal -->
		<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title text-center" id="myModalLabel">User Details</h4>
					</div>
					<div class="modal-body">
						<p class="username"></p>
						<p class="level"></p>
						<p class="points"></p>
					</div>
					<div class="modal-footer" style="text-align:center;">
						<button type="button" class="btn btn-default" id="modalCloseBtn" data-dismiss="modal">Close</button>
					</div>
		    	</div>
		  	</div>
		</div>	
    </div>
    
<jsp:include page="footer/footer.jsp" />
