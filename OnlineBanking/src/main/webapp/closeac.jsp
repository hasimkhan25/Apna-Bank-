
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Global Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function ctck() {
		var sds = document.getElementById("dum");

	}
</script>

</head>

<body>

	<div id="top_links">


		<div id="header">
			<h1>
				APANA - BANK<span class="style1"></span>
			</h1>
			<h2>ExtraOrdinary Service</h2>
			<A href="index.html"><IMG SRC="images/home1.gif"></IMG></A>
		</div>

		<div id="navigation">
			<ul>
				<li><a href="create.html">NEW ACCOUNT</a></li>
				<li><a href="balance1.jsp">BALANCE</a></li>
				<li><a href="deposit1.jsp">DEPOSIT</a></li>
				<li><a href="withdraw1.jsp">WITHDRAW</a></li>
				<li><a href="transfer1.jsp">TRANSFER</a></li>
				<li><a href="closeac1.jsp">CLOSE A/C</a></li>
				<li><a href="about.jsp">ABOUT US</a></li>
			</ul>
		</div>



		<table style="width: 897px; background: #FFFFFF; margin: 0 auto;">
			<tr>
				<td width="300" valign="top"
					style="border-right: #666666 1px dotted;">
					<div id="services">
						<h1>Services</h1>
						<br>
						<ul>
							<li><a href="#">www.onlinebanking.com</a></li>
							<li><a href="#">www.apnabank.com </a></li>
							<li><a href="#">www.pnb.com</a></li>
						</ul>

					</div>
				</td>

				<td width="1200" valign="top">
					<%
						
					%>
					<table>
						<%
							String num = request.getParameter("accountno");
							int accountno = Integer.parseInt(num);
							String username = request.getParameter("username");
							String password = request.getParameter("password");
							boolean status = verifyLogin1.checkLogin(accountno, username, password);
							//if(status==true){
							//	out.print("Welcome    " + username);
							try {
								if (status == true) {
									out.println("Welcome    " + username+"<br>");

									Connection con = GetCon.getCon();
									PreparedStatement ps = con
											.prepareStatement("delete from NEWACCOUNT where accountno='" + accountno + "'");
									//ps.setInt(1,accountno);
									ps.executeUpdate();

									out.print("Your AC-No.  " + accountno + "  has closed...");

								} 
								else {
									out.print("Please check your username and Password");
									request.setAttribute("balance", "Please check your username and Password");
						%>
						<jsp:forward page="closeac1.jsp"></jsp:forward>
						<%
							}
							} catch (SQLException e) {
								e.printStackTrace();
							}
						%>
					</table>
					<%
						
					%>
				
			</tr>
		</table>

		<div id="footer_top">
			<div id="footer_navigation"></div>

			<div id="footer_copyright">

				<center>
					<img alt="business" width="196" height="106">
				</center>
				<br>
				<p>Each people plan their site layouts depending upon their
					business type. Here comes a free designer template which provides
					you with a selection of different kinds of webdesign starting from
					business template, fashion template, media template, Science
					template, Arts template and much more.</p>

				Copyright © Your Company Name
			</div>
		</div>

		<script type="text/javascript">
			document.onload = ctck();
		</script>
	</div>
	<%@ page import="java.sql.*"%>
	<%@ page import="g.*"%>
</body>
</html>
