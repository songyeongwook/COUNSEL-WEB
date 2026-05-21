<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>고객 대시보드</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f6fa;
        }
        .sidebar {
            width: 220px;
            background: #2c3e50;
            color: white;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            flex-direction: column;
            padding-top: 30px;
            justify-content: space-between;
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
            background: #34495e;
        }
        .logout-button, .delete-button {
            padding: 15px 20px;
            text-align: center;
            text-decoration: none;
            margin: 10px 20px;
            border-radius: 5px;
            display: block;
        }
        .logout-button {
            background: #e74c3c;
            color: white;
        }
        .logout-button:hover {
            background: #c0392b;
        }
        .delete-button {
            background: #9b59b6;
            color: white;
        }
        .delete-button:hover {
            background: #8e44ad;
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
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div>
            <h2>행복한 상담</h2>
            <a href="customer_info.jsp" target="contentFrame">고객 정보</a>
            <a href="customer_counsel.jsp" target="contentFrame">상담 내용</a>
            <a href="customer_apply.jsp" target="contentFrame">상담 신청</a>
            <a href="customer_noti_list.jsp" target="contentFrame">공지 사항</a>
            <a href="viewFeedback.jsp" target="contentFrame"> 피드백 편지</a>
            
        </div>
        <div>
            <a href="delete_account.jsp" class="delete-button">회원 탈퇴</a>
            <a href="index.jsp" class="logout-button">로그아웃</a>
        </div>
    </div>

    <div class="main-content">
        <iframe name="contentFrame" src="customer_info.jsp"></iframe>
    </div>
</body>
</html>
