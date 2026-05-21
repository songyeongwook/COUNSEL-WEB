<%@ page import="java.util.*, dao.listDAO, model.listDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    listDAO listDao = new listDAO();
    List<listDTO> list = listDao.getAllNotices();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 목록</title>
    <style>
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #2c3e50;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .write-btn {
            display: block;
            width: 120px;
            margin: 20px auto;
            padding: 10px 0;
            background-color: #3498db;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .btn-group button {
            margin: 2px;
            padding: 6px 10px;
            font-size: 0.9em;
            border-radius: 4px;
            cursor: pointer;
            border: none;
            color: white;
        }
        .update-btn {
            background-color: #27ae60;
        }
        .delete-btn {
            background-color: #e74c3c;
        }
    </style>
    <script>
        function openWritePopup() {
            window.open('noti_write.jsp', '공지사항 작성', 'width=450,height=450,top=200,left=500,scrollbars=no,resizable=no');
        }
        function openUpdatePopup(notiNum) {
            window.open('noti_update.jsp?notiNum=' + notiNum, '공지사항 수정', 'width=450,height=500,top=200,left=500,scrollbars=no,resizable=no');
        }
        function openDeletePopup(notiNum) {
            window.open('noti_delete.jsp?notiNum=' + notiNum, '공지사항 삭제', 'width=400,height=250,top=300,left=550,scrollbars=no,resizable=no');
        }
    </script>
</head>
<body>
<h2 style="text-align:center;">공지사항 목록</h2>

<table>
    <tr>
        <th>번호</th>
        <th>상담사</th>
        <th>제목</th>
        <th>내용</th>    
        <th>관리</th>
    </tr>
    <%
        if (list == null || list.isEmpty()) {
    %>
    <tr><td colspan="5" style="color:gray;">등록된 공지사항이 없습니다.</td></tr>
    <%
        } else {
            for (listDTO dto : list) {
    %>
    <tr>
        <td><%= dto.getNotiNum() %></td>
        <td><%= dto.getCounselorId() %></td>
        <td><%= dto.getTitle() %></td>
        <td><%= dto.getContext() %></td>
        <td class="btn-group">
            <button class="update-btn" onclick="openUpdatePopup(<%= dto.getNotiNum() %>)">수정</button>
            <button class="delete-btn" onclick="openDeletePopup(<%= dto.getNotiNum() %>)">삭제</button>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>

<button class="write-btn" onclick="openWritePopup()">작성하기</button>

</body>
</html>
