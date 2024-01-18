local set = vim.opt

set.number = true
set.backspace = '2'
set.showcmd = true
set.laststatus = 2
set.autowrite = true
set.autoread = true
set.cursorline = true
set.cursorlineopt = 'number'
set.relativenumber = true
set.wrap = false
set.ignorecase = true
set.smartcase = true
set.termguicolors = true
set.autoindent = true
set.smartindent = true
set.softtabstop = 4
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = false
set.shiftround = true
set.formatoptions:remove({ 'c', 'r', 'o' })
set.modifiable = true
set.mousemoveevent = true
-- set.winbar = " %{%v:lua.vim.fn.expand('%F')%}  %{%v:lua.require'nvim-navic'.get_location()%}"
local powershell_options = {
  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

if vim.fn.has('win32') == 1 then
	for option, value in pairs(powershell_options) do
	set[option] = value
	end
elseif vim.fn.has('linux') == 1 then
	set.shell = 'bash'
end

set.clipboard = 'unnamedplus'
set.inccommand = ''

-- neovide settings
if vim.g.neovide then
	vim.o.guifont = "JetBrainsMono Nerd Font Mono:h10"
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_cursor_vfx_mode = "wireframe"
	vim.g.neovide_cursor_vfx_mode = "torpedo"
	vim.keymap.set('v', '<D-c>', '"+y') -- Copy
	vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
	vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
	vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
	vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end
