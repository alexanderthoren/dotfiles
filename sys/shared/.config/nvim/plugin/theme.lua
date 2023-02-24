local status, theme = pcall(require, 'onedark')
if (not status) then return end

theme.setup {
	style = 'warmer'
}

theme.load()
