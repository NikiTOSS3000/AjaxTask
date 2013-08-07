function ajax(method, type, action, data, callback) {
    var xmlHttp = createXMLHttpObject();
    xmlHttp.onreadystatechange = callbackFunction(callback, xmlHttp);
    xmlHttp.open(method, action, true);
    switch (type) {
        case "form":
            xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            break;
    }
    xmlHttp.send(data);
    return false;
}

function createXMLHttpObject() {
    var xmlHttp = false;
    try {
        xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
        try {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (e2) {
            xmlHttp = false;
        }
    }
    if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
        xmlHttp = new XMLHttpRequest();
    }
    return xmlHttp;
}

function callbackFunction(func, xmlHttp) {
    return function() {
        if (xmlHttp.readyState == 4) {
            func(xmlHttp)
        }
    };
}