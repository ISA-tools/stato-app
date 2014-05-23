<hr>

<div class="footer">
    <p>&copy; ISA-tools 2014</p>
</div>

</div> <!-- /container -->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->


<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="assets/js/bootstrap.min.js"></script>
<!--<script src="assets/js/bootstrap-carousel.js"></script>-->

<!--
<script src="../assets/js/html5shiv.js"></script>
<script src="assets/js/bootstrap-transition.js"></script>
<script src="assets/js/bootstrap-alert.js"></script>
<script src="assets/js/bootstrap-modal.js"></script>
<script src="assets/js/bootstrap-dropdown.js"></script>
<script src="assets/js/bootstrap-scrollspy.js"></script>
<script src="assets/js/bootstrap-tab.js"></script>
<script src="assets/js/bootstrap-tooltip.js"></script>
<script src="assets/js/bootstrap-popover.js"></script>
<script src="assets/js/bootstrap-button.js"></script>
<script src="assets/js/bootstrap-collapse.js"></script>
<script src="assets/js/bootstrap-carousel.js"></script>
<script src="assets/js/bootstrap-typeahead.js"></script>


-->

<script>
    function askSTATO(){
        var item = $('#myCarousel .carousel-inner .item.active');
        $('#hiddenButton').val(item.index());
        $('#myCarousel').carousel('pause');
        $('#pauseButton').attr('active',true);
        var $askButton = $('#askButton');
        $askButton.attr('disabled', true);
        $askButton.attr('active', true);
        queryForm.submit();
        //$('.progress-bar').progressbar();
        //e.preventDefault();//this will prevent the link trying to navigate to another page
        //var href = $(this).attr("href");//get the href so we can navigate later
        //do the update
        //when update has finished, navigate to the other page
        //window.location = href;
    };

    $(function () {
        $('#myCarousel').carousel({
            interval:6000,
            pause: "false"
        });
        $('#playButton').click(function () {
            $('#myCarousel').carousel('cycle');
        });
        $('#pauseButton').click(function () {
            $('#myCarousel').carousel('pause');
        });
    });

</script>



</body>
</html>