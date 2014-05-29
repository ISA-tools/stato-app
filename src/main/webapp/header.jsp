<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Template &middot; Bootstrap</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">

    <style>
        a.result:link {color: green;}
        a.result:visited {color: green;}
        a.result:hover {color: orange;}
        a.result:focus {color: darkorange;}
        a.result:active {color: orangered;}

        .carousel {
            height: 600px;
            margin-bottom: 60px;
            vertical-align: middle;
        }
        /* Since positioning the image, we need to help out the caption */
        .carousel-caption {
            z-index: 10;
            margin-top: 0px;
            margin-bottom: 100px;
            height: 400px;
            overflow:scroll;
        }
        /* Declare heights because of positioning of img element */
        .carousel .item {
            width: 100%;
            height: 600px;
            background-color: silver;
        }
        .carousel-inner > .item > img {
            position: absolute;
            top: 0;
            left: 0;
            min-width: 100%;
            height: 500px;
        }
        @media (min-width: 768px) {
            .carousel-caption p {
                margin-top: 10px;
                font-size: 21px;
                line-height: 1.4;
            }
        }


        .flex {
            display: -webkit-box;   /* OLD: Safari,  iOS, Android browser, older WebKit browsers.  */
            display: -moz-box;      /* OLD: Firefox (buggy) */
            display: -ms-flexbox;   /* MID: IE 10 */
            display: -webkit-flex;  /* NEW, Chrome 21+ */
            display: flex;          /* NEW: Opera 12.1, Firefox 22+ */
            -webkit-box-align: center; -moz-box-align: center; /* OLD… */
            -ms-flex-align: center; /* You know the drill now… */
            -webkit-align-items: center;
            align-items: center;
        }


        img {
            background: #f1f2f1;
        }

        #carouselButtons {
            margin-left: 100px;
            position: absolute;
            /*bottom: 0px;*/
        }

        /* Spinner - starts */
        .spinner {
            display: inline-block;
            opacity: 0;
            max-width: 0;

            -webkit-transition: opacity 0.25s, max-width 0.45s;
            -moz-transition: opacity 0.25s, max-width 0.45s;
            -o-transition: opacity 0.25s, max-width 0.45s;
            transition: opacity 0.25s, max-width 0.45s; /* Duration fixed since we animate additional hidden width */
        }

        .has-spinner.active {
            cursor:progress;
        }

        .has-spinner.active .spinner {
            opacity: 1;
            max-width: 50px; /* More than it will ever come, notice that this affects on animation duration */
        }
        /* Spinner - ends */


        /** Carousel fade **/

        .carousel.carousel-fade .item {
            -webkit-transition: opacity 2s ease-in-out;
            -moz-transition: opacity 2s ease-in-out;
            -ms-transition: opacity 2s ease-in-out;
            -o-transition: opacity 2s ease-in-out;
            transition: opacity 2s ease-in-out;
        }
        .carousel.carousel-fade .active.left,
        .carousel.carousel-fade .active.right {
            left: 0;
            z-index: 2;
            opacity: 0;
            filter: alpha(opacity=0);
        }
        .carousel.carousel-fade .next,
        .carousel.carousel-fade .prev {
            left: 0;
            z-index: 1;
        }

        .carousel.carousel-fade .carousel-control {
            z-index: 3;
        }
        .unstyled li {
            display: inline;
            vertical-align: baseline;
            padding: 0 16px;
            position: relative;
        }


        /** Carouse fade ends **/


        .popover-title {
            color: green;
            font-size: 15px;
        }
        .popover-content {
            color: darkgreen;
            font-size: 10px;
        }


    </style>

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="../assets/ico/favicon.png">
</head>

<body>
