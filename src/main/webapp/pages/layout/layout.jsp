<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<link rel="stylesheet" type="text/css" href="style.css">
<script src="js/validationNews.js"></script>
<script src="js/validationVariables.jsp"></script>
<script src="js/ajaxLogic.js"></script>
<script src="js/newsLogic.js"></script>

<html>
    <head><title><bean:message key="other.system" /></title></head>
    <body>
        <div id="wrapper">
            <div id="header"> <tiles:insert attribute="header"/> </div>
            <section id="middle">
                <div id="container">
                    <div id="content">
                        <tiles:insert attribute="content"/>
                    </div>
                </div>
                <div class="sidebar" id="sideLeft">
                    <tiles:insert attribute="sidebar"/>
                </div>
            </section>
        </div>
        <div id="footer"> <tiles:insert attribute="footer"/> </div>
    </body>
</html>
