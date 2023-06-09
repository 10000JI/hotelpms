<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Sona Template">
    <meta name="keywords" content="Sona, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!--css-->
    <c:import url="./temp/style.jsp"></c:import>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js'></script>
    <!--css-->
    <style>
        .calender-date {
            background: #ffffff;
            padding: 13px 10px 20px 10px;
            border-radius: 4px;
        }

        .detailButton {
            display: block;
            font-size: 14px;
            text-transform: uppercase;
            border: 1px solid #dfa974;
            border-radius: 2px;
            color: #dfa974;
            font-weight: 500;
            background: transparent;
            width: 100%;
            height: 46px;
            margin-top: 10px;
        }

    </style>
</head>

<body>

    <!-- Header Section Begin -->
    <c:import url="./temp/header.jsp"></c:import>
    <!-- Header End -->

    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="hero-text">
                        <spring:message code="welcome" var="m" text=""/>
                        <h1>${m}</h1>
                        <br>
                        <spring:message code="reservation" var="r" text=""/>
                        <h1>${r}</h1>
                        <spring:message code="homesite" var="hs" text=""/>
                        <p>${hs}</p>
                        <spring:message code="discover" var="ds" text=""/>
                        <a href="/booking/reservation" class="primary-btn">${ds}</a>
                    </div>
                </div>
                <sec:authorize access="isAuthenticated()">
                <div class="col-xl-4 col-lg-5 offset-xl-2 offset-lg-1">
                    <div class="card" >
                        <div class="card-body">
                            <div class="d-flex flex-column align-items-center text-center">
                                <img src="https://cdn-icons-png.flaticon.com/512/847/847969.png?w=826&t=st=1685410931~exp=1685411531~hmac=aba334bfa86956cf27ba3e0af2fab07921b71a199210d274bef4d91c7be12a95" alt="Admin" class="rounded-circle p-1 bg-secondary" width="110">
                                <div class="mt-3">
                                    <h4><sec:authentication property="principal.id"/></h4>
<%--                                    <div class="custom-padding" style="background-color: white; padding: 10px;"></div>--%>
                                </div>
                            </div>
                            <hr class="my-4">
                            <c:if test="${empty payVO}">
                            <p class="text-secondary mb-1 text-center" style="padding: 50px;">객실 예약 정보가 없습니다</p>
                            </c:if>
                            <c:if test="${not empty payVO}">
                                 <ul class="list-group list-group-flush">
                                     <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                         <h6 class="mb-0">룸타입</h6>
                                         <span class="text-secondary">${payVO.roomType}룸</span>
                                     </li>
                                     <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                         <h6 class="mb-0">룸번호</h6>
                                         <span class="text-secondary">${payVO.roomNumber}호</span>
                                     </li>
                                     <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                         <h6 class="mb-0">기간</h6>
                                         <c:set var="differenceInDays" value="${((payVO.checkoutDate.time - payVO.checkinDate.time) / (1000 * 60 * 60 * 24)) + 1}" />
                                         <c:set var="stayDescription" value="${fn:substringBefore(differenceInDays, '.')}박 ${fn:substringBefore(differenceInDays + 1, '.')}일" />

                                         <span class="text-secondary">${stayDescription}</span>
                                     </li>
<%--                                     <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">--%>
<%--                                         <h6 class="mb-0">EMAIL</h6>--%>
<%--                                         <span class="text-secondary"><sec:authentication property="principal.email" /></span>--%>
<%--                                     </li>--%>
                                     <%--<button class="btn btn-primary" style="margin-right: 10px;">나의 예약내역 보기</button>--%>
                                     <a href="/pay/paymentDetail"><button class="detailButton" >나의 예약내역 보기</button></a>
                                     <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                     </li>
                                 </ul>
                            </c:if>
                        </div>
                    </div>

                </div>
                </sec:authorize>
                <sec:authorize access="!isAuthenticated()">
               <div class="col-xl-6" >
                    <div id="calendar" class="calender-date"></div>
                </div>
                </sec:authorize>
            </div>
        </div>
        <div class="hero-slider owl-carousel">
            <div class="hs-item set-bg" data-setbg="/img/hero/hero-1.jpg"></div>
            <div class="hs-item set-bg" data-setbg="/img/hero/hero-2.jpg"></div>
            <div class="hs-item set-bg" data-setbg="/img/hero/hero-3.jpg"></div>
        </div>
    </section>
    <!-- Hero Section End -->

    <div class="custom-section">
        <div class="custom-section-content">
            <!-- 새로운 <div> 태그를 추가하고 패딩과 배경색을 적용합니다 -->
            <div class="custom-padding" style="background-color: white; padding: 50px;">
            </div>
        </div>
    </div>



<%--    <!-- Search model Begin -->--%>
<%--    <div class="search-model">--%>
<%--        <div class="h-100 d-flex align-items-center justify-content-center">--%>
<%--            <div class="search-close-switch"><i class="icon_close"></i></div>--%>
<%--            <form class="search-model-form">--%>
<%--                <input type="text" id="search-input" placeholder="Search here.....">--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <!-- Search model end -->--%>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridWeek', // 일주일치 보기로 설정
                headerToolbar: {
                    left: 'prev,next',
                    center: 'title',
                    right: 'dayGridWeek,dayGridDay'
                }, // 헤더 영역 설정
                // eventMinHeight: 50, // 이벤트의 최소 높이 설정 (픽셀 단위)
                // slotMinTime: '15:00', // 오후 3시부터 시작
                // slotMaxTime: '16:00', // 오후 4시까지 종료
                events: [
                    <c:forEach var="dto" items="${duubleList}">
                    {
                        title : '${dto.roomType}',
                        start : '${dto.reservationDate}'+'T15:00:00',
                        url : 'http://localhost/booking/reservationRoom?checkinDate=${dto.reservationDate}',
                        color : '#FF0000'
                    },
                    </c:forEach>

                    <c:forEach var="dto" items="${deluxList}">
                    {
                        title : '${dto.roomType}',
                        start : '${dto.reservationDate}'+'T15:00:00',
                        url : 'http://localhost/booking/reservationRoom?checkinDate=${dto.reservationDate}',
                        color : '#FF0000'

                    },
                    </c:forEach>

                    <c:forEach var="dto" items="${sweetList}">
                    {
                        title : '${dto.roomType}',
                        start : '${dto.reservationDate}'+'T15:00:00',
                        url : 'http://localhost/booking/reservationRoom?checkinDate=${dto.reservationDate}',
                        color : '#FF0000'
                    },
                    </c:forEach>

                    <c:forEach var="dto" items="${standardList}">
                    {
                        title : '${dto.roomType}',
                        start : '${dto.reservationDate}'+'T15:00:00',
                        url : 'http://localhost/booking/reservationRoom?checkinDate=${dto.reservationDate}',
                        color : '#FF0000'
                    },
                    </c:forEach>

                    <c:forEach var="dto" items="${twinList}">
                    {
                        title : '${dto.roomType}',
                        start : '${dto.reservationDate}'+'T15:00:00',
                        url : 'http://localhost/booking/reservationRoom?checkinDate=${dto.reservationDate}',
                        color : '#FF0000'
                    },
                    </c:forEach>

                    <c:forEach var="dto" items="${possibleList}">
                    {
                        title : '${dto.roomType}',
                        start : '${dto.reservationDate}'+'T15:00:00',
                        url : 'http://localhost/booking/reservationRoom?checkinDate=${dto.reservationDate}',
                        color : '#0000FF'
                    },
                    </c:forEach>
                ]
            });

            calendar.render();
        });
    </script>
    <!-- Footer Section Begin -->
    <c:import url="./temp/footer.jsp"></c:import>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <c:import url="./temp/js.jsp"></c:import>
</body>

</html>