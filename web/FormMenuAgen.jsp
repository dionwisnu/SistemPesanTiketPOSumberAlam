<%-- 
    Document   : FormMenuAgen
    Created on : Nov 19, 2014, 11:52:09 AM
    Author     : Dion Wisnu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Agen</title>
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen"/>
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/layout.css">
        <script type="text/javascript"  src="js/jquery-1.8.2.min.js"></script>
        <script type="text/javascript"  src="js/jquery.flexslider.js"></script>
        <script type="text/javascript" >
            $(window).load(function() {
                $('.flexslider').flexslider({
                    animation: "slide"
                });
            });
        </script>
        <style>
        * {
            margin:0;
            padding:0;
        }
        #wrapper-top{
            background:#fff;
            height:100px;
        }
        #wrapper-header{
            background:#f9f9f9;
            border-top:1px solid #eee;
            border-bottom:1px solid #eee;

        }
        #slider-container {
            padding : 29px 0 0 0;
            width : 1000px;
            margin : 0px auto;
        }
        #wrapper-content{
            background:#fff;
            height:600px;
        }
        #wrapper-beforefooter{
            background:#f9f9f9;
            border-top:1px solid #eee;
            height:350px;
        }
        #wrapper-footer{
            background:#2b2b2b;
            height:50px;
        }
        #bodybaru {
            float: left;
            width: 100%;
            height: 100px;
            
        }

        #sidebar {
            float: left;
            width: 30%;
            height: 300px;
            background-color: green;
        }
        #footer {
            float: left;
            width: 100%;
            height: 100px;
            background-color: yellow;
        }
        #wrapper {
            width: 800px;
            margin: 0 auto;
        }
    </style>
    </head>
    <body background="sumberalam/background.jpg">
    <div>
        <h1><img src="sumberalam/header.jpg" width="1340" height="200" ></a></h1>
        <div id='cssmenu'>
            <ul>
                <li><a href="FormMenuAgen.jsp"><span>Home</span></a></li>
                <li class='has-sub'><a href='#'><span>Pembayaran</span></a>
                    <ul>
                        <li class='has-sub'><a href="DataPembayaran.jsp"><span>Data Pembayaran</span></a>
                        </li>
                        <li class='has-sub'><a href="BatalTiket.jsp"><span>Batal Tiket</span></a>
                        </li>
                    </ul>
                </li>
                <li><a href="TampilDataPembayaran.jsp"><span>Tampilkan Data Pembayaran</span></a></li>
            </ul>
        </div>
    </div>
    <div>
        <marquee> <font face="sylvian" : size="24px": color="white">SITUS PEMESANAN TIKET ONLINE PO SUMBER ALAM</font></marquee>
    </div>
        <div id="bodybaru">
            &nbsp
            <div id="slider-container">
                <div class="flexslider">
                    <ul class="slides">

                        <li>
                            <img src="sumberalam/gambar1.jpg" width="800" height="500"/><p></p>
                        </li>
                        <li>
                            <img src="sumberalam/gambar2.jpg "width="800" height="500" /><p></p>
                        </li>
                        <li>
                            <img src="sumberalam/gambar3.jpg"width="800" height="500" />
                        </li>
                        <li>
                            <img src="sumberalam/gambar4.jpg"width="800" height="500" />
                        </li>
                        <li>
                            <img src="sumberalam/gambar5.jpg"width="800" height="500" />
                        </li>
                        <li>
                            <img src="sumberalam/gambar6.jpg"width="800" height="500" />
                        </li>
                    </ul>
                </div>
            </div>
        </div>
</body>
</html>