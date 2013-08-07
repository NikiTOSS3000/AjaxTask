<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>

<div id="menu">
    <h2>
        <bean:message key="other.news" />
    </h2>
    <ul id="menuList">
        <li><html:link href="#" onclick="return loadNewsList();">
                <bean:message key="list.location" />
            </html:link></li>
        <li><html:link href="#" onclick="return loadAddList();">
                <bean:message key="add.location" />
            </html:link></li>
    </ul>
</div>