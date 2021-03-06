<%@page import="com.proj.member.model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<jsp:useBean id="memService" class="com.proj.member.model.MemberService"
	scope="session"></jsp:useBean>
<%
	//1
	request.setCharacterEncoding("utf-8");
	String memid=request.getParameter("memid");
	
	//2
	int result=0;
	if(memid!=null && !memid.isEmpty()){
		try{
			result=memService.checkDup(memid);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	//3
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check-Id !!! </title>
    <link href="https://fonts.googleapis.com/css?family=DM+Sans:300,400,700|Indie+Flower" rel="stylesheet">
 
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/fonts/icomoon/style.css">

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/bootstrap-datepicker.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/jquery.fancybox.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/owl.theme.default.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/aos.css">

    <!-- MAIN CSS -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/jianstyle.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/sjstyle.css">
<script type="text/javascript" src="../../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btUse').click(function(){
			$(opener.document).find('#memid').val("<%=memid%>");
			$(opener.document).find('#chkId').val("Y"); //???????????? ????????? ???
			$(opener.document).find('#er2').css('display','none');

			self.close();
		});
	});
</script>
</head>
<body>
	<br>
<form name="frmId" method="post" action="joinChkId.jsp">
	 <div class="row justify-content-center">
		
		<div class="form-group">							  
  
			<input type="text" name="memid" id="memid" value="<%=memid%>"> 
			<br><br>
			<input type="submit" class="btn btn-primary" id="submit" value="????????? ??????">
			<%
			if(result==MemberService.EXIST_ID){ %>
			
				<span style="color:red;">?????? ????????? ????????? ?????????. ?????? ???????????? ???????????????!</span>
		<%	}else if(result==MemberService.NON_EXIST_ID){ %>						
				<input type="button" class="btn btn-primary" value="????????????" id="btUse">
				<br><br>
				<span style="color:red;">??????????????? ??????????????????.<br> ???????????? ????????? ???????????? ??????????????? ??????????????????!</span>
		<% 	}	%>
		</div>
	</div>
		
</form>
</body>
</html>