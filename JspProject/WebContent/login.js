function loginCheck() {
	if ( document.loginform.id.value=="" ) {
		alert("ID��  �Է��� �ּ���.");
		document.boardform.passwd.focus();
		return;
	}	
	else if ( document.loginform.pass.value=="" ) {
		alert("��ȣ�� �Է��� �ּ���.");
		document.boardform.pass.focus();
		return;
	}
	else {
		document.loginform.menu.value='insert';
		document.loginform.submit();
	}
			
}
