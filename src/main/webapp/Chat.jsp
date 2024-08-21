<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	String toID = null;
	if(session.getAttribute("toID") != null){
		toID = (String)session.getAttribute("toID");
	}
	String chatContent = null;
	if(session.getAttribute("chatContent") != null){
		chatContent = (String)session.getAttribute("chatContent");
	}

%>
<style type="text/css">
.portlet {
    margin-bottom: 15px;
}

.btn-white {
    border-color: #cccccc;
    color: #333333;
    background-color: #ffffff;
}

.portlet {
    border: 1px solid;
}

.portlet .portlet-heading {
    padding: 0 15px;
}

.portlet .portlet-heading h4 {
    padding: 1px 0;
    font-size: 16px;
}

.portlet .portlet-heading a {
    color: #fff;
}

.portlet .portlet-heading a:hover,
.portlet .portlet-heading a:active,
.portlet .portlet-heading a:focus {
    outline: none;
}

.portlet .portlet-widgets .dropdown-menu a {
    color: #333;
}

.portlet .portlet-widgets ul.dropdown-menu {
    min-width: 0;
}

.portlet .portlet-heading .portlet-title {
    float: left;
}

.portlet .portlet-heading .portlet-title h4 {
    margin: 10px 0;
}

.portlet .portlet-heading .portlet-widgets {
    float: right;
    margin: 8px 0;
}

.portlet .portlet-heading .portlet-widgets .tabbed-portlets {
    display: inline;
}

.portlet .portlet-heading .portlet-widgets .divider {
    margin: 0 5px;
}

.portlet .portlet-body {
    padding: 15px;
    background: #fff;
}

.portlet .portlet-footer {
    padding: 10px 15px;
    background: #e0e7e8;
}

.portlet .portlet-footer ul {
    margin: 0;
}

.portlet-green,
.portlet-green>.portlet-heading {
    border-color: #16a085;
}

.portlet-green>.portlet-heading {
    color: #fff;
    background-color: #16a085;
}

.portlet-orange,
.portlet-orange>.portlet-heading {
    border-color: #f39c12;
}

.portlet-orange>.portlet-heading {
    color: #fff;
    background-color: #f39c12;
}

.portlet-blue,
.portlet-blue>.portlet-heading {
    border-color: #2980b9;
}

.portlet-blue>.portlet-heading {
    color: #fff;
    background-color: #2980b9;
}

.portlet-red,
.portlet-red>.portlet-heading {
    border-color: #e74c3c;
}

.portlet-red>.portlet-heading {
    color: #fff;
    background-color: #e74c3c;
}

.portlet-purple,
.portlet-purple>.portlet-heading {
    border-color: #8e44ad;
}

.portlet-purple>.portlet-heading {
    color: #fff;
    background-color: #8e44ad;
}

.portlet-default,
.portlet-dark-blue,
.portlet-default>.portlet-heading,
.portlet-dark-blue>.portlet-heading {
    border-color: #34495e;
}

.portlet-default>.portlet-heading,
.portlet-dark-blue>.portlet-heading {
    color: #fff;
    background-color: #34495e;
}

.portlet-basic,
.portlet-basic>.portlet-heading {
    border-color: #333;
}

.portlet-basic>.portlet-heading {
    border-bottom: 1px solid #333;
    color: #333;
    background-color: #fff;
}

@media(min-width:768px) {
    .portlet {
        margin-bottom: 30px;
    }
}

.img-chat{
width:40px;
height:40px;
}

.text-green {
    color: #16a085;
}

.text-orange {
    color: #f39c12;
}

.text-red {
    color: #e74c3c;
}                
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-widthm, intial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP AJAX 실시간 익명 채팅 사이트</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">	

	function autoClosingAlert(selector, delay) {
		var alert = $(selector).alert();
		alert.show();
		window.setTimeout(function() {alert.hide()}, delay);
	}


	
	function submitFunction(){
		var fromID = '<%= userID %>';
		var toID = '<%= toID %>';
		var chatContent = $('#chatContent').val();
		$.ajax({
			type: "POST",
			url: "./chatSubmitServlet",
			data: {
				fromID: encodeURIComponent(fromID),
				toID: encodeURIComponent(toID),
				chatContent: encodeURIComponent(chatContent)
			},
			success: function(result) {
				console.log(result)
				if(result==1) {
					autoClosingAlert('#successMessage', 2000);
				}else if(result==0){
					autoClosingAlert('#dangerMessage', 2000);
				}else {
					autoClosingAlert('#successMessage', 2000);
				}
			}
		});
		$('#chatContent').val('');
	}
	
	var lastID = 0;

	function chatListFunction(type) {
	    var fromID = '<%= userID %>';
	    var toID = '<%= toID %>';
	    $.ajax({
	        type: "POST",
	        url: "./chatListServlet",
	        data: {
	            fromID: encodeURIComponent(fromID),
	            toID: encodeURIComponent(toID),
	            listType: type
	        },
	        success: function(data) {
	            if(data == "") return;
	            var parsed = JSON.parse(data);
	            var result = parsed.result;
	            for(var i = 0; i < result.length; i++) {
	                addChat(result[i][0].value, result[i][2].value, result[i][3].value);
	            }
	            lastID = Number(parsed.last);
	            console.log(lastID);
	            
	        }
	    });
	}
	function addChat(chatName, chatContent, chatTime) {
		$('#chatList').append('<div class="row">' +
				'<div class = "col-lg-12">' +
				'<div class = "media">' +
				'<a class="pull-left" href="#">' +
				'<img class="media-object img-circle" src="images/go.png" alt="">' +
				'</a>' +
				'<div class="media-body">' +
				'<h4 class="media-heading">' +
				//chatName +
				'<span class="small pull-right">' +
				chatTime +
				'</span>' +
				'</h4>' +
				'<p>' +
				chatContent +
				'</p>' +
				'</div>'+
				'</div>'+
				'</div>'+
				'</div>'+
				'<hr>');
		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	} 
	function getInfiniteChat() {
		setInterval(function() {
			chatListFunction(lastID);
		}, 3000);
	}
	</script>
</head>
<body>


	<div class="container">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12" style="width: 600px;">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4>
									<i class="fa fa-circle text-green"></i>실시간채팅방
								</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse collapse in">
							<div id="chatList" class="portlet-body char-widget"
								style="overflow-y: auto; width: auto; height: 600px;">
							</div>
						</div>
						<div class="portlet-footer">
							<div class="row">
								
							</div>
							<div class="row" style="height: 90px">
								<div class="form-group col-xs-10">
									<textarea style="height: 80px;" id="chatContent"
										class="form-control" placeholder="메시지를입력하시오" maxlength="100"></textarea>
								</div>
								<div class="form-group col-xs-2">
									<button type=button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			 </div>
		</div>
			<div class="alert alert-success" id="successMessage" style="display: none;">
				<strong>메시지 전송에 성공하였습니다.</strong>
			</div>
			<div class="alert alert-danger" id="dangerMessage"	style="display: none;">
				<strong>이름과 내용을 모두 입력해주세요.</strong>
			</div>
			<div class="alert alert-warning" id="warningMessage" style="display: none;">
				<strong>데이터베이스 오류가 발생했습니다.</strong>
			</div>
		</div>
		
		<script>
			$("#messageModal").modal("show");
			
		</script>
		
		<script type="text/javascript">
			$(document).ready(function() {
				chatListFunction('ten');
				//getInfiniteChat();
			});
		</script>
</body>
</html>