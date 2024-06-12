-- Define a global variable to track the autosave state
_G.autosave_enabled = false

-- Function to enable autosave
local function enable_autosave()
  vim.api.nvim_create_augroup("autosave", { clear = true })
  vim.api.nvim_create_autocmd({"TextChanged", "InsertLeave", "InsertEnter", "CursorHoldI"}, {
    group = "autosave",
    pattern = "*",
    callback = function()
      if vim.bo.readonly == false and vim.bo.buftype == "" then
        vim.cmd("silent! write")
        print("Autosave complete")
      end
    end
  })
  _G.autosave_enabled = true
  print("Autosave enabled")
end

-- Function to disable autosave
local function disable_autosave()
  vim.api.nvim_del_augroup_by_name("autosave")
  _G.autosave_enabled = false
  print("Autosave disabled")
end

-- Toggle function
local function toggle_autosave()
  if _G.autosave_enabled then
    disable_autosave()
  else
    enable_autosave()
  end
end

-- Command to toggle autosave
vim.api.nvim_create_user_command('ToggleAutosave', toggle_autosave, {})

-- Keybinding to toggle autosave (e.g., <C-a>)
vim.api.nvim_set_keymap('n', '<C-a>', ':ToggleAutosave<CR>', { noremap = true, silent = true })

