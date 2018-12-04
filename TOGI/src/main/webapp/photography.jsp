<%-- 
    Document   : photography
    Created on : Dec 3, 2018, 7:15:57 PM
    Author     : jortiz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TŌGI - Image Boards</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> 
        <link rel="stylesheet" href="Styles/post.css">
        <link rel="stylesheet" href="Styles/board.css">
    </head>
    <body>
        <!--this is the banner on the top of the page-->
        <div class="header" id="myHeader">
            <h2 class="boardName">Photography</h2>
            <a href="index.html">
                <div class = "logo"></div>
            </a>
            <button type="button" class="newPost" id="buttonPost">Create Post</button>
            <form action="submit" style="display:none" method="post" id="postBox">
                Image URL: <input type="text" name="image">
                <fieldset>
                    <legend>Title</legend>
                    <textarea rows="5" cols="50" name="title"
                              placeholder="Enter your title here..."></textarea>
                </fieldset>
                <input type="submit" value="Create Post">
            </form>
        </div>

        <!--this is the different threads--> 
            <table id="tdata"><tbody>
                    <tr><td><a href="index.html">
                <div class="content">
                    <div class="imgdiv"></div>
                    <div class="title">
                        sample comment sample comment sample comment sample comment sample comment sample comment sample comment sample comment sample comment sample comment sample comment sample commentsample comment sample comment sample comment sample comment sample comment sample comment sample comment 
                    </div>
                </div>
                            </a></td></tr>
                </tbody></table>

        <script>
            window.onscroll = function () {
                myFunction();
            };
            document.getElementById("buttonPost").onclick = function () {
                hideCommentBox();
            };
            function hideCommentBox() {
                var x = document.getElementById("postBox");
                if (x.style.display === "none") {
                    x.style.display = "block";
                } else {
                    x.style.display = "none";
                }
            }

            var header = document.getElementById("myHeader");
            var sticky = header.offsetTop;

            function myFunction() {
                if (window.pageYOffset > sticky) {
                    header.classList.add("sticky");
                } else {
                    header.classList.remove("sticky");
                }
            }
        </script>

        <!--this is the script to actually show the threads on the site :)-->
        <script>
            $.ajax({
                url: 'boardservlet',
                type: 'post',
                dataType: 'text',
                success: function (resp) {

                    const boards = $.trim(resp).split("-");
                    const table = $("#tdata tbody");
                    let img = "\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAeFBMVEX///8dHRsAAAAZGRcuLi3Ly8sbGxnOzs4VFROpqakQEA1paWi1tbXBwcHx8fHp6elgYGA5OTcHBwCdnZzm5uba2trU1NS6urlWVlWjo6KKioomJiTz8/Pc3NxjY2JMTEt/f3+UlJRERENwcG9QUE97e3oxMS+Ojo28MmnZAAADIElEQVR4nO3ZaXuiMBSGYQyIELcWWrU4Vu0y8///4SAlgEoW7SLMPPe3enF6eCXNQj0PAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/7nNMk7TePrwM92Wg0BDznQ1sbYm8O0Nn0XlfWG+9nWtbVRYB7+s/abC1xH6hIYiS784EXKghFJsjQ/yOdE2OpCJ9hYrQzHQMiXUFxnbze5FeHx9JFLD9WPZ3qWs/WTAb0i4EVFLxfuVCX0xtwZcmAJ+fcK58FtL9lcl9IV9plqcDplvThi0PMGiRjvfGBKGDgEfzQG/POFTXSXzeTSpHqgfXJ4wFBtrwIVoUIVJ80N7QnFO31CGVZNxOpn8WVddxVRTctd2j1Hx06M1oDesjdTXm+xHjY+1pSqhWDYvtxRVf/QiKz+ZqE/ks66meZPl1dHq8Omlu4VFdctOl1cJ7ZNZTX2LjYmlDu3yC8qL5fiCphX1/YiJ0+VXJcySsqixDdkJWXCYNfqUsDGQR6u7wuqfSJgKNQu6NTnT+YTV/ikUMrPsuFvdJOHyeB4dme+wWn7DfFEax5dOh7dIeLoero1VabWiFTeaL3CZfm1pcZOEx/x7c9nLyQ7Fzx9l5j7Qe5DQ+31Wl4/XV/sh9kMfEnrjltOFdNxm9COhNwxajojGQ3CtHwk9b7oS4vTEoN15H+n+XKrM4sORofkow+7uSyfTY84NF2meMqkf4pNDzU0S2t8EmZruquEavThc3/Vd20wN5ea08nrJ8anrCdWmLTqajt4i99HQ+YSB3zJxXjLeO59QnQ/DZtW77PgoXY5OObyn8eszsDpR+QOHrl1YD83v2l7UEhiKbfw4mz1Mq4km2Tl07cCexjLcGm/YP14I1nsbl3eDPUjo7XRlcuXStQcJvW3SWuMLpwNUHxJ6b22FkcML+oNeJPSy88OTWDu+sPlkwrDgnDDUsS1sm61IGv8Qyqcc/f/WTpRNr00YFZwTRjr2pXuThfXasordb7JsmlyV8IfNh3G63z8tXdYIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9MJfebspKLXeD+8AAAAASUVORK5CYII=\"";
                    let imgurl = img.replace("\"", "'");
                    let link = "\"index.html\"";
                    for (var i = 0; i < boards.length; i++) {
                        table.append("<tr><td><a href = " + link + "><div class = \"content\">" +
                                "<div class = \"imgdiv\" style=\"background-image: url("+imgurl+")\"></div>" +
                                "<div class = \"title\" >" +
                                boards[i].split("-")[0] +
                                "</div>" +
                                "</div></a></td></tr>");
                        console.log("<a href = " + link + "><tr><td><div class = \"content\">");
                    }
                },
                error: function () {
                    alert('Something has gone wrong');
                }
            });
        </script>
    </body>
</html>
