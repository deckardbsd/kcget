if exists( "g:loaded_kcget" )
  finish
endif

let g:loaded_kcget = 1

if !( has( 'python' ) || has( 'python3' ) )
  echohl WarningMsg |
        \ echomsg "KCGet unavailable: requires python." |
        \ echohl None
  finish
endif

nnoremap <leader>s
	\ :call kcget#GetServices()<cr>
