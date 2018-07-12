<script type="text/javascript" src="http://localhost:8080/children/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/children/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/children/resources/js/admin.js"></script>
<script type="text/javascript" src="http://localhost:8080/children/resources/js/datepicker.js"></script>
<script type="text/javascript" src="http://localhost:8080/children/resources/js/Chart.js"></script>
<script type="text/javascript" src="http://localhost:8080/children/resources/js/myChart.js"></script>
<script type="text/javascript" src="http://localhost:8080/children/resources/js/ckeditor/ckeditor.js"></script>

<script >
    $(function () {
        $('#datetimepicker1').datepicker({
            format: "dd-mm-yyyy",
            language: "es",
            autoclose: true,
            todayHighlight: true
        });
        $("[data-toggle=tooltip]").tooltip();
        $('.searchbox-input').change(function () {
            $('.card').show();
            var filter = $(this).val(); // get the value of the input, which we filter on
            $('.container').find(".card-title:not(:contains(" + filter + "))").parent().css('display', 'none');
        });

        function bs_input_file() {
            $(".input-file").before(
                    function () {
                        if (!$(this).prev().hasClass('input-ghost')) {
                            var element = $("<input type='file' class='input-ghost' style='visibility:hidden; height:0'>");
                            element.attr("name", $(this).attr("name"));
                            element.change(function () {
                                element.next(element).find('input').val((element.val()).split('\\').pop());
                            });
                            $(this).find("button.btn-choose").click(function () {
                                element.click();
                            });
                            $(this).find("button.btn-reset").click(function () {
                                element.val(null);
                                $(this).parents(".input-file").find('input').val('');
                            });
                            $(this).find('input').css("cursor", "pointer");
                            $(this).find('input').mousedown(function () {
                                $(this).parents('.input-file').prev().click();
                                return false;
                            });
                            return element;
                        }
                    }
            );
        }
        $(function () {
            bs_input_file();
        });


    });
</script>
