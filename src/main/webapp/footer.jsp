<hr>

<div class="footer">
    <p>&copy; ISA-tools 2014</p>
</div>

<!--</div> <!-- /container -->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->


<!--<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>-->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>



<script>

    function showPopup(id) {
        $(id).popover('show');
    }

    function hidePopup(id) {
        $(id).popover('hide');
    }

    $(".popper-upper").each(function(){
        $(this).popover();
    });

    $(function() {

        $('#myCarousel').carousel({
            interval: 3000,
            pause: "hover"
        });

        $('#playButton').click(function () {
            $('#myCarousel').carousel('cycle');
        });

        $('#pauseButton').click(function () {
            $('#myCarousel').carousel('pause');
        });
    });


    function askSTATO(j){
        var item = $('#myCarousel .carousel-inner .item.active');
        //$('#hiddenButton').val(item.index());
        $('#hiddenButton').val(item.attr('id'));
        $('#myCarousel').carousel('pause');
        $('#pauseButton').attr('active',true);
        var $askButton = $('#askButton_'+j);
        $askButton.attr('disabled', true);
        $("#askButton_"+j).toggleClass("active");
        queryForm.submit();
    };


    $('.btn-group[data-toggle=buttons]').each(function (i, e) {
        var default_class = $(e).data('toggle-default-class') || 'btn-default';

        $(e).find('label')
                .click(function (event) {
                    $(e).find('label')
                            .each(function (i, e) {
                                if (!(e == event.target)) {
                                    $(e).removeClass($(e).data('toggle-class'))
                                            .addClass(default_class);
                                    $(e).find('input')
                                            .removeAttr('checked');
                                } else {
                                    $(e).removeClass(default_class)
                                            .addClass($(e).data('toggle-class'));
                                    $(e).find('input')
                                            .attr('checked', 1);
                                }
                            });
                });
    });

    function selectQueryView(queryType){
      var views = document.getElementsByName('view');

      var viewValue;

      for (var i = 0, length = views.length; i < length; i++) {
          if (views[i].checked) {
              viewValue = views[i].value
              break;
          }
      }

      if (viewValue="grid")
          selectQueryViewForm.action = "gridQueryForm.jsp?queryType="+queryType;
      else if (viewValue="carousel")
          selectQueryViewForm.action = "queryForm.jsp?queryType="+queryType;
        selectQueryViewForm.submit();
    }

</script>



</body>
</html>