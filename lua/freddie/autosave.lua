-- lua/autosave.lua

_G.autosave_enabled = false  -- Set autosave to be off by default

local function enable_autosave()
  vim.cmd([[
    augroup autosave
      autocmd!
      autocmd BufRead * if &filetype == "" | setlocal ft=text | endif
      autocmd FileType * autocmd TextChanged,InsertLeave <buffer> if &readonly == 0 && &buftype == '' | silent write | endif
    augroup END
  ]])
  _G.autosave_enabled = true
  print("Autosave enabled")
end

local function disable_autosave()
  vim.cmd([[
    augroup autosave
      autocmd!
    augroup END
  ]])
  _G.autosave_enabled = false
  print("Autosave disabled")
end

local function toggle_autosave()
  if _G.autosave_enabled then
    disable_autosave()
  else
    enable_autosave()
  end
end

vim.api.nvim_create_user_command('ToggleAutosave', toggle_autosave, {})

vim.api.nvim_set_keymap('n', '<C-a>', ':ToggleAutosave<CR>', { noremap = true, silent = true })

-- Initially do not enable autosave
-- enable_autosave()  -- Commented out to keep autosave off by default

