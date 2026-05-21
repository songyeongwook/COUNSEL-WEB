<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상담사 대시보드</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .sidebar {
            width: 220px;
            background: #34495e;
            color: white;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            flex-direction: column;
            justify-content: space-between; /* 상단과 하단을 구분 */
            padding-top: 30px;
            box-sizing: border-box;
        }
        .sidebar h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .sidebar a {
            padding: 15px 20px;
            color: white;
            text-decoration: none;
            display: block;
        }
        .sidebar a:hover {
            background: #2c3e50;
        }
        .logout-button {
            padding: 15px 20px;
            background: #e74c3c;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin: 20px;
            display: block;
            text-align: center;
        }
        .main-content {
            margin-left: 220px;
            padding: 20px;
        }
        iframe {
            width: 100%;
            height: 600px;
            border: none;
            background: white;
            border-radius: 8px;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <div>
        <h2>상담사 모드</h2>
        <a href="noti_list.jsp" target="cFrame">공지 사항</a>
        <a href="applylist.jsp" target="cFrame">신청 현황</a>
        <a href="near_reservation.jsp" target="cFrame">예약 일정</a>
        <a href="uploadFeedback.jsp"target="cFrame">피드백 제공</a>
        
    </div>
    <div>
        <a href="index.jsp" class="logout-button">로그아웃</a>
    </div>
</div>
<div class="main-content">
    <iframe name="cFrame" src="noti_list.jsp"></iframe>
</div>
</body>
</html>
