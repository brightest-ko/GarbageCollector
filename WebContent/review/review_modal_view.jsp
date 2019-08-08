<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="review.ReviewVO,review.ReviewDAO,review.ReviewDAO_Impl"
    %>

<%--  // Sample Example . ctxPath는 import되서 지정될거임
   Integer serialNo = 123456; // 클릭한 serialNo
   String helperID = "jsb@naver.com"; // 클릭한 게시물의 helperID를 가져옴
   String review_title = "test title"; // 클릭한 serialNo의 게시물을 가져옴
   Double rate = 3.0;
   //$('input[name="item"]:radio[value="3"]').prop('checked',true); 라디오체크 
   //$("[name=Radio name]:not(:checked)").attr('disabled','disabled'); // 값들이 전송x
   String review_cleanhouse = "cleanhouse place";
--%>
<!-- ############# Note ################### 
   This is imported by review_list Page.
 -->
    <!DOCTYPE html>
    <div class="modal fade" id="review_Modal_view${vo.serialNo}" role="dialog">
         <div class="modal-dialog">
          
            <!-- Modal content-->
             <div class="modal-content">
                 <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title" align="center" style="font-weight: bold">고객 리뷰글</h4>
                 </div>
                 <!--  <form method="POST" action="< %=ctxPath%>/review_insert.do"> -->
                    <div class="modal-body">
                        <div class="row">
                          <div class="col-md-4" style="text-align:center;">
                             <label for="info_serialNo" style="padding-top:8px">신청번호</label>
                          </div>
                           <div class="col-md-8">
                              <input class="form-control" id="info_serialNo" type="text" name="info_serialNo" value="${vo.serialNo}" readonly style="margin-left:0px;"/>
                           </div>
                         </div>
   
                       <div class="row">
                          <div class="col-md-4" style="text-align:center;">
                           <label for="info_review_title" style="padding-top:8px">제목</label>
                        </div>
                        <div class="col-md-8">
                            <input class="form-control" id="info_review_title" type="text" name="info_review_title" value="${vo.reviewTitle}" readonly style="margin-left:0px;"/>
                        </div>
                       </div>
                       <div class="row">
                          <div class="col-md-4" style="text-align:center;">
                           <label for="info_helperID" style="padding-top:8px">대행자</label>
                        </div>
                        <div class="col-md-8">
                           <input class="form-control" id="info_helperID" type="text" name="info_helperID" value="${vo.helperID}" readonly style="margin-left:0px;"/>
                        </div>
                       </div>
                     <div class="row">
                        <div class="col-md-4" style="text-align:center;">
                           <label for="rating" style="padding-top:8px">평점</label>
                        </div>
                        <div class="col-md-8" style="height:34px;">
                           <!-- Rating Stars Box -->
                           <div class="rate" style="
       width: 100%;
       float: left;
       height: 46px;
       padding: 0 calc( 50% - 75px );">
                              <input type="radio" id="star1" name="rating" value="5" onClick="javascript:ChkRating('1')"/>
                                 <label for="star1" title="text" style="margin-bottom: 0px;">1 star</label>
                                 <input type="radio" id="star2" name="rating" value="4" onClick="javascript:ChkRating('2')"/>
                                 <label for="star2" title="text" style="margin-bottom: 0px;">2 stars</label>
                                 <input type="radio" id="star3" name="rating" value="3" onClick="javascript:ChkRating('3')"/>
                               <label for="star3" title="text" style="margin-bottom: 0px;">3 stars</label>
                                 <input type="radio" id="star4" name="rating" value="2" onClick="javascript:ChkRating('4')"/>
                               <label for="star4" title="text" style="margin-bottom: 0px;">4 stars</label>      
                               <input type="radio" id="star5" name="rating" value="1" onClick="javascript:ChkRating('5')" />
                               <label for="star5" title="text" style="margin-bottom: 0px;">5 stars</label>
                           </div>
                        </div>
                     </div>
                         <div class="row">
                          <div class="col-md-4" style="text-align:center;">
                           <label for="info_review_cleanhouse" style="padding-top:8px">클린하우스 위치</label>
                        </div>
                        <div class="col-md-8">
                            <input class="form-control" id="info_review_cleanhouse" type="text" name="info_review_cleanhouse" value="${vo.cleanPlaceAddrFront}" readonly style="margin-left:0px;"/>
                        </div>
                       </div>
                       <div class="row">
                          <div class="col-md-12" style="text-align:center;">
                             <textarea class="form-control ta" id="info_review_content" name="info_review_content" scrolling="no" readonly style="margin-left: 0px;">"${vo.reviewContent}"</textarea>
                        </div>
                       </div>
                    </div>
                    <div class="modal-footer"> 
                       <button id="modifyBtn" class="btn btn-md" name="modify" style="background-color:#ADCB00;color:black;" value="수정" href="#review_Modal_modify${vo.serialNo}" >수정</button> <!-- onClick="javascript:Chk_Auth()"/> -->
                       <button id="deleteBtn" class="btn btn-md" name="delete" style="background-color:#ADCB00;color:black;" value="삭제" >삭제</button> <!-- onClick="javascript:Chk_Auth()"/> -->
                    </div>
                 <!-- </form> -->
               </div>
           </div>
      </div>