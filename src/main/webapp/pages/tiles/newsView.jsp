<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script>
    var msg = "<bean:message key="view.E08"/>";
</script>
<div id="location">
    <span><bean:message key="other.news" /></span><i> >> </i><bean:message key="view.location" />
</div>
<div id ="newsView">
    <html:form action="/delete" onsubmit="return deleteNews(${newsForm.newsMessage.id});">
        <nested:define id="newsMessage" property="newsMessage" />
        <dl>
            <dt>
            <label for="title"><bean:message key="view.Lbl001" /></label>
            </dt>
            <dd>
                <div id="title">${newsMessage.title}</div>
            </dd>
            <dt>
            <label for="date"><bean:message key="view.Lbl002" /></label>
            </dt>
            <dd>
                <div id="date">
                    <fmt:formatDate value="${newsMessage.date}" pattern="MM/dd/yyyy"/>
                </div>
            </dd>
            <dt>
            <label for="brief"><bean:message key="view.Lbl003" /></label>
            </dt>
            <dd>
                <div id="brief">${newsMessage.brief}</div>
            </dd>
            <dt>
            <label for="cont"><bean:message key="view.Lbl004" /></label>
            </dt>
            <dd>
                <div id="cont">${newsMessage.content}</div>
            </dd>
        </dl>
        <div class="submit-button">
            <html:submit onclick="return confirm(msg)">
                <bean:message key="view.Btn002" />
            </html:submit>
        </div>
    </html:form>
    <html:form action="/edit" onsubmit="return loadNewsEdit(${newsMessage.id}, true);">
        <div class="submit-button fake">
            <html:submit>
                <bean:message key="view.Btn001" />
            </html:submit>
        </div>
    </html:form>
</div>