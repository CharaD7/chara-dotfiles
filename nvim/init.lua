require('chara')
-- loading snippets relative to the directory of $MYVIMRC
require("luasnip.loaders.from_vscode").load({ paths = "./snippets/rust" })
require("luasnip.loaders.from_vscode").load({ paths = "./snippets/python" })
require("luasnip.loaders.from_vscode").load({ paths = "./snippets/typescript" })
