resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description 'Hud For QBCore'

server_scripts {
	"server/main.lua",
	"config.lua",
	"server/money.lua",

}

client_scripts {
	"client/main.lua",
	"config.lua",
	"client/money.lua",
	
	"client/ui.lua",
}

ui_page {
	'html/ui.html'
}

files {
	'html/*.png',
	'html/*.svg',
	'html/*.html',
	'html/ui.html',
	'html/css/main.css',
	'html/css/pricedown_bl-webfont.ttf',
	'html/css/pricedown_bl-webfont.woff',
	'html/css/pricedown_bl-webfont.woff2',
	'html/css/gta-ui.ttf',
	'html/js/app.js',
	'html/css/pdown.ttf',
	'html/css/*.css',
	'html/css/*.ttf',
	'html/css/*.woff',
	'html/css/*.woff2',
}