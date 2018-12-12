let b:ale_fixers = {
\ 'javascript': ['prettier', 'eslint'],
\
\}

let b:ale_linters = {
\ 'javascript': ['eslint', 'flow'],
\
\}
let b:ale_javascript_prettier_options = '--single-quote --trailing-comma'
let b:javascript_plugin_flow = 1
