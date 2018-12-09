<%--
    if(session.getAttribute("haslogined")==null||!(Boolean) session.getAttribute("haslogined")){
        response.sendRedirect("login.jsp");
        return;
    }
--%>
<%@page import="com.oraclewdp.ddbookmaket.model.Book" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>书籍列表</title>
    <!-- 1告诉浏览器不要缩放 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" id="zt"/>
    <link rel="stylesheet" type="text/css"
          href="bower_components/fontawesome/web-fonts-with-css/css/fontawesome-all.css">

    <script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
    <script type="text/javascript" src="bower_components/jquery.cookie/jquery.cookie.js">

    </script>
    <script type="text/javascript">
        if ($.cookie("bootstrapTheme")) {
            $("#zt").attr(
                "href",
                "bower_components/bootswatch/dist/"
                + $.cookie("bootstrapTheme") + "/bootstrap.css");
        } else {
            $("#zt").attr("href",
                "bower_components/bootswatch/dist/united/bootstrap.css");
        }
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="#"> <img src="img/12.jpg" style="height: 40px">
                </a>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="navbar-nav">
                        <li class="nav-item active"><a class="nav-link" href="#">Link <span
                                class="sr-only">(current)</span></a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink"
                                                         href="http://example.com" data-toggle="dropdown">Dropdown
                            link</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another
                                action</a> <a class="dropdown-item" href="#">Something else
                                here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </li>
                    </ul>
                    <form class="form-inline">
                        <input class="form-control mr-sm-2" type="text"/>
                        <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
                    </form>
                    <ul class="navbar-nav ml-md-auto">
                        <li class="nav-item active"><a class="nav-link" href="#">Link <span
                                class="sr-only">(current)</span></a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link  fa fa-child fa-2x" id="inputExit" href="exit.jsp"></a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card border-danger">
                <div class="card-header">
                    <form class="form-inline" action="bookList" method="post" id="frms">
                        <label class="sr-only" for="intputName">书名</label>
                        <input type="text" class="form-control mb-2 mr-sm-2" id="intputName" placeholder="书名"
                               name="name"
                               value="<%=request.getParameter("name")==null?"":request.getParameter("name")%>">
                        <label class="sr-only" for="inputBid">大类</label>
                        <div class="input-group mb-2 mr-sm-2">
                            <select class="form-control" id="inputBid" name="bid">
                                <option value="-1">--请选择--</option>
                            </select>
                        </div>
                        <label class="sr-only" for="inputSid">小类</label>
                        <div class="input-group mb-2 mr-sm-2">
                            <select class="form-control" id="inputSid" name="sid">
                                <option value="-1">--请选择--</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary mb-2">搜索</button>
                    </form>
                </div>
                <div class="card-body" style="padding: 0px;">
                    <div class="col-md-12" style="padding: 0px;">
                        <table class="table table-bordered table-hover" style="margin-bottom: 0px;">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>书名</th>
                                <th>价格</th>
                                <th>作者</th>
                                <th>出版社</th>
                                <th>出版日期</th>
                                <th>简介</th>
                                <th>小类号</th>
                                <th>封面图片</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<Book> ls = (List<Book>) request.getAttribute("ls");
                                for (Book book : ls) {
                            %>
                            <tr>
                                <td><%=book.getId()%>
                                </td>
                                <td><%=book.getName()%>
                                </td>
                                <td><%=book.getPrice()%>
                                </td>
                                <td><%=book.getAuthor()%>
                                </td>
                                <td><%=book.getCbs()%>
                                </td>
                                <td><%=book.getCbDate()%>
                                </td>
                                <td style="width: 200px"><%=book.getDescri()%>
                                </td>
                                <td><%=book.getSid()%>
                                </td>
                                <td><img src="upload/<%=book.getPhoto()%>"></td>
                                <td>
                                    <a href="#modal-container-394681" data-toggle="modal"
                                       onclick="window.delId='<%=book.getId()%>'" class="fa fa-trash fa-2x"
                                       title="删除"></a>
                                    &nbsp;&nbsp;&nbsp;
                                    <a class="fa fa-edit fa-2x" title="修改" href="toBookEdit?id=<%=book.getId()%>"></a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer" style="padding: 0px">
                    <nav>
                        <ul class="pagination">
                            <%
                                //获取总页数
                                int totalPage = (Integer) request.getAttribute("totalPage");
                                //获取当前页
                                int currentPage = (Integer) request.getAttribute("currentPage");
                                if (currentPage == 1) {
                            %>
                            <li class="page-item disabled"><a class="page-link" href="#">前一页</a></li>
                            <%
                            } else {
                            %>
                            <li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage - 1%>">前一页</a>
                            </li>
                            <%
                                }
                            %>
                            <!--
                                1)如果总页数totalPage<=5
                                    有几页就显示几页
                                2）否则
                                    2.1 如果currentPage<=3
                                     显示：
                                          1 2 3 4 ...totalPage
                                    2.2 否则 如果 currentPage<=totalPage-3
                                          1...currentPage-1 currentPage currentPage+1 ...totalPage
                                    2.3 否则
                                          1... totalPage-3 totalPage-2 totalPage-1 totalPage
                               -->
                            <%
                                if (totalPage <= 5) {
                                    for (int i = 1; i <= totalPage; i++) {
                            %>
                            <li class="page-item"><a class="page-link" href="bookList?currentPage=<%=i%>"><%=i%>
                            </a></li>
                            <%
                                }
                            } else if (currentPage <= 3) {
                            %>
                            <li class="page-item"><a class="page-link" href="bookList?currentPage=1">1</a></li>
                            <li class="page-item"><a class="page-link" href="bookList?currentPage=2">2</a></li>
                            <li class="page-item"><a class="page-link" href="bookList?currentPage=3">3</a></li>
                            <li class="page-item"><a class="page-link" href="bookList?currentPage=4">4</a></li>
                            <li class="page-item"><a class="page-link"
                                                     href="bookList?currentPage=<%=totalPage%>">...<%=totalPage%>
                            </a></li>
                            <%
                            } else if (currentPage <= totalPage - 3) {
                            %>
                            <li class="page-item"><a class="page-link" href="bookList?currentPage=1">1...</a></li>
                            <li class="page-item"><a class="page-link"
                                                     href="bookList?currentPage=<%=currentPage - 1%>"><%=currentPage - 1%>
                            </a></li>
                            <li class="page-item"><a class="page-link"
                                                     href="bookList?currentPage=<%=currentPage%>"><%=currentPage%>
                            </a></li>
                            <li class="page-item"><a class="page-link"
                                                     href="bookList?currentPage=<%=currentPage + 1%>"><%=currentPage + 1%>
                            </a></li>
                            <li class="page-item"><a class="page-link"
                                                     href="bookList?currentPage=<%=totalPage%>">...<%=totalPage%>
                            </a></li>
                            <%
                            } else {
                            %>
                            <li class="page-item"><a class="page-link" href="bookList?currentPage=1">1...</a></li>
                            <li class="page-item"><a class="page-link"
                                                     href="bookList?currentPage=<%=totalPage - 3%>"><%=totalPage - 3%>
                            </a></li>
                            <li class="page-item"><a class="page-link"
                                                     href="bookList?currentPage=<%=totalPage - 2%>"><%=totalPage - 2%>
                            </a></li>
                            <li class="page-item"><a class="page-link"
                                                     href="bookList?currentPage=<%=totalPage - 1%>"><%=totalPage - 1%>
                            </a></li>
                            <li class="page-item"><a class="page-link"
                                                     href="bookList?currentPage=<%=totalPage%>"><%=totalPage%>
                            </a></li>
                            <%
                                }
                            %>
                            <%
                                if (currentPage == totalPage) {
                            %>
                            <li class="page-item disabled"><a class="page-link" href="#">后一页</a></li>
                            <%
                            } else {
                            %>
                            <li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage + 1%>">后一页</a>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </nav>
                </div>

            </div>
            <div class="row">
                <div class="col-md-12">
                    <p class="text-center">
                        <img src="img/13.jpg" height="40px"> 小楼一夜听春雨版权所有&copy;<a class="btn"
                                                                                 href="mailto:965390711@qq.com">请点</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--删除确认提示  -->
<div class="modal fade" id="modal-container-394681" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">
                    删除确认
                </h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                是否删除
            </div>
            <div class="modal-footer">

                <button type="button" class="btn btn-primary" onclick="exeDel(event)">
                    确认
                </button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                    取消
                </button>
            </div>
        </div>
    </div>
</div>
<!-- end -->
<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script type="text/javascript">
    $(function () {
        $("#themeSel").change(
            function (evt) {
                $("#zt").attr(
                    "href",
                    "bower_components/bootswatch/dist/"
                    + $(evt.target).val()
                    + "/bootstrap.css")
                $.cookie("bootstrapTheme", $(evt.target)
                    .val(), {
                    expires: 7
                });
            });
        $('a[href="bookList?currentPage=<%=currentPage%>"]').parent("li")
            .addClass("active");
    });

    function fillSel(types) {
        for (var i = 0; i < types.length; i++) {
            var op = new Option(types[i].name, types[i].id);
            document.getElementById("inputBid").appendChild(op);
        }
        $("#inputBid").val('<%=request.getAttribute("bid") %>');
        //因为你产生该事件，让小类填充
        $("#inputBid").trigger("change");
    }

    function fillSmallSel(types) {
        document.getElementById("inputSid").innerHTML = '<option value="-1">--请选择--</option>';
        for (var i = 0; i < types.length; i++) {
            var op = new Option(types[i].name, types[i].id);
            document.getElementById("inputSid").appendChild(op);
        }
        $("#inputSid").val('<%=request.getAttribute("sid") %>');
    }

    $.ajax({
        url: "findAllBigType",
        dataType: "jsonp",
        jsonpCallback: "fillSel"
    });
    //给大类change
    $("#inputBid").change(function () {
        $.ajax({
            url: "findAllSmallType",
            dataType: "jsonp",
            data: "bid=" + $(this).val(),
            jsonpCallback: "fillSmallSel"
        });
    });
    //分页链接缺少的表单的值
    $('a[class="page-link"][href^="bookList?currentPage="]').click(function () {
        $(this).attr("href", $(this).attr("href") + "&" + $("#frms").serialize());
    });

    //删除确认
    function exeDel(event) {
        window.location.href = "bookDel?id=" + window.delId;
    }
</script>
</body>
</html>
