augroup ft_clojure
    au!

    au BufNewFile,BufRead riemann.config set filetype=clojure
    au FileType clojure silent! call cljfold#ToggleClojureFolding()
    au FileType clojure setlocal report=100000
    nnoremap <buffer> <leader>fc ":call cljfold#ToggleClojureFolding<cr>"
augroup END
