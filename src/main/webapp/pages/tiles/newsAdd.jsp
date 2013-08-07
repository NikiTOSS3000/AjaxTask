<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>

<div id="location">
    <span><bean:message key="other.news" /></span><i> >> </i>
    <bean:message key="add.location" />
</div>
<div id="newsAdd">
    <html:form action="/save" onsubmit="return saveNews();">
        <html:errors />
        <dl>
            <dt>
            <label for="title"><bean:message key="add.Txt001" /></label>
            </dt>
            <dd>
                <html:text property="newsMessage.title" styleId="title" />
            </dd>
            <dt>
            <label for="date"><bean:message key="add.Txt003" /></label>
            </dt>
            <dd>
                <html:text property="date" styleId="date"/>
            </dd>
            <dt>
            <label for="brief"><bean:message key="add.TxtA001" /></label>
            </dt>
            <dd>
                <html:textarea property="newsMessage.brief" styleId="brief"
                               cols="40" rows="5" />
            </dd>
            <dt>
            <label for="cont"><bean:message key="add.TxtA002" /></label>
            </dt>
            <dd>
                <html:textarea property="newsMessage.content" styleId="cont"
                               cols="40" rows="10" />
            </dd>
            <html:hidden styleId="id" property="newsMessage.id" />
        </dl>
        <div class="submit-button btn1" onclick="return validateSave();">
            <html:submit>
                <bean:message key="add.Btn001" />
            </html:submit>
        </div>
    </html:form>
    <html:form action="/cancel" onsubmit="return cancel();">
        <div class="submit-button btn2">
            <html:hidden styleId="fromView" property="fromView" />
            <html:hidden styleId="id" property="newsMessage.id"/>
            <html:submit>
                <bean:message key="add.Btn002" />
            </html:submit>
        </div>
    </html:form>
</div>