<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.sql.Timestamp" %>
<%@ page import="java.time.*, java.time.temporal.ChronoUnit" %>
<%@ page import="model.CounselApplyDTO" %>
<%@ page import="dao.CounselApplyDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>하루 이내 상담 예약</title>
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
    </style>
</head>
<body>
<div class="container">
    <h2>1일 이내 예정된 상담</h2>

    <%
        CounselApplyDAO dao = new CounselApplyDAO();
        List<CounselApplyDTO> applyList = dao.getAllApplies();

        // 현재 시간
        LocalDateTime now = LocalDateTime.now();
        List<CounselApplyDTO> nearList = new ArrayList<>();

        for (CounselApplyDTO apply : applyList) {
            Timestamp counselDate = apply.getCounselDate();
            if (counselDate != null) {
                LocalDateTime counselDateTime = counselDate.toLocalDateTime();
                long hoursBetween = ChronoUnit.HOURS.between(now, counselDateTime);

                if (hoursBetween >= 0 && hoursBetween <= 24) {
                    nearList.add(apply);
                }
            }
        }

        // 정렬 (가장 가까운 시간순)
        nearList.sort(Comparator.comparing(a -> a.getCounselDate()));

        if (!nearList.isEmpty()) {
    %>
        <table>
            <tr>
                <th>사용자 ID</th>
                <th>제목</th>
                <th>내용</th>
                <th>상담 예약 시간</th>
            </tr>
            <%
                for (CounselApplyDTO apply : nearList) {
                    LocalDateTime dt = apply.getCounselDate().toLocalDateTime();
                    String formatted = dt.format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
            %>
            <tr>
                <td><%= apply.getUserId() %></td>
                <td><%= apply.getTitle() %></td>
                <td><%= apply.getContent() %></td>
                <td><%= formatted %></td>
            </tr>
            <% } %>
        </table>
    <%
        } else {
    %>
        <div class="no-data">24시간 이내 상담이 없습니다.</div>
    <%
        }
    %>
</div>
</body>
</html>
