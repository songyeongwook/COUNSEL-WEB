<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.CounselApplyDTO" %>
<%@ page import="dao.CounselApplyDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상담 신청 목록</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f2f5;
            margin: 0;
            padding: 40px;
        }

        .container {
            max-width: 1000px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 14px 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #2c3e50;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .no-data {
            text-align: center;
            padding: 20px;
            color: #777;
        }

        .confirmed {
            color: green;
            font-weight: bold;
        }

        .not-confirmed {
            color: red;
            font-weight: bold;
        }

        .confirm-btn {
            background: none;
            border: none;
            color: blue;
            cursor: pointer;
            font-weight: bold;
            text-decoration: underline;
            padding: 0;
            font-size: 1em;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>상담 신청 목록</h2>

    <%
        CounselApplyDAO dao = new CounselApplyDAO();
        List<CounselApplyDTO> applyList = dao.getAllApplies();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        if (applyList != null && !applyList.isEmpty()) {
    %>
        <table>
            <tr>
                <th>사용자 ID</th>
                <th>제목</th>
                <th>내용</th>
                <th>상담 예약 시간</th>  
                <th>확인 여부</th>             
            </tr>
            <%
                for (CounselApplyDTO apply : applyList) {
                    boolean isConfirmed = false;
                    if (apply.getConfirmed() != null) {
                        if (apply.getConfirmed().equalsIgnoreCase("Y") || 
                            apply.getConfirmed().equalsIgnoreCase("확인") || 
                            apply.getConfirmed().equalsIgnoreCase("true")) {
                            isConfirmed = true;
                        }
                    }

                    String formattedDate = apply.getCounselDate() != null ? sdf.format(apply.getCounselDate()) : "";
            %>
            <tr>
                <td><%= apply.getUserId() %></td>
                <td><%= apply.getTitle() %></td>
                <td><%= apply.getContent() %></td>
                <td><%= formattedDate %></td>
                <td class="<%= isConfirmed ? "confirmed" : "not-confirmed" %>">
                    <input type="checkbox" <%= isConfirmed ? "checked disabled" : "" %> />
                    <%
                        if (!isConfirmed) {
                    %>
                        <form action="/name/ConfirmApplyServlet" method="post" style="margin:0; display:inline;">
                            <input type="hidden" name="userId" value="<%= apply.getUserId() %>"/>
                            <input type="hidden" name="counselDate" value="<%= formattedDate %>"/>
                            <button type="submit" class="confirm-btn">확인</button>
                        </form>
                    <%
                        }
                    %>
                </td>
            </tr>
            <% } %>
        </table>
    <%
        } else {
    %>
        <div class="no-data">상담 신청이 없습니다.</div>
    <%
        }
    %>
</div>
</body>
</html>
