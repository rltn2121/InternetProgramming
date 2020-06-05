# 도서 대출 관리 프로그램 / 12161567 박기수

<h2>1.	구성</h2>

**메인, 로그인:** Main.jsp, Login_judge.jsp, Main_login.jsp

**회원 가입:** Subscription.html, Subscription.jsp, Subscription_Result.jsp

**책 검색, 대출/반납:** BookSearch_by_DB.jsp, BorrowReturn.jsp, BorrowReturn_Result.jsp

**CSS:** Style.css   

**에러 페이지:** DBError.jsp


<h2>2.	작동 원리</h2>
 <img src="C:/Users/박기수/Internet Programming/작동 원리.png" width="40%" height="30%" title="px(픽셀) 크기 설정" alt="RubberDuck"></img>
<h2>3.	상세 설명</h2>

**책 목록:** 데이터베이스 booklist – 테이블 goodsinfo

**회원 정보**: 데이터베이스 userlist – 테이블 userinfo

메인 화면(Main.jsp) 에서는 로그인, 회원가입을 할 수 있으며, 로그인 후에 Main_login.jsp로 이동하여 책 검색을 할 수 있다. 책 검색은 도서명 / 저자명 두 가지로 할 수 있고, 대출, 반납 또한 가능하다. 오류 발생 시 DBError.jsp 페이지로 이동하여 에러 메시지를 확인할 수 있다. 회원가입과 책 대출 / 반납을 완료하면 메인화면으로 이동 후에 다시 로그인하여 사용한다.

