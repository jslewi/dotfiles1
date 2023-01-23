vim.cmd [[
try
  colorscheme base16-classic-dark 
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
