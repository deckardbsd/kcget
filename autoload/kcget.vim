if !( has( 'python' ))
  echohl WarningMsg |
        \ echomsg "KCGet unavailable: requires python." |
        \ echohl None
  finish
endif

let s:script_folder_path = escape( expand( '<sfile>:p:h' ), '\' )

function! s:UsingPython2()
    " I'm willing to bet quite a bit that sooner or later, somebody will ask us to
    " make it configurable which version of Python we use.
    if has('python')
        return 1
    endif
    return 0
endfunction

let s:using_python2 = s:UsingPython2()
let s:python_until_eof = s:using_python2 ? "python << EOF" : "python3 << EOF"

function! s:SetupPython() abort

    exec s:python_until_eof

# Add python sources folder to the system path.
script_folder = vim.eval( 's:script_folder_path' )
sys.path.insert( 0, os.path.join( script_folder, '..', 'python' ) )

import os
import sys
import traceback

EOF
endfunction 

call s:SetupPython()

function! kcget#GetServices(ktype, namespace)
    python import sys
    python type_ns = (vim.eval("a:ktype"), vim.eval("a:namespace"))
    python sys.argv.append(type_ns)
    execute 'pyf ' s:script_folder_path . '/../python/get_services.py'
endfunction

