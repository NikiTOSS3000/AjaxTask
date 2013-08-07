function deleteNewsList() {
    chks = document.getElementsByName('checkboxes');
    i = 0;
    var data = "";
    for (; i < chks.length; i++) {
        if (chks[i].checked) {
            if (data != "") {
                data = data + "&";
            }
            data = data + 'checkboxes=' + chks[i].value;
        }
    }
    ajax("POST","form","delete.do", data, function(req){
		loadNewsList();
	});
    return false;
}

function saveNews() {
    data = "newsMessage.title=" + document.getElementById("title").value +
            "&date=" + document.getElementById("date").value +
            "&newsMessage.brief=" + document.getElementById("brief").value +
            "&newsMessage.content=" + document.getElementById("cont").value + 
            "&newsMessage.id=" + document.getElementById("id").value;
        ajax("POST","form","save.do", data, function(req){
		replaceBody(req.responseText);
	});
    return false;
}

function replaceBody(text) {
    document.getElementById("content").innerHTML = text;
    return false;
}

function loadNewsList() {
    ajax("GET",null,"list.do", null, function(req){
		replaceBody(req.responseText);
	});
    return false;
}

function loadNewsView(id) {
    data = "newsID=" + id;
    ajax("POST","form","view.do", data, function(req){
		replaceBody(req.responseText);
	});
    return false;
}

function cancel() {
    data = "newsID=" + document.getElementById("id").value +
            "&fromView=" + document.getElementById("fromView").value;
    ajax("POST","form","cancel.do", data, function(req){
		replaceBody(req.responseText);
	});
    return false;
}

function deleteNews() {
    data = "newsID=" + id;
    ajax("POST","form","delete.do", data, function(req){
		replaceBody(req.responseText);
	});
    return false;
}

function loadNewsEdit(id, fromView) {
    data = "newsID=" + id + "&fromView=" + fromView;
    ajax("POST","form","edit.do", data, function(req){
		replaceBody(req.responseText);
	});
    return false;
}

function loadAddList() {
    ajax("GET",null,"add.do", null, function(req){
		replaceBody(req.responseText);
	});
    return false;
}