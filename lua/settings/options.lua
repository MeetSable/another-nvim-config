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

for option, value in pairs(powershell_options) do
  set[option] = value
end

set.clipboard = 'unnamedplus'
