$.crud_functions = {
    
    refreshcrudList: function()
    {
        if ( ! $.fn.DataTable.isDataTable( '#crudDataTableList' ) ) 
        {
            $.crud_functions.crud_table = $('#crudDataTableList').DataTable({
                "processing": true,
                "serverSide": true,
                "bSort" : false,
                dom: 'Bfrtip',
                "ajax": {
                    "url": $.main_global_functions.base_url + "/api/read.php",
                    "type": "POST",
                    "data": {
                        // status:"1",
                    }
                },
                "columns": [
                    {"data": "profileid"},
                    {"data": "firstname"},
                    {"data": "lastname"},
                    {"data": "middlename"},
                    {"defaultContent": "", "render": $.crud_functions.refreshcrudListAgeRenderer},
                    {"data": "address"},
                    {"defaultContent": "", "render": $.crud_functions.refreshcrudListActionRenderer}
                ],
                "fnDrawCallback": function( oSettings ) {
                    $(".edit_menu").unbind("click");
                    $(".edit_menu").click(function()
                    {
                        let data = $.crud_functions.crud_table.row($(this).parents('tr')).data();
                        $("#menu_id").val(data["menu_id"]);
                        $("#menu_name").val(data["menu_name"]);
                        $("#menu_category_id").val(data["menu_category_id"]).change();
                        $("#type").val(data["type"]).change();
                        $("#tax").val(data["tax"]);
                        $("#price").val(data["price"]);
                        $("#menu_description").val(data["menu_description"]);
                        $.main_global_functions.swapSectionDisplay("#main_menu","#form_menu");            
                    });

                    $(".delete_menu").unbind("click");
                    $(".delete_menu").click(function()
                    {
                        
                        let data = $.crud_functions.crud_table.row($(this).parents('tr')).data();
                        menu_id = data["menu_id"];                       
                        status = (data["status"] == "1" ? "0":"1");                       
                        $.main_global_functions.global_confirmation_callback = function()
                        {
                           $.ajax({
                                url : $("#hidden_base_url").val()+"api/process/menu",
                                method : "POST",
                                data : 
                                {
                                    menu_id : menu_id,
                                    status : status,
                                }, 
                                success : function(response){
                                    $.main_global_functions.globalAlert("Successfully Deleted Entry.",'warning');
                                    $.crud_functions.refreshcrudList();
                                }
                            });


                        }
                        $.main_global_functions.openGlobalConfirmationWindow("Do you really want to delete this test", "Yes", "No");
                    });
                }
            });
        }
        else
        {
            $.crud_functions.crud_table.ajax.reload(null, false);
        }
    },
    
    refreshcrudListAgeRenderer: function(text, type, rowData, meta)
    {
        content = "";
        content += (rowData["gender"] == "F"?"Female":"Male");
        return content;
    },
    refreshcrudListActionRenderer: function(text, type, rowData, meta)
    {
        content = "";
        content += '<div class="btn-group display-inline" data-id="1"> ';
        content += '    <button class="btn btn-warning btn-xs edit_menu" title="Edit menu"> <span class="fa fa-edit"></span> </button> ';
        content += '    <button class="btn btn-danger btn-xs delete_menu" title="Delete menu"> <span class="fa fa-trash "></span> </button> ';
        content += '</div>';
        return content;
    },
    initCustomStyle: function () {

    },
    initPlugins: function () {
        $('[data-toggle="tooltip"]').tooltip();
    },  
    initEventHandlers: function () {
        $.crud_functions.initPlugins();
        
        $.crud_functions.cache_data = [];
        // $.crud_functions.readdata();
        $.crud_functions.refreshcrudList();

        $("form").submit(function (event) {
            event.preventDefault();
            let formdata = $(this).serializeArray();
      
            if (!formdata[0].value) {
              $.ajax({
                method: "POST",
                url: $.main_global_functions.base_url + "/api/create.php", //window.location.pathname = http://localhost/crudsample
                data: formdata,
                success: function (result, textStatus, jqXHR) {
                  console.log(textStatus + ": " + jqXHR.status);
                  $.main_global_functions.globalAlert("Records Created Successfuly.", "success");
                //   $(document).Toasts("create", {
                //   class: "bg-success",
                //     title: "Success",
                //     body: "Records Created Successfuly.",
                //     autohide: true,
                //     delay: 3000,
                //   });
                  readdata();
                  clearform();
                  $("#modelId").modal("hide");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                  console.log(textStatus + ": " + jqXHR.status + " " + errorThrown);
                  $.main_global_functions.globalAlert("Records Was Not Created.", "error");
                //   $(document).Toasts("create", {
                //   class: "bg-danger",
                //     title: "Error",
                //     body: "Records Was Not Created.",
                //     autohide: true,
                //     delay: 3000,
                //   });
                },
              });
            } else {
              $.ajax({
                method: "POST",
                url: $.main_global_functions.base_url + "/api/update.php",
                data: formdata,
                success: function (result, textStatus, jqXHR) {
                  console.log(textStatus + ": " + jqXHR.status);
                  $.main_global_functions.globalAlert("Records Updated Successfuly.", "success");
                  //   $(document).Toasts("create", {
                //   class: "bg-success",
                //     title: "Success",
                //     body: "Records Updated Successfuly.",
                //     autohide: true,
                //     delay: 3000,
                //   });
                  readdata();
                  clearform();
                  $("#modelId").modal("hide");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                  console.log(textStatus + ": " + jqXHR.status + " " + errorThrown);
                  $.main_global_functions.globalAlert("Records Was Not Updated.", "error");
                  //   $(document).Toasts("create", {
                //   class: "bg-danger",
                //     title: "Error",
                //     body: "Records Was Not Updated.",
                //     autohide: true,
                //     delay: 3000,
                //   });
                },
              });
            }
        });
    },
    readdata: function()
    {
        // $.ajax({
        //     method: "GET",
        //     url: $.main_global_functions.base_url + "/api/read.php",
        //     data: { searchtext: "" },
        //     success: function (result, textStatus, jqXHR) {
        //       console.log(textStatus + ": " + jqXHR.status);
        //       $("#items").empty();
        //       result.data.forEach((row) => {
        //         $("#deleteid").val(row.profileid);
        //         $("#items").append(`
        //           <tr>
        //             <td>${row.profileid}</td>
        //             <td>${row.firstname}</td>
        //             <td>${row.lastname}</td>
        //             <td>${row.middlename}</td>
        //             <td>${(row.gender == "F"?"Female":"Male")}</td>
        //             <td>${row.address}</td>
        //             <td>
        //               <button class="btn btn-primary" onclick="$.crud_function.editProfile(${row.profileid})">Edit</button>
        //               <button class="btn btn-danger"  data-toggle="modal" data-target="#deleteprompt">Delete</button>
        //               </td>
        //             </tr>
        //           `);
        //       });
        //       // <button class="btn btn-danger"  data-toggle="modal" data-target="#exampleModal" onclick="deleteProfile(${row.profileid})">Delete</button>
        //       $(document).Toasts("create", {
        //         class: "bg-success",
        //         title: "Success",
        //         body: "Records Loaded Successfuly.",
        //         autohide: true,
        //         delay: 3000,
        //       });
        //     },
        //     error: function (jqXHR, textStatus, errorThrown) {
        //       console.log(textStatus + ": " + jqXHR.status + " " + errorThrown);
        //     },
        // });
    },
    clearform: function() 
    {
        $("#profileid").val("");
        $("#firstname").val("");
        $("#lastname").val("");
        $("#middlename").val("");
        $("#gender").val("");
        $("#address").val("");
    },
    deleteProfile: function() {
        $("#deleteprompt").modal("hide");
        let profileid = $("#deleteid").val();
        $.ajax({
          method: "POST",
          url: $.main_global_functions.base_url + "/api/delete.php",
          data: { id: profileid },
          success: function (result, textStatus, jqXHR) {
            console.log(textStatus + ": " + jqXHR.status);
            $.main_global_functions.globalAlert("Records Was Not Updated.", "error");
            // $(document).Toasts("create", {
            // class: "bg-success",
            //   title: "Success",
            //   body: "Records Deleted Successfuly.",
            //   autohide: true,
            //   delay: 3000,
            // });
            readdata();
          },
          error: function (jqXHR, textStatus, errorThrown) {
            console.log(textStatus + ": " + jqXHR.status + " " + errorThrown);
          },
        });
      },
      editProfile: function(profileid) {
        console.log(profileid);
        $.ajax({
          method: "GET",
          url: $.main_global_functions.base_url + "/api/read.php",
          data: { id: profileid },
          success: function (result, textStatus, jqXHR) {
            console.log(textStatus + ": " + jqXHR.status);
            $("#modelId").modal("show");
            $("#profileid").val(result.data[0].profileid);
            $("#firstname").val(result.data[0].firstname);
            $("#lastname").val(result.data[0].lastname);
            $("#middlename").val(result.data[0].middlename);
            $("#gender").val(result.data[0].gender);
            $("#address").val(result.data[0].address);
          },
          error: function (jqXHR, textStatus, errorThrown) {
            console.log(textStatus + ": " + jqXHR.status + " " + errorThrown);
          },
        });
      }
};
$.crud_functions.initEventHandlers();
$(function () {
    $.crud_functions.initEventHandlers();
});
