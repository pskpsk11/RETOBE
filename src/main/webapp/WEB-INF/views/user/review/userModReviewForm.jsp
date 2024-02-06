<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <script src="/tobe/smarteditor/js/HuskyEZCreator.js"></script>
    <link rel="stylesheet" href="/tobe/css/user_Header_Footer.css" />
    <script>
    var oEditors = [];
    $(function() {
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "r_content",
            sSkinURI: "/tobe/smarteditor/SmartEditor2Skin.html",    
            htParams : {
                bUseToolbar : true,                // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                bUseVerticalResizer : true,        // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                bUseModeChanger : true,            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                fOnBeforeUnload : function(){
                }
            }, //boolean
            fOnAppLoad : function(){
                //예제 코드
                //oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
            },
            fCreator: "createSEditor2"
        });
    })
    function goSave() {
    	oEditors.getById['r_content'].exec('UPDATE_CONTENTS_FIELD',[]);
    	$("#frm").submit();
    }
    
    function updateInputValue(selectstar) {
    	var ratingVal =$(selectstar).val();
        document.getElementById('r_rating').value = ratingVal;
    }
</script>
<style>

	.sub {
	   
	    position: relative;
	    top: 13rem;
	}
	.board_write{
		width: 80%;

	}
 	 .rating {
 	 		direction: rtl;
            text-align: left;
            position: relative;
            font-size: 25px;
        }

        .star {
            display: none;
        }

        .label {
            display: inline-block;
            padding: 10px;
            cursor: pointer;
            position: relative;
           
        }

        .label::before {
 			content: '★';
            top: 0;
            left: 0;
            color: #ccc;
            transition: color 0.3s ease-in-out;
        }

        .star:checked ~ .label::before {
            color: black;
        }
	
</style>
</head> 
<body>
    <div class="wrap">
       <%@ include file="/WEB-INF/views/user/common/userHeader.jsp" %>
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">수강후기 작성</h3>
    
                <div class="bbs">
                <form method="post" name="frm" id="frm" action="insert.do" enctype="multipart/form-data" >
                	  <input type="hidden" name="course_no" value="${infoCourse_no}">
                	  <input type="hidden" name="detail_no" value="${infoDetail_no}">
                    <table class="board_write">
                  
                        <tbody>
                        <tr>
                        	<th>제목</th>
                            <td>
                                <input type="text" name="r_title" id="r_title" style="width:100%;"value=""/>
                            </td>
                        </tr>
                        <tr>
                        	<th>작성자</th>
                            <td>
                                <!-- <input type="text" name="course" id="course" style="width:100%;"value="${infoCourseName } "/> -->
                                ${loginInfo.name }
                            </td>
                        </tr>
                        <tr>
                        	<th>강좌명</th>
                            <td>
                                <!-- <input type="text" name="course" id="course" style="width:100%;"value="${infoCourseName } "/> -->
                                ${infoCourseName }
                            </td>
                        </tr>
                        <tr>
                        	<th>별점</th>
                        	<td>
								<div class="rating"> 
								    <input type="radio" name="star" class="star" id="star5" value="5" onclick="updateInputValue(this);">
								    <label for="star5" class="label"></label>
								
								    <input type="radio" name="star" class="star" id="star4" value="4" onclick="updateInputValue(this);">
								    <label for="star4" class="label"></label>
								
								    <input type="radio" name="star" class="star" id="star3" value="3" onclick="updateInputValue(this);">
								    <label for="star3" class="label"></label>
								
								    <input type="radio" name="star" class="star" id="star2" value="2" onclick="updateInputValue(this);">
								    <label for="star2" class="label"></label>
								
								    <input type="radio" name="star" class="star" id="star1" value="1" onclick="updateInputValue(this);">
								    <label for="star1" class="label"></label>
								</div>
							</td>	
							<!-- 별점을 담을 input 태그 -->
							<input type="hidden" id="r_rating" name="r_rating" value="">
							
                        </tr>                      
                        <tr>
                        	<th>내용</th>
                            <td>
                                <textarea name="r_content" id="r_content" style="width:100%;"></textarea>
                            </td>
                        </tr>
                        <tr>
                        	<td>
                         	<div class="btnSet"  style="text-align:right;">
                        	<a class="btn" href="javascript:goSave();">저장</a>
                        	<a href="javascript:;" class="btn" onclick="history.back();">취소</a></div>
                        	</div></td>
                        </tr>
                        </tbody>
                    </table>
                
                    </form>
                </div>
            </div>
        </div>
		<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
    </div>
</body> 
</html>