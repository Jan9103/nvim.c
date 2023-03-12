#include "../nvim.h"

int luaopen_config_keymaps() {
  map("n", "<leader>", "");

  map("n", "<F3>", ":set nornu nonu list!<CR>");
  map("n", "q", ":q<CR>");
  map("n", "<leader>s", ":sor i<CR>");

  // half insert mode
  map("n", " ", "i <Esc>l");
  map("n", "<Return>", "o<Esc>");
  map("n", "<BackSpace>", "hx");

  // move lines
  map("n", "<S-up>", ":m .-2<CR>==");
  map("n", "<S-down>", ":m .+1<CR>==");

  // quick indent
  map("n", "<Tab>", ">>");
  map("n", "<S-Tab>", "<<");
  map("v", "<Tab>", ">><Esc>gv");
  map("v", "<S-Tab>", "<<<Esc>gv");

  // manage windows
  map("n", "<C-left>", "<C-w>h");
  map("n", "<C-down>", "<C-w>j");
  map("n", "<C-up>", "<C-w>k");
  map("n", "<C-right>", "<C-w>l");
  map("t", "<C-left>", "<C-w>h");
  map("t", "<C-down>", "<C-w>j");
  map("t", "<C-up>", "<C-w>k");
  map("t", "<C-right>", "<C-w>l");

  // telescope
  map("n", "<leader>tf", ":Telescope find_files <CR>");
  map("n", "<leader>tg", ":Telescope live_grep <CR>");
  map("n", "<leader>b", ":Telescope buffers<CR>");

  return 1;
}
