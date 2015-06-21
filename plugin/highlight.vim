" This is a copy of a plugin found on the vim wiki:
" http://vim.wikia.com/wiki/Auto_highlight_current_word_when_idle

" I just put it on github to have an easier time adding it to my .vimrc
" with NeoBundle.

" Credits to the original author and wiki contributors.

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight
    current word: ON'
    return 1
  endif
endfunction
