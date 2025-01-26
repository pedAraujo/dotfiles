-- ~/.config/nvim/lua/plugins/neo-tree.lua

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",  -- Use the latest stable version
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended for icons
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true })
      end,
      desc = "Explorer NeoTree (root dir)",
    },
    -- Optionally add more key mappings here for different directories or functionalities
  },
  deactivate = function()
    vim.cmd([[Neotree close]])
  end,
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require("neo-tree")
      end
    end
  end,
  opts = {
    filesystem = {
      filtered_items = {
        visible = false, -- This is what made the .git directory show up
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".git",
        },
      },
      follow_current_file = true, -- This will find and focus the file in the active buffer every time
      hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
    },
    window = {
      position = "left",
      width = 30,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        ["<space>"] = "none",
        ["l"] = "open",
        ["h"] = "close_node",
        ["s"] = "open_vsplit",
        ["i"] = "open_split",
      }
    },
    
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
  end,
}
