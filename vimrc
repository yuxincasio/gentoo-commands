set number
set relativenumber
set cindent
set wildmenu
set wildmode=full

" Function to cycle and preview colorschemes live
function! CycleColorSchemes()
    if !exists('s:schemes')
        " Get a list of all installed colorschemes
        let s:schemes = split(globpath(&rtp, 'colors/*.vim'), "\n")
        call map(s:schemes, 'fnamemodify(v:val, ":t:r")')
        let s:index = 0
    endif
    
    " Apply the current scheme in the index
    let l:scheme = s:schemes[s:index]
    execute 'colorscheme ' . l:scheme
    echo 'Previewing colorscheme: ' . l:scheme
    
    " Move index forward for the next press
    let s:index = (s:index + 1) % len(s:schemes)
endfunction

" Press F8 in Normal Mode to switch themes instantly
nnoremap <F8> :call CycleColorSchemes()<CR>

