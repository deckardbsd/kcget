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

nnoremap <leader>sd
	\ :call kcget#GetServices("service", "development")<cr>
nnoremap <leader>ss
	\ :call kcget#GetServices("service", "sandbox")<cr>
