vim.cmd([[
  autocmd BufNewFile,BufRead *.jank setfiletype clojure

  " How many lines to consider for indentation correctness; it's large.
  let g:clojure_maxlines = 10000

  " Line up doc strings vertically.
  let g:clojure_align_multiline_strings = 1

  " Detect which bodies to indent, rather than hang.
  let g:clojure_fuzzy_indent = 1
  let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '^box', '^h-box', '^v-box', '^fn\*']

  " Conjure options.
  let g:conjure_log_direction = "horizontal"
  let g:conjure#log#botright = "false"
  let g:conjure_log_blacklist = ["up", "ret", "ret-multiline", "load-file", "eval"]
  let g:conjure_log_size_small = 25
  let g:conjure_log_size_large = 25
]])
