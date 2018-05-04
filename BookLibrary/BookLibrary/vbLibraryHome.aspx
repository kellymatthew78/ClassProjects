﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="vbLibraryHome.aspx.vb" Inherits="BookLibrary.vbLibraryHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>My Book Library</title>

     <!-- CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/myStyle.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
           <div class="container-fluid">
        <div class="header clearfix">
            <h3 class="text-muted">My Library</h3>
        </div>
        <div class="jumbotron">
            <h1>Welcome All To The Library</h1>
            <p class="lead">This is a small community library that is used by members to share books that they have. It can be used to checkout as well as donate various books to this library. </p>

            <p>
                <a id="creatLibrary" class="btn btn-lg btn-success" href="#" role="button">Refresh Library</a>
                <a id="loadLibrary" class="btn btn-lg btn-success" href="#" role="button">Load Library Listing</a>

            </p>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                        <a class="navbar-brand" href="javascript: void (0)">Administration</a>
                        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                            <li class="nav-item active">
                                <a class="nav-link" id="Home" href="javascript: void (0)">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="modal" data-target="#addBook" href="javascript: void (0)">Add Books</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="modal" data-target="#removeAuthors" href="javascript: void (0)">Remove Authors</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="getAuthors" href="javascript: void (0)">Get Authors</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="getRandom" href="javascript: void (0)">Random Book</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" href="javascript: void (0)">Disabled</a>
                            </li>
                        </ul>
                        <form class="form">
                            <div class="form-row">
                                <div class="form-group">
                                    <div class="input-group md-form form-sm form-1 pl-0">
                                        <div id="searchLib" class="input-group-prepend">
                                            <a href="javascript: void (0)"><span class="input-group-text purple lighten-3" id="basic-text1"><i class="fa fa-search text-white" aria-hidden="true"></i></span></a>

                                        </div>
                                        <input id="txtSearch" class="form-control my-0 py-1" type="text" placeholder="Search" aria-label="Search">
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <div class="form-check">
                                        <div class="ra checkbox-inline checkbox-primary">
                                            <!--<input type="checkbox" id="cbAll" value="All" checked="">
                                            <label for="cbAll"> Any </label>-->
                                            <input type="checkbox" id="cbTitle" value="Title">
                                            <label for="cbTitle">Title</label>
                                            <input type="checkbox" id="cbAuthor" value="Author">
                                            <label for="cbAuthor">Author</label>
                                            <input type="checkbox" id="cbTitleAuthor" value="TitleAuthor">
                                            <label for="cbTitleAuthor">Title / Author</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </nav>
            </div>
        </div>
        <div id="errormsg" class="col"><div class="row"><p class="text-warning msg"></p></div></div>
        <br />

        <div class="row booklist">
            <div class="col-lg-7">
                <h4 id="searchHeader">Library Listing</h4>
                <p id="libHeading">This is a listing of the current books in your selected library...</p>

                <h5 id="msg"></h5>
                <input id="hdDirection" type="hidden" value="false" />
                <table id="tblBKList" class="table table-striped table-bordered nowrap" data-show-columns="true" style="width:100%">
                    <thead>
                        <tr>
                            <th>Call#</th>
                            <th>Title<i id="sortATitle" class="fas fa-angle-double-up ml-2"></i><i id="sortDTitle" class="fas fa-angle-double-down ml-2"></i></th>
                            <th>Author <i id="sortAAuthor" class="fas fa-angle-double-up ml-2"></i><i id="sortDAuthor" class="fas fa-angle-double-down ml-2"></i></th>
                            <th>Page #<i id="sortAPage" class="fas fa-angle-double-up ml-2"></i><i id="sortDPage" class="fas fa-angle-double-down ml-2"></i></th>
                            <th>Publish Date <i id="sortAPub" class="fas fa-angle-double-up ml-2"></i><i id="sortDPub" class="fas fa-angle-double-down ml-2"></i></th>
                            <th>Catagory</th>
                        </tr>
                    </thead>
                </table>
                <table id="tblAUList" class="table table-striped table-bordered nowrap" data-show-columns="true" style="width:100%">
                    <thead>
                        <tr>
                            <th>Author</th>
                        </tr>
                    </thead>
                </table>
                <div class="btn-group">
                    <button type="button" class="btn btn-outline-success d-none">Close Authors</button>
                </div>


            </div>
            <div class="col-lg-4">
                <!-- Rotating card -->
                <section class="card-wrapper ">
                    <div id="cdBookInfo" class="card border-0" onclick="flip()">
                        <div class="front">
                            <img id="cbBookImg" class="card-img-top img-responsive" src="file:///C:/Public/Images/BookLibrary/524_IT.jpg" alt="Book Image">
                            <div class="card-body">
                                <h4 id="cardtitle" class="">Card title</h4>
                                <small id="cardAuthor" class="">Written By: The Dude</small>
                                <hr>
                                <p id="cardPlot" class="card-text">Welcome to Derry, Maine. It’s a small city, a place as hauntingly familiar as your own hometown. Only in Derry the haunting is real.</p>
                                <a class="link-text">
                                    <h5>Summary<i class="fa fa-angle-double-right"></i></h5>
                                    <h5 id="cdBookInfo_close">Close<i class="fa fa-angle-double-right"></i></h5>
                                </a>
                            </div>
                        </div>
                        <div class="back">
                            <h4 class="card-title font-weight-bold my-4">Book Summery <i class="fas fa-book" data-card="cdBookInfo"></i></h4>

                            <small></small>
                            <hr>
                            <div id="plot">
                                <p>Welcome to Derry, Maine. It’s a small city, a place as hauntingly familiar as your own hometown. Only in Derry the haunting is real.</p>
                                <p>They were seven teenagers when they first stumbled upon the horror. Now they are grown-up men and women who have gone out into the big world to gain success and happiness. But the promise they made twenty-eight years ago calls them reunite in the same place where, as teenagers, they battled an evil creature that preyed on the city’s children. Now, children are being murdered again and their repressed memories of that terrifying summer return as they prepare to once again battle the monster lurking in Derry’s sewers.</p>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <!-- The Edit Card -->
        <div id="editCard" class="card border-info mb-3" style="max-width: 40rem;">
            <form>
                <div class="form-group row">
                    <label for="txtedTitle" class="col-sm-2 col-form-label">Title</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="txtedTitle" placeholder="Book Title">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="txtedAuthor" class="col-sm-2 col-form-label">Author</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="txtedAuthor" placeholder="Book Author">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="txtedPageNum" class="col-sm-2 col-form-label"># of Pages</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="txtedPageNum" placeholder="Page #">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="txtedPubDate" class="col-sm-2 col-form-label">Publish Date</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control" id="txtedPubDate" placeholder="Publish Date">
                    </div>
                </div>
                <label class="mr-sm-2" for="inlineFormCustomSelect">Category</label>
                <select class="custom-select mr-sm-2" id="dledCategory">
                    <option selected>Choose...</option>
                    <option value="Drama">Drama</option>
                    <option value="Comedy">Comedy</option>
                    <option value="Horror">Horror</option>
                    <option value="Western">Western</option>
                </select>
                <input id="hfCallNum" type="hidden" />
                <input id="hfBKcover" type="hidden" />
                <button id="editBook" type="submit" class="btn btn-primary">Submit</button>
                <button id="editBookCancel" type="button" class="btn btn-primary">Cancel</button>
            </form>
        </div>
        <!-- The End Edit Card -->
        <!-- The Remove Authors Modal -->
        <div class="modal fade" id="removeAuthors">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Remove All Authors From Library</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <input id="txtremoveallauthors" type="text" placeholder="Enter Full Name">
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button id="btnRemoveAllAuthor" type="submit" class="btn btn-secondary">Remove</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Remove Authors Modal -->
        <!-- The Add Book Modal -->
        <div class="modal fade" id="addBook">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Add Books to the Library</h4><br />

                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form>
                            <div class="form-group row">
                                <div class="col">
                                    <h5 id="addbookmsg"></h5>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="txtTitle" class="col-sm-2 col-form-label">Title</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="txtTitle" placeholder="Book Title">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="txtAuthor" class="col-sm-2 col-form-label">Author</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="txtAuthor" placeholder="Book Author">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="txtPageNum" class="col-sm-2 col-form-label"># of Pages</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="txtPageNum" placeholder="Page #">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="txtPubDate" class="col-sm-2 col-form-label">Publish Date</label>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control" id="txtPubDate" placeholder="Publish Date">
                                </div>
                            </div>
                            <label class="mr-sm-2" for="inlineFormCustomSelect">Category</label>
                            <select class="custom-select mr-sm-2" id="dlCategory">
                                <option selected>Choose...</option>
                                <option value="Drama">Drama</option>
                                <option value="Comedy">Comedy</option>
                                <option value="Horror">Horror</option>
                                <option value="Western">Western</option>
                            </select>
                            <div class="form-group">
                                <label for="imgFile1">Upload File</label>
                                <input type="file" class="form-control-file" id="imgFile1">
                            </div>
                        </form>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button id="btnAddBook" type="button" class="btn btn-outline-primary">Add Book</button>
                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Add Book Modal -->
        <!-- The Random Book Modal -->
        <div class="modal fade justify-content-center" id="randomBook">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">We Have Selected This Book</h4><br />

                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">

                        <!-- Card Dark -->
                        <div class="card border-warning mb-3" style="max-width: 25rem;">

                            <!-- Card image -->
                            <div class="view overlay">
                                <img id="rdBookImg" class="card-img-top img-fluid si " src="img/bookImg/jBook.jpg" alt="Card image cap">
                                <a>
                                    <div class="mask rgba-white-slight"></div>
                                </a>
                            </div>

                            <!-- Card content -->
                            <div class="card-body elegant-color white-text rounded-bottom">

                                <!-- Social shares button -->
                                <a class="activator waves-effect mr-4"><i class="fa fa-share-alt white-text"></i></a>
                                <!-- Title -->
                                <h4 id="cardtitle2" class="card-title">Book Title</h4>
                                <h5 id="cardAuthor2">Written By: </h5>
                                <hr class="hr-light">
                                <!-- Text -->
                                <p id="summary2" class="card-text white-text mb-4">Welcome to Derry, Maine. It’s a small city, a place as hauntingly familiar as your own hometown. Only in Derry the haunting is real.</p>
                                <!-- Link -->
                                <a href="#!" class="white-text d-flex justify-content-end"><h5>Read more <i class="fa fa-angle-double-right"></i></h5></a>

                            </div>

                        </div>
                        <!-- Card Dark -->
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Random Book Modal -->

        <footer class="footer">
            <p>© 2018 Matthew Kelly</p>
        </footer>
    </div>
    <!-- jQuery and necessary Bootstrap's files plus any CDN) -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/myScript.js"></script>
    <script src="js/fontawesome-all.js"></script>

    </form>
</body>
</html>
