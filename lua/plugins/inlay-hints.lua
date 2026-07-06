return {
    "MysticalDevil/inlay-hints.nvim",
    event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
    enabled = false,
    config = function()
        require("inlay-hints").setup()
    end
}
