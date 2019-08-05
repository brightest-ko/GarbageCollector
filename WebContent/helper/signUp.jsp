<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="EUC-KR" %>

<!DOCTYPE html>

<html>
<head>
    <title>회원가입 페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <script>
        var good_a = ["전체"];
        var good_b = ["한림읍", "애월읍", "구좌읍", "조천읍", "한경면", "추자면", "우도면", "일도동",
            "이도동", "삼도동", "용담동", "건입동", "화북동", "삼양동", "봉개동", "아라동", "오라동",
            "연동", "노형동", "외도동", "이호동", "도두동"];
        var good_c = ["대정읍", "남원읍", "성산읍", "안덕면", "표선면", "송산동", "정방동", "중앙동", "천지동",
            "효돈동", "영천동", "동흥동", "서홍동", "대륜동", "대천동", "중문동", "예래동"];

        function categoryChange1(e) {

            var target1 = document.getElementById("good1");

            if (e.value == "a") var d = good_a;
            else if (e.value == "b") var d = good_b;
            else if (e.value == "c") var d = good_c;

            target1.options.length = 0;

            for (x in d) {
                var opt = document.createElement("option");
                opt.value = d[x];
                opt.innerHTML = d[x];
                target1.appendChild(opt);
            }
        }

        function categoryChange2(e) {

            var target2 = document.getElementById("good2");

            if (e.value == "a") var d = good_a;
            else if (e.value == "b") var d = good_b;
            else if (e.value == "c") var d = good_c;

            target2.options.length = 0;

            for (x in d) {
                var opt = document.createElement("option");
                opt.value = d[x];
                opt.innerHTML = d[x];
                target2.appendChild(opt);
            }
        }


        function categoryChange3(e) {

            var target3 = document.getElementById("good3");

            if (e.value == "a") var d = good_a;
            else if (e.value == "b") var d = good_b;
            else if (e.value == "c") var d = good_c;

            target3.options.length = 0;

            for (x in d) {
                var opt = document.createElement("option");
                opt.value = d[x];
                opt.innerHTML = d[x];
                target3.appendChild(opt);

            }
        }
    </script>
</head>
<body>


<h2>대행 회원 가입</h2>

<form method="POST" action="fileup" enctype="multipart/form-data">
    <input type="submit" value="사진업로드"/>
</form>

<form method="post" action="helper_add.do">
    Email (ID) : <input type="text" name="email" placeholder="Email을 입력하세요 ">
    <br/>
    password : <input type="password" name="pw">
    <br/>
    password 확인 : <input type="password" name="pw">
    <br/>
    이름 : <input type="text" name="helper_name">
    <br/>
    전화번호 : <input type="text" name="phoneNum" placeholder="'-'를 제외한 숫자만 입력하세요.">
    <br/>
    성별 : <input type="radio" name="sex" value="female"> 여성
    <input type="radio" name="sex" value="male"> 남성
    <br/>
    계좌번호 : <input type="text" name="bank" size="20" placeholder="은행명">
    <input type="text" name="account" size="40" placeholder="'-'를 제외한 숫자만 입력하세요.">
    <input type="text" name="accountname" size="10" placeholder="예금주">

    <br/>
    주소 : <input type="text" name="addr" size="50" placeholder="00시 00동 까지만 적어주세요.">
    <input type="text" name="addr_detail" size="40" placeholder="나머지 주소를 입력해주세요.">

    <br/> <br/>
    희망 근무지1 :
    <select onchange="categoryChange1(this)" name="city1" id="city1" value="">
        <option> 시 </option>
        <option value="a"> 전체</option>
        <option value="b"> 제주시</option>
        <option value="c"> 서귀포시</option>
    </select>

    <select id="good1" name="dong1">
        <option> 읍, 면, 동 </option>
    </select>


    <br/>
    희망 근무지2 :
    <select onchange="categoryChange2(this)" name="city2" id="city2" value="">
        <option> 시 </option>
        <option value="a"> 전체</option>
        <option value="b"> 제주시</option>
        <option value="c"> 서귀포시</option>
    </select>

    <select id="good2" name="dong2">
        <option> 읍, 면, 동 </option>
    </select>


    <br/>
    희망 근무지3 :
    <select onchange="categoryChange3(this)" name="city3" id="city3" value="">
        <option> 시 </option>
        <option value="a"> 전체</option>
        <option value="b"> 제주시</option>
        <option value="c"> 서귀포시</option>
    </select>


    <select id="good3" name = "dong3">
        <option> 읍, 면, 동 </option>
    </select>
    <br/>
    <br/>

    하고싶은 말
    <br/>
    <textarea name="message" rows="5" cols="40" placeholder="자신에 대해 한마디로 표현해주세요." maxlength="200">
    </textarea>
    <input type="submit"/>
    <!--
    <div class="container">
        <form>
            <div class="form-group">
                <label for="comment">하고 싶은 말:</label>
                <textarea class="form-control" rows="5" col="40" name="messege" id="comment"></textarea>
            </div>
        </form>
    </div>
    -->

</form>
<br/><br/>
</body>
</html>
