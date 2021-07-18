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
				APNA - BANK<span class="style1"></span>
			</h1>
			<h2>ExtraOrdinary Service</h2>
			<A href='index.html'><IMG SRC='images/home1.gif'></IMG></A>
		</div>

		<div id="navigation">
			<ul>
				<li><a href="create.html">NEW ACCOUNT</a></li>
				<li><a href="balance1.jsp">BALANCE</a></li>
				<li><a href="deposit1.jsp">DEPOSIT</a></li>
				<li><a href="withdraw1.jsp">WITHDRAW</a></li>
				<li><a href="transfer1.jsp">TRANSFER</a></li>
				<li><a href="closeac1.jsp">CLOSE A/C</a></li>
				<li><a href="about.jsp">Contact Us</a></li>
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

							String num1 = request.getParameter("taccountno");
							int taccountno = Integer.parseInt(num1);

							String amoun = request.getParameter("amount");
							int accoun = Integer.parseInt(amoun);
							//accountno=taccountno;
							boolean status = verifyLogin1.checkLogin(accountno, username, password);
							//if(status==true){
							//	out.print("Welcome    " + username);
							try {
								if (status == true) {
									out.print("Welcome    " + username + "<br>");
									Connection con = GetCon.getCon();
									PreparedStatement ps = con
											.prepareStatement("Select * from NEWACCOUNT where accountno='" + taccountno + "'");
									ResultSet rs = ps.executeQuery();
									int dataamount = 0;

									if (rs.next()) {
										dataamount = accoun + rs.getInt(5);

									}
									Connection con1 = GetCon.getCon();

									PreparedStatement ps1 = con1
											.prepareStatement("update NEWACCOUNT set amount=? where accountno='" + taccountno + "'");
									ps1.setInt(1, dataamount);
									ps1.executeUpdate();

									request.setAttribute("target account A ", dataamount);
									Connection con2 = GetCon.getCon();
									PreparedStatement ps2 = con2.prepareStatement("Select * from NEWACCOUNT where accountno=?");

									ps2.setInt(1, accountno);
									ResultSet rs2 = ps2.executeQuery();

									int dataamount1 = 0;
									if (rs2.next()) {
										dataamount1 = rs2.getInt(5) - accoun;
									}
									Connection con3 = GetCon.getCon();

									PreparedStatement ps3 = con3
											.prepareStatement("update NEWACCOUNT set amount=? where accountno='" + accountno + "'");
									ps3.setInt(1, dataamount1);
									ps3.executeUpdate();
									out.println("Balance transferred Successfully from AC-No " + accountno + " to AC-No " + taccountno
											+ "..." + "<br>");
								} else {
									out.print("Please check your username and Password and target accountno");
									request.setAttribute("balance", "Please check your username and Password and target acountno");
						%>
						<jsp:forward page="transfer1.jsp"></jsp:forward>
						<%
							}
							} catch (SQLException e) {
								e.printStackTrace();
							}
						%>
					</table>
					<%
						
					%>
				
		</table>


		<%@ page import="java.sql.*"%>
		<%@ page import="java.io.*"%>
		<%@ page import="javax.servlet.*"%>
		<%@ page import="g.*"%>