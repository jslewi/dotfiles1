local options = {
	clipboard = "unnamedplus", 					-- allow access to system clipboard
	number = true,								-- set line numbers
	numberwidth = 3,
	signcolumn = 'yes',
	modelines = 0,
	showcmd = true,
	splitright = true,
	splitbelow = true,
	shiftwidth = 4,
	tabstop = 4,
	cmdheight = 2,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

