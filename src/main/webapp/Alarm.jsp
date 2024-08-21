<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>농사의 고수 - 농작물 재배 캘린더</title>
<link rel="apple-touch-icon" href="img/logo.png">
<link rel="shortcut icon" type="image/x-icon" href="img/logo.ico">
<link
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/locales/ko.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.css">
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	padding: 30px;
}

.header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	background-color: #fff;
	border-bottom: 1px solid #eaeaea;
}

.logo {
	display: flex;
	align-items: center;
	font-size: 45px;
	font-weight: bold;
	background: linear-gradient(to right top, green, yellow);
	color: transparent;
	-webkit-background-clip: text;
	margin-left: 90px;
	margin-bottom: 15px;
}

.logo-image {
	width: 55px;
	height: 55px;
}

.top-right {
	position: absolute;
	top: 50px;
	right: 120px;
}

.top-right a {
	font-size: 30px;
	font-weight: bold;
	color: #000000;
	text-decoration: none;
	border-radius: 5px;
}

.home {
	width: 40px;
	height: auto;
	margin-right: 5px;
	margin-bottom: 10px;
	vertical-align: middle;
}

h2 {
	text-align: center;
	font-weight: bold;
	margin-top: 50px;
	margin-bottom: 10px;
}

#calendar {
	width: 90%;
	max-width: 1500px;
	height: auto; /* 높이를 auto로 설정 */
	background-color: #ffffff;
	border-radius: 8px;
	padding: 10px;
	margin: 0 auto;
}

.content {
	text-align: center;
	padding: 20px;
}

/* 캘린더 글자색 및 글자 크기 변경 */
.fc .fc-event-title {
	color: #ff0000; /* 글자색을 빨간색으로 변경 */
	font-size: 18px; /* 글자 크기를 16px로 변경 */
}

.fc .fc-daygrid-day-number {
	color: black; /* 날짜 숫자 색상을 검은색으로 변경 */
	font-size: 20px; /* 글자 크기를 14px로 변경 */
	text-decoration: none; /* 밑줄 제거 */
}
</style>
</head>

<body>
	<div class="header">
		<div class="logo">
			농사의 고수 <img alt="로고이미지" src="img/logo.png" class="logo-image">
		</div>
		<div class="top-right">
			<a href="Real_Main.jsp"><img src="img/home.png" alt="홈버튼이미지"
				class="home">메인</a>
		</div>
	</div>
	<h2>농작물재배 캘린더</h2>
	<div class="content">
		<!-- SweetAlert 메시지 -->
		<script>
            Swal.fire({
                title: "농작물 재배 알림",
                text: "감자, 고구마, 참깨, 팥의 모종을 심을 시기입니다!",
                icon: "info",
                confirmButtonColor: "#6DD66D", // 확인 버튼 색상 설정
                confirmButtonText: "확인"
            });
        </script>
	</div>

	<div id="calendar"></div>

	<!-- Add/Edit Event Modal -->
	<div class="modal fade" id="eventModal" tabindex="-1"
		aria-labelledby="eventModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="eventModalLabel">이벤트</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="eventForm">
						<input type="hidden" id="eventId">
						<div class="mb-3">
							<label for="eventTitle" class="form-label">제목</label> <input
								type="text" class="form-control" id="eventTitle" required>
						</div>
						<div class="mb-3">
							<label for="eventStart" class="form-label">시작 날짜</label> <input
								type="datetime-local" class="form-control" id="eventStart"
								required>
						</div>
						<div class="mb-3">
							<label for="eventEnd" class="form-label">종료 날짜</label> <input
								type="datetime-local" class="form-control" id="eventEnd">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" id="deleteEventButton" class="btn btn-danger">삭제</button>
					<button type="button" id="saveEventButton" class="btn btn-primary">저장</button>
				</div>
			</div>
		</div>
	</div>

	<script>
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');

            function loadEvents() {
                var events = localStorage.getItem('calendarEvents');
                return events ? JSON.parse(events) : [];
            }

            function saveEvents(events) {
                localStorage.setItem('calendarEvents', JSON.stringify(events));
            }

            function addDefaultEvents(events) {
                const defaultEvents = [
                    {
                        id: '1',
                        title: '감자 모종심기',
                        start: '2024-06-01T10:00:00',
                        end: '2024-06-01T11:00:00'
                    },
                    {
                        id: '2',
                        title: '고구마 모종심기',
                        start: '2024-06-01T13:00:00',
                        end: '2024-06-01T14:00:00'
                    },
                    {
                        id: '3',
                        title: '참깨 모종심기',
                        start: '2024-06-01T14:00:00',
                        end: '2024-06-01T15:00:00'
                    },
                    {
                        id: '4',
                        title: '팥 모종심기',
                        start: '2024-06-01T15:00:00',
                        end: '2024-06-01T16:00:00'
                    }
                ];

                if (events.length === 0) {
                    events.push(...defaultEvents);
                    saveEvents(events);
                }
                return events;
            }

            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                locale: 'ko',
                editable: true,
                height: 'auto', // 캘린더 높이를 자동으로 설정
                events: addDefaultEvents(loadEvents()),
                dateClick: function (info) {
                    document.getElementById('eventForm').reset();
                    document.getElementById('eventId').value = '';
                    document.getElementById('eventStart').value = info.dateStr;
                    document.getElementById('eventEnd').value = '';
                    var eventModal = new bootstrap.Modal(document.getElementById('eventModal'));
                    eventModal.show();
                },
                eventClick: function (info) {
                    document.getElementById('eventId').value = info.event.id;
                    document.getElementById('eventTitle').value = info.event.title;
                    document.getElementById('eventStart').value = info.event.start.toISOString().slice(0, 16);
                    if (info.event.end) {
                        document.getElementById('eventEnd').value = info.event.end.toISOString().slice(0, 16);
                    } else {
                        document.getElementById('eventEnd').value = '';
                    }
                    var eventModal = new bootstrap.Modal(document.getElementById('eventModal'));
                    eventModal.show();
                },
                eventDrop: function (info) {
                    saveEvent(info.event);
                },
                eventResize: function (info) {
                    saveEvent(info.event);
                }
            });

            function saveEvent(event) {
                var events = loadEvents();
                var eventData = {
                    id: event.id,
                    title: event.title,
                    start: event.start,
                    end: event.end
                };
                var index = events.findIndex(e => e.id === event.id);
                if (index > -1) {
                    events[index] = eventData;
                } else {
                    events.push(eventData);
                }
                saveEvents(events);
            }

            function deleteEvent(id) {
                var events = loadEvents();
                events = events.filter(event => event.id !== id);
                saveEvents(events);
            }

            calendar.render();

            document.getElementById('saveEventButton').addEventListener('click', function () {
                var id = document.getElementById('eventId').value;
                var title = document.getElementById('eventTitle').value;
                var start = document.getElementById('eventStart').value;
                var end = document.getElementById('eventEnd').value;

                if (title) {
                    var eventData = {
                        id: id || String(Date.now()),
                        title: title,
                        start: start,
                        end: end ? end : null
                    };

                    if (id) {
                        var event = calendar.getEventById(id);
                        event.setProp('title', title);
                        event.setDates(start, end);
                        saveEvent(event);
                    } else {
                        calendar.addEvent(eventData);
                        saveEvent(eventData);
                    }

                    var eventModal = bootstrap.Modal.getInstance(document.getElementById('eventModal'));
                    eventModal.hide();
                }
            });

            document.getElementById('deleteEventButton').addEventListener('click', function () {
                var id = document.getElementById('eventId').value;
                if (id) {
                    var event = calendar.getEventById(id);
                    event.remove();
                    deleteEvent(id);

                    var eventModal = bootstrap.Modal.getInstance(document.getElementById('eventModal'));
                    eventModal.hide();
                }
            });

            document.querySelector('.btn-close').addEventListener('click', function () {
                var eventModal = bootstrap.Modal.getInstance(document.getElementById('eventModal'));
                eventModal.hide();
            });

            document.querySelector('.btn-secondary').addEventListener('click', function () {
                var eventModal = bootstrap.Modal.getInstance(document.getElementById('eventModal'));
                eventModal.hide();
            });
        });
    </script>
	<jsp:include page="footer.jsp" />
</body>

</html>
