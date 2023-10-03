local coc_opts = {
    silent = true,
    noremap = true,
    expr = true,
}
-- COC keybinds
vim.keymap.set('i', '<Cr>',
function() 
    -- Returns 1 if visible, 0 if not
    is_visible = vim.fn['coc#pum#visible']()
    if is_visible == 1 then
        return vim.fn['coc#pum#confirm']()
    else
        return '<Cr>'
    end
end, coc_opts)
