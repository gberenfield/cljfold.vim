let loaded_clojurefolding=1
" really needed???

"" Defintions: what to fold?
let g:clojure_foldwords="def,ns"
""

function! CompareLispword(line)
  let fwc = split(clojure_foldwords,",")

  for fw in fwc
    if a:line =~ '^\s*('.fw.'.*\s'
      return 1
    endif
  endfor
endfunction

function GetClojureFold()
      if CompareLispword(getline(v:lnum))
        return ">1"
      elseif getline(v:lnum) =~ '^\s*$'
            let my_cljnum = v:lnum
            let my_cljmax = line("$")

            while (1)
                  let my_cljnum = my_cljnum + 1
                  if my_cljnum > my_cljmax
                        return "<1"
                  endif

                  let my_cljdata = getline(my_cljnum)

                  if my_cljdata =~ '^$'
                        return "<1"
                  else
                        return "="
                  endif
            endwhile
      else
            return "="
      endif
endfunction

function! ToggleClojureFolding()
  if clojure_folding
    setlocal foldenable&
    let clojure_folding=0
  else
    setlocal foldexpr=GetClojureFold()
    setlocal foldmethod=expr
    let clojure_folding=1
  endif
endfunction

