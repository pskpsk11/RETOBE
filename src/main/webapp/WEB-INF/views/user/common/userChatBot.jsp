<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kr.co.retobe.util.CodeToString"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<title>Insert title here</title>
<link rel="stylesheet" href="/tobe/css/reset.css" />
<link rel="stylesheet" href="/tobe/css/common.css" />
<link rel="stylesheet" href="/tobe/css/main.css" />
<link rel="stylesheet" href="/tobe/css/contents.css" />
<link rel="stylesheet" href="/tobe/css/swiper.css" />
<link
     href="https://fonts.googleapis.com/css?family=Sintony:400,700"
     rel="stylesheet"
/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/tobe/js/function.js" type="text/javascript"></script>
<script src="/tobe/js/function_jquery.js" type="text/javascript"></script>
<style>
.chat-container {
    right: 1%;
    z-index: 99999999;
    position: fixed;
    width: 250px;
    height: 300px;
    background-color: #f5f5f5;
    border-radius: 8px;
    overflow-y: auto;
    padding: 20px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 10);
    display: block;
    flex-direction: column;
    align-content: center;
    align-items: flex-start;
    flex-wrap: wrap;
    top: 55%;
}

/* 채팅 창 스타일 */
.chat-messages {
  list-style-type: none;
  padding: 0;
  margin: 0;
}

/* 사용자 메시지 스타일 */
.user-message {
  background-color: #ff5050;
  color: #fff;
  padding: 8px 12px;
  border-radius: 20px;
  margin-bottom: 8px;
  max-width: 70%;
  align-self: flex-end;
}

/* 챗봇 메시지 스타일 */
.bot-message {
  background-color: #28a745;
  color: #fff;
  padding: 8px 12px;
  border-radius: 20px;
  margin-bottom: 8px;
  max-width: 70%;
  align-self: flex-start;
}

/* 입력 필드 스타일 */
.input-field {
  width: calc(100% - 40px);
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 25px;
  margin-top: 20px;
  margin-right: 10px;
  font-size: 16px;
}

/* 입력 버튼 스타일 */
.input-button {
  background-color: #ff5050;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 25px;
  cursor: pointer;
  font-size: 16px;
}

/* x 버튼 스타일 */
.close-button {
  position: absolute;
  top: 10px;
  right: 10px;
  background-color: transparent;
  border: none;
  font-size: 16px;
  cursor: pointer;
}

/* x 버튼 호버 효과 */
.close-button:hover {
  color: #333;
}
#chatIcon {
  	width: 50px;
    cursor: pointer;
    top: 93%;
    right: 1%;
    z-index: 9999999;
    position: fixed;
    display: flex;
    flex-direction: column-reverse;
    align-items: flex-end;
}
#iconchat {
    top: 500px;
    right: 0;
    z-index: 999999;
    position: fixed;
    display: flex;
    flex-direction: column-reverse;
    align-items: flex-end;
}
</style>
<script type="text/javascript">
function courseView() {
	$.ajax({
		type: 'GET',
		url:'/tobe/user/modal.do',
		data:{
			a : 1
		},
		success:function(res) {
			console.log(res);
			$('#ex1').html(res);
			
			$('#ex1').modal();
			
		}
	})
}
</script>
</head>
<body>
	<!-- 아이콘 -->
     	<img src="../img/chat_icon.png" id="chatIcon" />

     <!-- 챗봇 컨테이너 -->
     <div id="chatContainer" class="chat-container" style="display: none">
         <!-- 챗봇 창 닫기 버튼 -->
         <button id="closeButton">X</button>
         <!-- 챗봇 내용을 가져올 부분 -->
         <div id="chatContent"></div>
         <!-- 결과를 표시할 요소 -->
         <div id="text"></div>
         <input type="text" id="msg" class="input-field" />
         <button id="btn" class="input-button">검색</button>
     </div>

    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script>
      // OpenAI API 키
      const apiKey = "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";

      // 요청할 텍스트
      const messages = [
        {
          role: "system",
          content:
            "너는 토익과 토플 영어강사이며, 앞으로 영어학습에 맞는 대답해줘",
        },
        /*
      {
        'role':'user',
        'content':"토익공부는 어떻게해?"
      }
      */
      ];

      // OpenAI API에 요청을 보내는 함수
      // OpenAI API에 요청을 보내는 함수
async function generateText() {
    try {
        // 사용자의 질문을 가져옴
        var userQuestion = document.getElementById("msg").value;
        // 사용자의 질문을 화면에 표시
        document.getElementById("text").innerHTML +=
            "<div class='user-question'>" + userQuestion + "</div>";

        messages.push({
            role: "user",
            content: userQuestion,
        });
        document.getElementById("msg").value = "";

        const response = await axios.post(
            "https://api.openai.com/v1/chat/completions",
            {
                model: "gpt-3.5-turbo",
                messages: messages,
            },
            {
                headers: {
                    "Content-Type": "application/json;charset=UTF-8",
                    Authorization: "Bearer " + apiKey,
                },
            }
        );
        console.log("response:", response);
        // API 응답에서 생성된 텍스트를 추출
        const generatedText = response.data.choices[0].message;

        console.log("Generated Text:", generatedText);
        document.getElementById("text").innerHTML +=
            "<div class='bot-response'>" + generatedText.content + "</div>";
    } catch (error) {
        console.error("Error:", error);
    }
}


      // 버튼 클릭 이벤트 핸들러
      document.getElementById("btn").addEventListener("click", function (e) {
        e.preventDefault();
        generateText(); // 검색 버튼 클릭 시에만 generateText() 호출
      });

      // 아이콘 클릭 이벤트 핸들러
      document
        .getElementById("chatIcon")
        .addEventListener("click", function () {
        	$(".chat-container").toggle();
        });

      // 챗봇 창 닫기 버튼 클릭 이벤트 핸들러
      document
        .getElementById("closeButton")
        .addEventListener("click", function () {
          document.getElementById("chatContainer").style.display = "none";
          // 아이콘 다시 보이게 하기
          document.getElementById("chatIcon").style.display = "block";
        });
    </script>
</body>
</html>