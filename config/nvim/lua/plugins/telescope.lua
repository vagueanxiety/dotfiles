function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

function telescope_dropdown()
  local dropdown =
    require('telescope.builtin').current_buffer_fuzzy_find(
      require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
  return dropdown
end

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local cmd = vim.cmd
      local actions = require("telescope.actions")
      require("telescope").setup({
        extensions = {
          coc = {
              prefer_locations = false,
          },
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
          },
        },
        defaults = {
          sorting_strategy = "ascending",
          layout_strategy = "vertical",
          layout_config = {
            vertical = {
              width = 0.9,
              preview_height = 0.7,
            }
          },
          preview = { timeout = 1000 },
          path_display = {"truncate"},
          mappings = {
              i = {
                  ["<esc>"] = actions.close,
                  ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
              },
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--fixed-strings"
          }
        },
      })
      -- show line number in file picker
      cmd "autocmd User TelescopePreviewerLoaded setlocal number"
      require('telescope').load_extension('fzf')
    end,
    init = function()
      local keyset = vim.keymap.set
      local builtin = require('telescope.builtin')
      keyset('n', '<Leader>bu', builtin.buffers, {})
      keyset('n', '<Leader>e', builtin.find_files, {})
      keyset('n', '<Leader>f', builtin.live_grep, {})
      keyset('n', '<Leader>F', builtin.grep_string, {})
      keyset('v', '<Leader>G', function()
        local text = vim.getVisualSelection()
        builtin.live_grep({ default_text = text })
      end, {})
      keyset('n', '<Leader>m', builtin.marks, {})
      keyset('n', '<Leader>M', ':Telescope man_pages sections=ALL<CR>', {})
      keyset('n', '<leader>/', telescope_dropdown, {})

      -- lsp
      --keyset('n', '<Leader>gd', builtin.lsp_definitions, {})
      --keyset('n', '<Leader>gy', builtin.lsp_type_definitions, {})
      --keyset('n', '<Leader>gr', builtin.lsp_references, {})
      --keyset('n', '<Leader>gi', builtin.lsp_implementations, {})
      --keyset('n', '<Leader>S', builtin.lsp_workspace_symbols, {})
      --keyset('n', '<Leader>s', builtin.lsp_document_symbols)
      --keyset('n', '<Leader>d', builtin.diagnostics, {})
    end
  },
}
