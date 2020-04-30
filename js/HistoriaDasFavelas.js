function sleep(ms) {
	return new Promise((resolve, reject) => {
		setTimeout(() => {
			resolve(true)
		}, ms);
	})
}

function main() {
	var finalRes = []
	let titles = document.querySelectorAll('.title')
	let i = 0;
	while (i < titles.length) {
		var title = titles[i].innerText
		if (title != null) {
			let img = ""
			let ibge = ""
			let imgs = document.querySelectorAll('.content')[i].querySelectorAll('img')
			if (imgs.length == 2) {
				img = imgs[0].src
				ibge = imgs[1].src
			} else if (imgs.length == 1) {
				ibge = imgs[0].src
			}
			let description = ""
			if (document.querySelectorAll('.content')[i].querySelectorAll('span').length > 0) {
				description = document.querySelectorAll('.content')[i].querySelectorAll('span')[0].innerText
			}

			finalRes.push({
				title: title,
				img: img,
				ibge: ibge,
				description: description,
			})
		}
		// let img = document.querySelectorAll('.content')[i].querySelectorAll('img').length == 1 ? "" : document.querySelectorAll('.content')[i].querySelectorAll('img')[0]
		// let ibge = document.querySelectorAll('.content')[i].querySelectorAll('img')[1]
		// let description = document.querySelectorAll('.content')[i].querySelectorAll("[style='font-size:14px']")[0].innerText;

		i++;
	}
	console.log(finalRes)
}
main()