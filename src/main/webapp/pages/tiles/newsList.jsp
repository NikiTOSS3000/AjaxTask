<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="location">
    <span><bean:message key="other.news" /></span><i> >> </i>
    <bean:message key="list.location" />
</div>
<div id ="newsList">
    <html:form action="/delete" onsubmit="return deleteNewsList();">
        <html:errors/>
        <logic:iterate name="newsForm" property="newsList" id="newsEntry">
            <div class="newsEntry">
                <div class="newsDate">
                    <fmt:formatDate value="${newsEntry.date}" pattern="MM/dd/yyyy"/>
                </div>
                <h3>
                    <span><bean:message key="other.news"/>
                        <bean:message key="view.Lbl001"/></span>
                        ${newsEntry.title}
                </h3>
                <div class="newsBrief">${newsEntry.brief}</div>
                <div class="newsLinks">
                    <html:link action="#" onclick="return loadNewsView(${newsEntry.id});">
                        <bean:message key="list.Lnk001" />
                    </html:link>
                    <html:link action="#" onclick="return loadNewsEdit(${newsEntry.id}, false);">
                        <bean:message key="list.Lnk002" />
                    </html:link>
                    <html:multibox property="checkboxes" value="${newsEntry.id}" />
                </div>
            </div>
        </logic:iterate>
        <c:if test="${not empty newsForm.newsList}">
            <div class="submit-button" >
                <html:submit onclick="return validateCheckboxes();">
                    <bean:message key="list.Btn002" />
                </html:submit>
            </div>
        </c:if>
    </html:form>
</div>