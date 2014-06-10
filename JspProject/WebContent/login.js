function loginCheck() {
	if ( document.loginform.id.value=="" ) {
		alert("ID를  입력해 주세요.");
		document.boardform.passwd.focus();
		return;
	}	
	else if ( document.loginform.pass.value=="" ) {
		alert("암호를 입력해 주세요.");
		document.boardform.pass.focus();
		return;
	}
	else {
		document.loginform.menu.value='insert';
		document.loginform.submit();
	}
			
}
