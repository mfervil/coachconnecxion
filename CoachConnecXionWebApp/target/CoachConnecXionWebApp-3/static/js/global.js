$(document).ready(function () {
    initForms();
    initCreateUserValidation();

});

function initForms() {
    $("form").each(function () {
        var form = $(this);
        var valid = true;
        form.find(".submitForm").click(submitForm);

        if (!form.hasClass("noValidate")) {
            valid = form.validate();
        }

        function submitForm() {
            if (valid) {
                form.submit();
            }
        }
    });
}

function initCreateUserValidation() {
    jQuery.validator.addMethod('isEqualsPassword', function (value, element) {
        return  $('#password').val() == $("#confirmedPassword").val();
    }, "Password does not match.");
    $("form#userCreate").validate({
        rules:{
            username:{
                required:true,
                minlength:3,
                remote:{
                    data:{
                        username:function () {
                            return $("#username").val();
                        },
                        rnd:function () {
                            return Math.random();
                        }
                    },
                    url:"checkUserName",
                    type:"get"
                }
            },
            email:{
                required:true,
                email:true
            },
            password:{
                required:true,
                minlength:3
            },
            confirmedPassword:{
                required:true,
                isEqualsPassword:true
            }
        },
        messages:{
            username:{
                remote:function () {
                    return "Username  already in use";
                }}
        }
    })
}
