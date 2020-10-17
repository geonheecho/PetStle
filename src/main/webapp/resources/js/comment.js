/**
 * 
 */
 function test(){
    	//alert("test success");
    }

var c_repid='${report.repid}';
//원래는 해당게시글번호를 참조하는데 우리는 게시글 번호가 없어서 석호짱한테 물어봐야함.. repid로 해야하는것인지 일단은...!

$('[name=commentInsertButton]').click(function(){//댓글 등록 버튼 클릭시에!
    var insertData = $('[name=commentInsertForm]').serialize();
    commentInsert(insertData);
});


//댓글목록
function CommentList(){
   // alert("ajax");
    //alert("c_repid"+ c_repid);
    
    $.ajax({
        url : '/Comment/list',
        type : 'get',      
       	data : {c_repid:c_repid},
        success : function (data){
            alert("commentList 통신 success");
            alert("data : "+data);
            alert("data.length : "+data.length);
            var a = "";
            $.each(data, function (key, value){
                a += "<div class= 'commentArea' style='border-bottom:1px solid darkgray; margin-bottom: 15px'>";
                a += "<div class= 'commentInfo'>'댓글번호: "+value.cno+" /작성자 : " + value.c_repid;
                a +="<a onclick= 'commentUpdate("+value.cno+"),"+value.content+");> 수정 </a>";
                a +="<a onclick= 'CommentDelete("+value.cno+");'>삭제 </a> </div>";
                a += "<div class= 'commentContent("+value.cno+">' <p> 내용: '"+ value.content + "'</p>";
                a += "</div><div>";               
            });
                $(".CommentList").html(a);
              //  alert("이건들어오니?");
        }
    });
}





function commentInsert(insertData){
    $.ajax({
        url : '/Comment/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            //alert("commentInsert 통신 success");
            if(data == 1){
                CommentList(insertData);//댓글 작성 후 댓글목롱 reload
                $('[name == content]').val('');
            }
        }
    });	
}


//댓글수정 input 폼으로 변경!!!
function commentUpdate(cno, content){
    var a="";
    
    a += "<div class= 'input-group'>";
    a += "<input type='text' class='form-control' name='content_"+cno+"' value='"+content+"'/>";
    a += "<span class='input-group-btn'><button class='btn btn-default' type='button' onclick='commentUpdateProc("+cno+");'>수정</button></span>";
    a += "</div>";
    
    $('.commentContent' +cno).html(a);
    
}

//댓글 수정 

function commentUpdateProc(cno){
    var updateContent = $('[name=content_]'+cno+']').val();
    
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'content' : updateContent, 'cno' : cno},
        success : function(data){
            if(data == 1 )CommentList(c_repid);//댓글 수정후 목록 출력
        }
    });
}
//댓삭
function CommentDelete(cno){
    $.ajax({
        url:'/comment/delete',
        type: 'post',
        success : function(data){
            if(data == 1 )CommentList(repid);
        }
    });	
}

$(document).ready(function(){
       c_repid=document.getElementById('c_repid').value;
    CommentList();
});
