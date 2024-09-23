<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
  <form action="">
    <input type="text" id="inp" required>
    <button id="inp">입력</button>
  </form>


<script>
$function(){
  let btn = $("#btn");

  inp.on("click", function(){
    let inp = $("#inp").val();

    if(inp.length!=0){
      $.ajax({
        url: "/chat.do",
        type: "post",
        data: {
          inp: inp
        },
        success: function(res){
          console.log(res);
          $("#chatArea").text(res);
        }
      })
    }
  })
}



</script>
</body>
</html>