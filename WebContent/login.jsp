<jsp:include page="header/header.jsp" />

<div class="container" style="padding-top:100px; text-align:center">
		<div class="login_form">
			<form action="LoginServlet" method="post" onsubmit="return login(this);">
				<h1>Sign In</h1>				
				<div>
					<input type="text" name="username" placeholder="Username" id="username" minlength="4" maxlength="12" required>
				</div>
				<div>
					<input type="password" name="password" placeholder="Password" id="password" minlength="4" maxlength="12" required>
				</div>			
				<div>
					<button type="submit" class="btn btn-lg btn-primary" name="login" id="submit_btn">Sign In</button>
				</div>
			</form>
			<div>
				<br>
				<a href="#" style="color:black;" class="href_text">Forget your password?</a>	
			</div>
				<br>
			<div>
			<p>OR</p>
				<a href="signUp.jsp" class="btn btn-lg btn-primary" id="submit_btn">Sign Up</a>
			</div>	
		</div>
		<br/>
</div>

<jsp:include page="footer/footer.jsp" />
