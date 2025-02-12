local null_ls = require("null-ls")

local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.mypy.with({
            extra_args = { "--python-executable=" .. virtual  .. "/bin/python3" },
        }),
    },
})
