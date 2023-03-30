$.main_global_functions = {
    openGlobalConfirmationWindow: function(_message, _save_label, _cancel_label)
    {
        if(_message == null)
            _message = "Do you really want to delete this entry?";
        if(_save_label == null)
            _save_label = "Proceed";
        if(_cancel_label == null)
            _cancel_label = "Cancel";
        if($('#global_confirmation_window').length <= 0)
        {
            var _win = '';
            _win += '<div class="modal fade" id="global_confirmation_window" tabindex="-1" role="dialog" aria-labelledby="formModalLabel" aria-hidden="true">';
            _win += '    <div class="modal-dialog">';
            _win += '        <div class="modal-content">';
            _win += '            <div class="modal-header">';
            _win += '                <h4 class="modal-title" id="formModalLabel">Confirm Action</h4>';
            _win += '            </div>';
            _win += '            <div class="modal-body">';
            _win += '                <h4 id="global_confirmation_header_text"></h4>';
            _win += '            </div>';
            _win += '            <div class="modal-footer">';
            _win += '                <button type="button" class="btn btn-primary global_confirmation_save_btn" id="global_confirmation_save_btn">' + _save_label + '</button>';
            _win += '                <button type="button" class="btn btn-default global_confirmation_cancel_btn" id="global_confirmation_cancel_btn">' + _cancel_label + '</button>';
            _win += '            </div>';
            _win += '        </div>';
            _win += '    </div>';
            _win += '</div>';
            $('body').append(_win);

            $('.global_confirmation_cancel_btn').unbind('click');
            $('.global_confirmation_cancel_btn').click(function()
            {
                $('#global_confirmation_window').modal('hide');
            });

            $('.global_confirmation_save_btn').unbind('click');
            $('.global_confirmation_save_btn').click(function()
            {
                if($.main_global_functions.global_confirmation_callback != null)
                {
                    $.main_global_functions.global_confirmation_callback();
                    $.main_global_functions.global_confirmation_callback = null;
                }
                $('#global_confirmation_window').modal('hide');
            });
        }
        $('#global_confirmation_header_text').html(_message);
        $('#global_confirmation_save_btn').html(_save_label);
        $('#global_confirmation_cancel_btn').html(_cancel_label);
        $('#global_confirmation_window').modal($.main_global_functions.modal_show_options);
    },
    initCustomStyle: function () {

    },
    initPlugins: function () {
        $('[data-toggle="tooltip"]').tooltip();
    },  
    showGlobalLoadingWindow: function() {
      $(".preloader").removeAttr('style');
      $(".preloader img").show();
    },
    hideGlobalLoadingWindow: function() {
        $('.preloader').attr('style', 'height:0px;');
        $(".preloader img").hide();
    },
    initEventHandlers: function () {
        $.main_global_functions.initPlugins();
        $('.sidebar .nav-link').click(function(e){
            e.preventDefault();
            let content = $(this).attr("data-content");
            let source = $(this).attr("data-source");
            // let js = $(this).attr("data-js");
            
            // $("#customjs").html("");
            // if(js.length>0)
            // {
            //     var script = document.createElement('script');
            //     script.src =js;
            //     // console.log(js)
            //     $("#customjs").append(script);

            // }
            if(content.length > 0)
            {
              let text = $(this).text().trim().toUpperCase();
              $("#pageTitle").html(text);
              if(source == "contributor")
              {
                let return_data = '<iframe src='+content+' height="1080" width="100%" title="Iframe Example"></iframe>';
                $('.content').html(return_data);
              }
              else
              {
                $('.content').load(content);
              }
            }
          });
          // $('#dashboard').click(function(e){
          //   e.preventDefault();
          //   $('.content-wrapper').load('./pages/dashboard.html');
          // });
          // $('#crudform').click(function(e){
          //   e.preventDefault();
          //   $('.content-wrapper').load('./pages/crud.html');
          // });
          // $('#surveyform').click(function(e){
          //   e.preventDefault();
          //   $('.content-wrapper').load('./pages/survey.html');
          // });

          $('#dashboard').click();
    },
    globalAlert: function(_msg, _type, _msg_title, _position)
    {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": true,
            // "positionClass": "toast-bottom-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "2000",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        if(_position == null)
            toastr.options.positionClass = "toast-bottom-right";
        else
            toastr.options.positionClass = _position;
        if(_type == "success")
        {
            _msg_title = (_msg_title == null ? 'Success': _msg_title);
            toastr.success( _msg, '<b>'+_msg_title+'!</b>&nbsp;&nbsp;');
        }
        else if(_type == "warning")
        {
            _msg_title = (_msg_title == null ? 'Oops!': _msg_title);
            toastr.warning( _msg, '<b>'+_msg_title+'!</b>&nbsp;&nbsp;');
        }
        else if(_type == "error")
        {
            _msg_title = (_msg_title == null ? 'Oh Snap': _msg_title);
            toastr.error( _msg, '<b>'+_msg_title+'!</b>&nbsp;&nbsp;');
        }
        else
        {
            _msg_title = (_msg_title == null ? 'Oops': _msg_title);
            toastr.info( _msg, '<b>'+_msg_title+'!</b>&nbsp;&nbsp;');
        }
        toastr.options.onclick = function() {
            toastr.clear()
        }
        ;
    },
    spliceFromArray: function(array, item, index)
    {
        if(index == "")
            index = array.indexOf(item);
        
        if (index > -1) {
            array.splice(index, 1);
        }
        return array;
    },
    add_array: function(main_array,new_item)
    {
        var new_array = [];
        new_array[main_array.length] = new_item;
        main_array.forEach(function(array,index){
            new_array[index] = array;
        });
        return new_array;
    },
    ArrayToObject: function(arr){
        console.log(arr);
        var obj = {};
        for (var i = 0;i < arr.length;i++){
            obj[arr[i]] = arr[i];
        }
        return obj
    },
};


$(function () {    
    $.main_global_functions.initEventHandlers();
    $.main_global_functions.base_url = window.location.origin + '/'+ window.location.pathname.split( '/' )[1];
    $.main_global_functions.modal_show_options = {
        // backdrop: "static",
        // keyboard: false,
        show: true
    };
    
    $.main_global_functions.datatable_columndefs = [{
        responsivePriority: 1,
        targets: 0
    },

    {
        responsivePriority: 2,
        targets: -1
    }
    ];
    $.main_global_functions.datatable_language = {
        paginate: {
            previous: '<i class="fa fa-chevron-left"></i>',
            next: '<i class="fa fa-chevron-right"></i>',
        },
        aria: {
            paginate: {
                previous: 'Previous',
                next:     'Next'
            }
        }
    };
});