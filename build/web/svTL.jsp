
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Thể Loại</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" type="text/css" href="index.css">
        <link rel="shortcut icon" type="image/png" href="Img/fav.png"/>
        <script>
            document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>')
        </script>
        <link rel="stylesheet" type="text/css" href="index.css">
    </head>
    <body>





        <nav class="navbar navbar-expand-sm navbar-light fixed-top container-fluid" style="padding-right: 16%;padding-left: 16%">
            <a class="navbar-brand" href="./">
                <img src="Img/logo_last.png" width="100" height="60" alt="Natra" class="d-inline-block align-top"/>
                <h6 style="padding-bottom: 0px">
                    NatraQuiCe Book
                </h6>
            </a>


            <!-- Right -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navbar links -->
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="Sach">Trang Chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#Contact">Liên hệ</a>
                    </li>

                    <c:if test="${not empty sessionScope.login}">
                        <li class="nav-item">
                            <a class="nav-link" href="sachAdmin">Chào ${sessionScope.login.username}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout">Đăng Xuất</a>
                        </li>

                    </c:if>
                    <li class="nav-item">
                        <c:if test="${empty sessionScope.login}">
                            <a class="nav-link" href="login">Đăng Nhập</a>
                        </c:if>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <form class="mr-auto form-inline" action="Sach">
                        <input class="form-control mr-sm-2" type="text" placeholder="Tìm Kiếm"  name="search" value="${param.search}" >
                        <button class="btn blue-gradient btn-rounded" type="submit" value="search" name="submit">Tìm</button>
                    </form>
                </ul>
            </div>
        </nav>

        <div class="container-fluid" style="padding: 10% 10%">
            <div id="carouselFadeExampleIndicators" class="carousel slide carousel-fade" data-ride="carousel">
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item active">
                        <img style="width: 100%;height: 250px" class="d-block w-100" src="Img/demobanner.jpg" data-src="holder.js/900x400?theme=social" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img style="width: 100%;height: 250px" class="d-block w-100" src="Img/demobanner1.jpg" data-src="holder.js/900x400?theme=industrial" alt="Second slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselFadeExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselFadeExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>




        <hr>

        <div class="container-fluid" style="padding: 3% 10%">
            <div class="row">

                <div class="col-lg-2" style="background-color: white">
                    <h1>
                        Danh Sách Sản Phẩm
                    </h1>
                    <hr>
                    <button type="button" class="btn btn-primary btn-sm w-100 bg-light border-0 text-dark p-1">
                        <a href="Sach">
                            Tất Cả
                        </a>

                    </button>
                    <div class="dropdown w-100 bg-light" >
                        <button class="btn btn-secondary dropdown-toggle btn-sm w-100 bg-light" style="border-color: white; color: black"
                                type="button" id="dropdownMenu1" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                            Thể Loại
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                            <c:forEach var="tl" items="${TheLoai}">
                                <a class="dropdown-item" href="sotl?tenLoaiSach=${tl.tenLoaiSach}">
                                    ${tl.tenLoaiSach}
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary btn-sm w-100 bg-light" style="border-color: white">
                        <a href="AllTacGiaController" style="color: black">
                            Tác Giả
                        </a>

                    </button>

                </div>
                <div class="col-lg-10 pl-5" >
                    <div class="row">


                        <c:forEach var="t" items="${svTL}">
                            <div class="col-lg-4 mb-4">
                                <div style="padding: 50px; border: 1px solid black; height: 650px">
                                    <span>
                                        <p>
                                            <a href="detail?tenSach=${t.tenSach}">
                                                <img style="border: 2px solid black" src="${t.anhSach}" width="100%" height="300"/>
                                            </a>
                                        </p>
                                        <p>
                                            <a href="detail?tenSach=${t.tenSach}" style="border: 1px;text-decoration: none;color: red">
                                                <h4 style="color: red; text-align: center">
                                                    ${t.tenSach}
                                                </h4>
                                            </a>
                                        </p>
                                        <p style="text-align: center">
                                            <b>
                                                ${t.tenTacGia}
                                            </b>
                                        </p>
                                        <p style="text-align: center;vertical-align: bottom">

                                            ${t.giaBia}
                                        </p>
                                        <div class="align-bot">


                                            <p style="text-align: center;vertical-align: bottom">

                                                <a  href="muasach?tenSach=${t.tenSach}"><input class="btn btn-primary" type="submit" value="Mua ngay" name="buy"></a>
                                            </p>
                                        </div>
                                    </span>

                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>


        <div id="Contact" class="container-fluid" style="padding: 6% 10%;padding-bottom: 0px">


            <footer class="page-footer font-small blue pt-4">
                <div class="container-fluid text-center text-md-left">
                    <div class="row">
                        <div class="col-md-6 mt-md-0 mt-3">
                            <h5 class="text-uppercase">NaTraQuiCe BookStore</h5>
                            <p> DID YOU KNOW:</P>
                            <P>
                                NaTraQuiCe stand for Navi- Astralis- Liquid- ENCE
                            </p>
                        </div>
                        <hr class="clearfix w-100 d-md-none pb-3">

                        <!-- Grid column -->
                        <div class="col-md-3 mb-md-0 mb-3">

                            <!-- Links -->
                            <h5 class="text-uppercase">Special Thank To</h5>

                            <ul class="list-unstyled">
                                <li>
                                    <a href="https://www.facebook.com/Tildnight415"> Đạt Phùng</a>
                                </li>
                                <li>
                                    <a href="https://www.facebook.com/nguyenduong.phong.92">Phong Nguyễn</a>
                                </li>
                                <li>
                                    <a href="https://www.facebook.com/trung321">Quang Trung</a>
                                </li>
                                <li>
                                    <a href="https://www.facebook.com/duong.nguyenthai.35728">Dương Nguyễn</a>
                                </li>
                                <li>
                                    <a href="https://www.facebook.com/thai.trinhnam">Thái Trịnh</a>
                                </li>

                            </ul>

                        </div>



                        <div class="col-md-3 mb-md-0 mb-3">

                            <!-- Links -->
                            <h5 class="text-uppercase">NaTraQuiCe Team</h5>

                            <ul class="list-unstyled">
                                <li>
                                    <a href="#!">Til_Dn1ght</a>
                                </li>
                                <li>
                                    <a href="#!">Pyzz1sk_Boy</a>
                                </li>
                                <li>
                                    <a href="#!">Ladykillah</a>
                                </li>
                                <li>
                                    <a href="#!">lagger_CongtuVanDon_9xCute</a>
                                </li>
                                <li>
                                    <a href="#!">Thasi_MVP</a>
                                </li>
                            </ul>

                        </div>

                    </div>


                </div>
                <div class="footer-copyright text-center py-3">© 2019 Copyright:
                    <a href="https://www.facebook.com/thai.trinhnam"> NaTraQuiCe Book Store</a>
                </div>
            </footer>
        </div>

    </body>
</html>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


