/**
 *  reply.js
 */
console.log("start");

var replyService = (function(){
    var sum= function (a,b){
        return a+b
    };
//등록.
    function add(reply = {},callback){
        $.ajax({
            type:'post',
            url: '/replies/new',
            data: JSON.stringify(reply),
            contentType: 'application/json',
            success: function (result){
                if(callback){
                   callback(result); //callback 함수의 매개값으로 result 을 사용. 
                }
            },
            drror: function(reject){
                console.log(reject);

            }
        })

    }
    //글번호 ->댓글정보 보여줌.
    function getList(param={}, callback,error){
        var bno = param.bno;
        var page = param.page;
        $.getJSON('/replies/pages/'+ bno + '/' + page + '.json', function(data){
            if(callback){
            
            callback(data.replyCnt, data.list);
            }
        }).fail(function(err){
            if(error){
            
            error(err);
            }
        })
    }
    //삭제
    function remove(rno,callback, error){
        $.ajax({
            method: 'delete',
            url: '/replies/' + rno,
            success: function(result){
                if(callback){
                    callback(result);
                }
            },
            error: function(reject){
                if(error){
                    error(reject);
                }
            }
        })
    }
    //수정
    function update(reply={}, callback, error){
        $.ajax({
            type: 'put',
            url:'/replies/' + reply.rno,
            data:JSON.stringify(reply),
            contentType: 'application/json;charset= UTF-8',
            success:function(result){
                if(callback){
                    callback(result);
                }
            },
            error: function(reject){
                if(error){
                    error(reject);
                }
            }
        })
    }

    //단건조회
    function get(rno, callback, error){
        $.get('/replies/' +rno+'.json', function (result){
            if(callback){
                callback(result);
            }
        }).fail(function(reject){
            if(error)
            error(reject);
        })
    }

    function displayTime(timeValue) {
        //현재시간을 기준으로 24시간 날짜보여주고
        //24시간 이내 데이터는 시간을 보여준다.
        var today= new Date();
        var gap=today.getTime() - timeValue; //1680938301000
        var dateObj = new Date(timeValue); // getFullYear, getMonth
        if(gap<(1000 *60 *60*24)) {
            var hh = dateObj.getHours();
            var mm = dateObj.getMinutes();
            var ss = dateObj.getSeconds();
            return [(hh>9?'':'0') + hh, ':' , (mm>9?'':'0')+mm, ':',(ss>9?'':'0')+ss].join('');
        }else{
            var yy=dateObj.getFullYear();
            var mm=dateObj.getMonth()+1;
            var dd = dateObj.getDate();
            return [yy,'/',(mm>9?'':'0')+mm,'/',(dd>9?'':'0')+dd  ].join('');
        }
    }


    return {
        sum: sum,
        add: add,
        getList: getList,
        remove:remove,
        update:update,
        get:get,
        displayTime:displayTime

    }

})(); 
// var reply = {bno: 300 , reply: 'ajax를 통한 댓글' ,  replyer:"user00"}
// replyService.add(reply, function(result){
//     alert("Result:" + result)
// })

