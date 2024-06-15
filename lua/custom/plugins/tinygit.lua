return {
    "chrisgrieser/nvim-tinygit",
    ft = { "git_rebase", "gitcommit" }, -- so ftplugins are loaded
    dependencies = {
        "stevearc/dressing.nvim",
        "rcarriga/nvim-notify",
        {
            "AstroNvim/astrocore",
            opts = {
                mappings = {
                    n = {
                        ["<Leader>gc"] = { function() require("tinygit").smartCommit() end, desc = "New commit" },
                        ["<Leader>gp"] = { function() require("tinygit").push { forceWithLease = true } end, desc = "Push" },
                    },
                },
            },
        },
    },
    opts = {
        statusline = {
            branchState = {
                icons = {
                    ahead = " ",
                    behind = " ",
                    diverge = " ",
                },
            },
        }
    },
}
