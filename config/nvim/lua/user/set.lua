local function on_buf_write_pre()
  local file_name = vim.fn.expand("%:t")
  local file_extension = vim.fn.expand("%:e")

  if file_extension ~= "lst" then
    pcall(function() vim.cmd [[%s/\s\+$//e]] end)
  end
end


vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

--vim.o.mouse = "" -- turn annoying  popup menu off
vim.o.mouse = "a"

vim.opt.clipboard = "unnamed,unnamedplus"

vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.cursorline = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*"},
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    on_buf_write_pre()
    vim.fn.setpos(".", save_cursor)
	end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "html",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "nix",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end
})
