<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>작성 완료</title>
    <script type="text/javascript">
        // 부모 창 새로고침하고 현재 팝업 닫기
        window.onload = function() {
            alert("공지사항이 작성되었습니다.");
            if (window.opener && !window.opener.closed) {
                window.opener.location.reload();  // 부모창 새로고침
            }
            window.close();  // 팝업 닫기
        };
    </script>
</head>
<body>
    <p>공지사항 등록 중...</p>
</body>
</html>
