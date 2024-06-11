-- Define a global variable to track the autosave state
_G.autosave_enabled = true

-- Function to enable autosave
local function enable_autosave()
  vim.cmd([[
    augroup autosave
      autocmd!
      autocmd FileType * autocmd TextChanged,InsertLeave,InsertEnter,CursorHoldI <buffer> if &readonly == 0 && &buftype == '' | silent write | endif
    augroup END
  ]])
  _G.autosave_enabled = true
  print("Autosave enabled")
end

-- Function to disable autosave
local function disable_autosave()
  vim.cmd([[
    augroup autosave
      autocmd!
    augroup END
  ]])
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

-- Keybinding to toggle autosave (e.g., <leader>s)
vim.api.nvim_set_keymap('n', '<leader>s', ':ToggleAutosave<CR>', { noremap = true, silent = true })

-- Initially enable autosave
enable_autosave()

