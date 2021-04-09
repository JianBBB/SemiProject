<%@page import="com.proj.review.model.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../inc/top_ckedit.jsp"></jsp:include>
<%@page import="com.proj.review.model.ReviewService"%>
<%@page import="java.sql.SQLException"%>
<script type="text/javascript">
 function checkBlank(){
	 var rating= document.getElementById("rating");
	 var content= document.getElementById("reContent");
	 var title= document.getElementById("reTitle");
	 var rateText=rating.options[rating.selectedIndex].text;
	 
	 if(rateText == "평점"){
		 alert("평점을 선택하여 주세요.");
		 rating.focus();
		 return false;
	 }	
	 
	 if(content.value ==""){
		 alert("리뷰 내용을 입력하여 주세요.");
		 content.focus();
		 return false;
	 }
	 
	 if(title.value==""){
		 alert("제목을 입력하여 주세요.");
		 title.focus();
		 return false;
	 }
	 
	 return true;
 }
 
 function chkUser() {
	 if(!top_isLogin){
		 alert("리뷰를 작성하려면 먼저 로그인 하여 주세요.")
		 return false;
	 }
	 return true;
}
 
 </script>

<%
	//1
	//String roomNo = request.getParameter("roomNo");
	//String userId = (String)session.getAttribute("userId");
	String roomNo= "399";
	String userId= "user4";

	
	//2
	
	ReviewService service= new ReviewService();
	ReviewVO vo =new ReviewVO();
	
	String imgSrc="";
	try{
		imgSrc = service.imgByRoomNo(Integer.parseInt(roomNo));
		vo = service.selectByRoomNo(Integer.parseInt(roomNo));
	}catch (SQLException e){
		e.printStackTrace();
	}	
	
%>

    <div class="site-section bg-light" id="contact-section">
      <div class="container">
        <div class="row justify-content-center text-center">
        <div class="col-7 text-center mb-5">
        <br><br><br>
    <div class="block-counter-1" style="padding-top: 10px; " >
		<label style="color:white; background: red	; border-radius: 80px; padding: 5px 30px 5px 30px; font-size: 3em;">
		R &nbsp&nbsp E &nbsp&nbsp V &nbsp&nbsp I &nbsp&nbsp E &nbsp&nbsp W</label>
	</div>
      </div>
        <div class="row">
          <div class="col-lg-9 mb-5" >
            <form id="frmRvWr" name="frmRvWr"  onsubmit="return checkBlank()" action="reviewWrite_ok.jsp" method="post">
              <div class="form-group row">
              	<div class="col-md-3 ">
                  <!-- <input type="text" class="form-control" placeholder="First name"> -->
                  	<select id="brand" class="form-control bg-light" name="brand" style="color: rgb(23,162,184); 
                  	border-radius: 10px;" disabled="disabled" >
	 					<option ><%=vo.getBrandName() %> </option>					
					</select>
                </div>
                <div class="col-md-3 ">
                  <!-- <input type="text" class="form-control" placeholder=""> -->
                  <select id="local" name="local" class="form-control bg-light" style="color: rgb(23,162,184); 
                  	border-radius: 10px;" disabled="disabled" >
	 					<option ><%=vo.get  %> </option>					
					</select>
                </div>
                
                <div class="col-md-4">
                  <!-- <input type="text" class="form-control" placeholder="First name"> -->
                  	<select id="theme" name="theme" class="form-control bg-light" style="color: rgb(23,162,184); 
                  	border-radius: 10px;" disabled="disabled">
	 					<option ><%=themeName %> </option>				
					</select>
                </div> 
                <input id="roomNo" name="roomNo" value="<%=roomNo%>" type="hidden">           
                <input id="userNo" name="userNo" value="<%=userNo%>" type="hidden">
                
                <div class="col-md-2">         
                  	<select id="rating" name="rating" class="form-control" style="color: rgb(23,162,184); border-radius: 10px;">
	 					<option> 평점 </option>
	 					<option value="5" >5</option>
	 					<option value="4.5" >4.5</option>
	 					<option value="4" >4</option>
	 					<option	value="3.5" >3.5 </option>
	 					<option	value="3" >3</option>
	 					<option	value="2.5" >2.5</option>
	 					<option	value="2" >2</option>
	 					<option	value="1.5" >1.5</option>
	 					<option value="1.0" >1.0</option>					
					</select>
                </div>
              </div>
              
              <div class="form-group row">
              	<div class="col-md-2" style="padding-top: 12px;">
                  <label style="font-weight: bold;" >T&nbspi&nbspt&nbspl&nbspe&nbsp:</label> 
                </div>
                <div class="col-md-10">
                  <input id="reTitle" name="reTitle" type="text"  style="border-radius: 10px;" class="form-control"> 
                </div>
              </div>      

              <div class="form-group row">
                <div class="col-md-12">
                  <textarea id="reContent" name="reContent" style="border-radius: 10px;" class="form-control" 
                  	cols="30" rows="12">
                  	
                  </textarea>
                  <script>
                  	CKEDITOR.replace('reContent');
                  </script>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-6 mr-auto">
                  <input type="submit" class="btn btn-block btn-primary text-white py-3 px-5" 
                  	onclick="chkUser()" value="Send Review">
                </div>
              </div>
            </form>
          </div>
          <div class="col-lg-3 ml-auto">
            <div class="bg-white p-3 p-md-5">
              <img src="<%=imgSrc %>" style="width:180px; height:270px;">
            </div>
          </div>
        </div>
      </div>
    </div>
        
      </div>
 <!-- content end-->   
<jsp:include page="../inc/bottom.jsp"></jsp:include>    


