<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>

<html:link action="/index">
    <h1>
        <bean:message key="other.system" />
    </h1>
</html:link>
<div id="lang">
    <html:link action="/toEnglish">
        <bean:message key="other.eng" />
    </html:link>
    &nbsp;
    <html:link action="/toRussian">
        <bean:message key="other.rus" />
    </html:link>
</div>
