vim.g.mapleader = ","

vim.g.lazy_lock_file = "~/.cache/nvim/lazy-lock.json"

require("user.lazy");
require("user.set");
require("user.remap");

-- vim: set ts=2 sw=2 et:
