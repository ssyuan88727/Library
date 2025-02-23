const doHttp = async (method, url, data) => {
	const fetchSetting = {
		method: method,
		body: data
	}, res = await fetch(url, fetchSetting);

	if (!res.ok) {
		showError(res.statusText);
		return null;
	}

	const json = await res.json()
	if (!json.ok) {
		showError(json.msg);
		return null;
	}
	return json
}

const showError = (msg, method) => {
	Swal.fire({
		icon: "error",
		title: "錯誤",
		text: msg
	}).then(result => {
		if (result.isConfirmed) method();
	});
}

const showSuccess = (msg, method) => {
	Swal.fire({
		icon: "success",
		title: "成功",
		text: msg,
		timer: 1000,
		timerProgressBar: true,
		showConfirmButton: false
	}).then(result => {
		if (result.dismiss === Swal.DismissReason.timer) method();
	});
}

const showConfirm = (msg, method) => {
	Swal.fire({
		icon: "warning",
		title: "警告",
		text: msg,
		showCancelButton: true,
		cancelButtonText: "取消"
	}).then(result => {
		if (result.isConfirmed) method();
	});
}

const myTable = (selector, newSetting) => {
	const setting = {
		responsive: true,
		lengthChange: false,
		language: {
			url: "https://cdn.datatables.net/plug-ins/2.2.2/i18n/zh-HANT.json",
		}
	}
	$(selector).DataTable($.extend(setting, newSetting));
}

const myQuill = (selector) => {
	return new Quill(selector, {
		theme: "snow",
		modules: {
			toolbar: [
				['bold', 'italic', 'underline', 'strike'],
				['blockquote', 'code-block'],
				[{ 'header': 1 }, { 'header': 2 }],
				[{ 'list': 'ordered' }, { 'list': 'bullet' }],
				[{ 'script': 'sub' }, { 'script': 'super' }],
				[{ 'indent': '-1' }, { 'indent': '+1' }],
				[{ 'direction': 'rtl' }],
				[{ 'size': ['small', false, 'large', 'huge'] }],
				[{ 'header': [1, 2, 3, 4, 5, 6, false] }],
				['clean']
			]
		}
	});
}