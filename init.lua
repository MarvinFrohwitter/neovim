vim.g.mapleader = " "
vim.g.maplockalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("baseconfig")
require("lazyinit")
require("keymaps")
require("autoexec")

require("init")

vim.cmd([[
    if !exists('g:undotree_WindowLayout')
        let g:undotree_WindowLayout = 2
    endif
]])

vim.cmd([[
    if !exists('g:undotree_SetFocusWhenToggle')
        let g:undotree_SetFocusWhenToggle = 1
    endif
]])

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "ada", "agda", "angular", "apex", "arduino", "asm", "astro", "authzed", "awk", "bash", "bass", "beancount",
        "bibtex", "bicep", "bitbake", "blade", "blueprint", "bp", "brightscript", "caddy", "cairo", "capnp", "chatito",
        "circom", "clojure", "cmake", "comment", "commonlisp", "cooklang", "corn", "cpon", "cpp", "c_sharp", "c", "css",
        "csv", "cuda", "cue", "cylc", "dart", "desktop", "devicetree", "dhall", "diff", "disassembly", "djot",
        "dockerfile", "dot", "doxygen", "d", "dtd", "earthfile", "ebnf", "editorconfig", "eds", "eex", "elixir", "elm",
        "elsa", "elvish", "embedded_template", "enforce", "erlang", "facility", "faust", "fennel", "fidl", "firrtl",
        "fish", "foam", "forth", "fortran", "fsharp", "fsh", "func", "fusion", "gap", "gaptst", "gdscript",
        "gitattributes", "gitcommit", "git_config", "gitignore", "git_rebase", "gleam", "glimmer_javascript", "glimmer",
        "glimmer_typescript", "glsl", "gn", "gnuplot", "goctl", "godot_resource", "gomod", "go", "gosum", "gotmpl",
        "gowork", "gpg", "graphql", "gren", "groovy", "gstlaunch", "hack", "hare", "haskell_persistent", "haskell", "hcl",
        "heex", "helm", "hjson", "hlsl", "hlsplaylist", "hocon", "hoon", "htmldjango", "html", "http", "hurl", "hyprlang",
        "idl", "idris", "ini", "inko", "ipkg", "ispc", "janet_simple", "javadoc", "javascript", "java", "jinja_inline",
        "jinja", "jq", "jsdoc", "json5", "jsonc", "jsonnet", "json", "julia", "just", "kcl", "kconfig", "kdl", "kotlin",
        "koto", "kusto", "lalrpop", "latex", "ledger", "leo", "linkerscript", "liquid", "liquidsoap", "llvm", "luadoc",
        "luap", "lua", "luau", "m68k", "make", "markdown_inline", "markdown", "matlab", "menhir", "mermaid", "meson",
        "mlir", "muttrc", "nasm", "nginx", "nickel", "nim_format_string", "nim", "ninja", "nix", "nqc", "nu", "objc",
        "objdump", "ocaml_interface", "ocamllex", "ocaml", "odin", "pascal", "passwd", "pem", "perl", "phpdoc",
        "php_only", "php", "pioasm", "pod", "poe_filter", "pony", "po", "powershell", "printf", "prisma", "problog",
        "prolog", "promql", "properties", "proto", "prql", "psv", "pug", "puppet", "purescript", "pymanifest", "python",
        "ql", "qmldir", "qmljs", "query", "racket", "ralph", "rasi", "razor", "rbs", "re2c", "readline", "regex", "rego",
        "requirements", "rescript", "rnoweb", "robot", "robots", "roc", "ron", "r", "rst", "ruby", "runescript", "rust",
        "scala", "scfg", "scheme", "scss", "sflog", "slang", "slim", "slint", "smali", "smithy", "snakemake", "solidity",
        "soql", "sosl", "sourcepawn", "sparql", "sql", "squirrel", "ssh_config", "starlark", "strace", "styled",
        "supercollider", "superhtml", "surface", "svelte", "sway", "swift", "sxhkdrc", "systemtap", "t32", "tablegen",
        "tact", "tcl", "teal", "templ", "tera", "terraform", "textproto", "thrift", "tiger", "tlaplus", "tmux", "todotxt",
        "toml", "tsv", "tsx", "turtle", "twig", "typescript", "typespec", "typoscript", "typst", "udev", "ungrammar",
        "unison", "usd", "uxntal", "vala", "vento", "verilog", "vhdl", "vhs", "vimdoc", "vim", "vrl", "v", "vue",
        "wgsl_bevy", "wgsl", "wing", "with", "xcompose", "xml", "xresources", "yaml", "yang", "yuck", "zathurarc",
        "ziggy_schema", "ziggy", "zig",
    },
    callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
