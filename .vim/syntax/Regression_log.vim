syntax keyword mdlType	  warnings warning Warning Warnings WARNINGS WARNING
syntax keyword error errors error Error ERROR FATAL Fatal fatal
syntax match logOriginal "^>.*$"
syntax match logOriginal ".*Only in OUT.*"
syntax match logFinal "^<.*$"
syntax match logFinal "^Only in GOLD.*$"
syntax match newTestcase ".*Performing comparison for.*$"
syntax match diff "^diff.*"
syntax match testcase ".*REGRESSION_PATH/MDLChar.*"
syntax match info "\[INFO]"
highlight link mdlType		  Type
highlight link logOriginal       Operator
highlight logFinal       guifg=#00FF00 guibg=bg
highlight error          guifg=#FF0000 guibg=bg gui=bold
highlight newTestcase          guifg=#FFFF00 guibg=bg
highlight diff guifg=#FFDAB9
highlight testcase guifg=#FF00FF gui=bold
highlight info guifg=#00FF00
