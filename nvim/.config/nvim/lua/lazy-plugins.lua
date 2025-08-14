-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
require('lazy').setup({
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

  -- NOTE custom plugins added to kickstart
  require 'custom.plugins.tmux-navigator',

  require 'kickstart.plugins.blink-cmp',
  require 'kickstart.plugins.conform',
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.gitsigns',
  require 'kickstart.plugins.lspconfig',
  require 'kickstart.plugins.mini',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.telescope',
  require 'kickstart.plugins.todo-comments',
  require 'kickstart.plugins.tokyonight',
  require 'kickstart.plugins.treesitter',
  require 'kickstart.plugins.which-key',
  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',

  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
