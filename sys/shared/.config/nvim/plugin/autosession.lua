local status, autosession = pcall(require, 'auto-session')
if (not status) then return end

autosession.setup {
	log_level = 'error'
}
