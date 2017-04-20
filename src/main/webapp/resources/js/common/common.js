/**
 * Created by admin on 4/7/2017.
 */
/**
 * malertInfo('你好','infoMessage warning',{});
 */
function malertInfo(msg,cl,config,style){
    var c_s="<div id='malert_Info' style='"+style+"' class='"+cl+"'>"+msg+"</div>";
    if($("#malert_Info").length!=0){
        $("#malert_Info").remove();
    }
    $("body").append(c_s);
    var fi=600,fo=600,st=1500,c_c=$("#malert_Info");
    if(config!=null){
        fi=config.fadeIn==null?600:config.fadeIn;
        fo=config.fadeOut==null?600:config.fadeOut;
        st=config.showTime==null?1500:config.showTime;
    }
    c_c.css({"top":(($(window).height()-c_c.height())/3)+"px","position":"fixed","z-index":"9999","left":"50%"});
    c_c.css("margin-left","-"+(c_c.width()/2)+"px");
    c_c.fadeIn(fi);
    setTimeout(function(){c_c.fadeOut(fo);}, st);
}

/**
 * 弹窗 context(容器对象),closer(关闭对象),config(json格式配置参数:opacity(透明度),time(时间))
 * malert($("#bankValid"),$("#bankValid").find(".closeImg"),{opacity:0.2});
 */
function malert(context,closer,config){
    var opacity=0.2,time=300,z=99;
    if(config!=null){
        opacity=config.opacity==null?opacity:config.opacity;
        time=config.time==null?time:config.time;
        z=config["z-index"]==null?z:config["z-index"];
    }
    var maskStr="<div id='malert_mask' style='position:fixed;display:none;z-index:"+z+";top:0;left:0; width:100%; height:100%;background-color:black;filter:alpha(opacity="+(opacity*100)+");-moz-opacity:"+opacity+";opacity:"+opacity+";'></div>";
    if($("#malert_mask").length!=0){
        $("#malert_mask").remove();
    }

    $("body").append(maskStr);
    var mask=$("#malert_mask");
    var h = $(window).height()-context.height();
    if(h<0){h = 100;}
    context.css({"top":((h)/3)+"px","position":"fixed", "z-index":z+1,"left":"50%"});
    context.css("margin-left","-"+(context.width()/2)+"px");
    context.fadeIn(time);mask.fadeIn(time);
    //关闭
    var closeFunction = function (){
        context.fadeOut(time);
        mask.fadeOut(time).remove();
        if(config.onclose){config.onclose();}
    }
    mask.click(closeFunction);
    if(closer){
        closer.click(closeFunction);
    }
}
/**
 *
 * @param type
 * default
 * primary
 * info
 * warning
 * success
 * danger
 * @param content
 * @param callback
 */
function modals(type,content,callback){
    var typeClass = '';
    if(type!=''){
        typeClass = 'modal-'+type;
    }
    var modal = '<div id="myModal" class="modal '+typeClass+'"> ' +
        '<div class="modal-dialog"> <div class="modal-content"> ' +
        '<div class="modal-header">' +
        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">×</span></button> <h4 class="modal-title">删除</h4> </div> ' +
        '<div class="modal-body"> <p>'+content+'</p></div> ' +
        '<div class="modal-footer"> ' +
        '<button type="button" class="btn btn-default pull-left" data-dismiss="modal">取消</button> <button type="button" id="modalSubmit" class="btn btn-primary">确认</button> ' +
        '</div></div> </div> </div>';
    $("body").append(modal);
    $('#myModal').modal('show');
    var closeFunction =function() {
        $('#myModal').modal('hide');
        callback();
    }
    $("#modalSubmit").click(closeFunction);
}