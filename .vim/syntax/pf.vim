""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Copyright (c) 1997-2010 by Interra Systems, Inc. All rights reserved.
"
" This software and online documentation contain confidential information and
" trade secrets of Interra Systems, Inc. Use, disclosure, or reproduction is
" prohibited without the prior express written permission of Interra Systems,
" Inc.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim syntax file
" Language : MDL
" Maintainer : TouchStone team Interra Systems, Inc. <ts_support@InterraSystems.com>

syntax clear
syntax case match

syntax keyword mdlType	  float int bool string array hash

syntax keyword mdlBoolean	  true 	false

syntax keyword mdlCondition if else elsif switch  
syntax keyword mdlLabel	case default
syntax keyword mdlLoop		loop

syntax keyword mdlFunction getenv compose  strcat  strrev binaryToDecimal decimalToBinary invertBinary system abs ceil floor exists strsplit length getKeys
syntax keyword mdlFunction GetDefaultLoad GetDefaultSlew GetLoadValue GetSlewValue
syntax keyword mdlFunction invertToBinary invertToDecimal warn println print 
syntax keyword mdlFunction fprintf fprint die return RESULT_PARAM

syntax keyword mdlStatement  characterization operation
syntax keyword mdlIdentifier  waveform   param index characterize verification function signal sweep leakagepower nwaveform 
syntax keyword mdlIdentifier  activeNet execute  verify verifyCondition find find_eqn findVoltage timeStep check 
syntax keyword mdlIdentifier  timeUnit currentUnit loadUnit slew load defaultMargin simulator setVoltage capUnit powerUnit leakagePowerUnit 
syntax keyword mdlIdentifier circuitFile pvtName pulse vth defaultSlew defaultLoad monteRun slewName lvfParams
syntax keyword mdlIdentifier  customSpice lib vddTerminal busBracket useOffsetSlew addInit 
syntax keyword mdlIdentifier  verifyOutputInTable gridOptions simTimeout tran template begin end vector_table vddMap gndMap GetPwlFromVectorTable 

syntax keyword mdlDirection INPUT OUTPUT INOUT WIRE BUS
syntax keyword mdlConstant POSEDGE NEGEDGE NONE ENUMERATED RANGE RANGEBINARY  DECIMAL VOLTAGE EQN MONTE NO_TD OPTIONS IGNORE TD

syntax keyword mdlParams DEPENDENT_HOLD DEPENDENT_SETUP SETUP HOLD PWH PWL BISECTION FALL_CURRENT RISE_CURRENT ECSM
syntax keyword mdlParams DELAY POWER RISETIME FALLTIME INTERNAL_POWER PINCAP GENERIC TRISTATE_ENABLE TRISTATE_DISABLE switch_offset threshold

syntax keyword mdlSims	HSPICE  SPECTRE HSIM NANOSIM 

syntax keyword mdlSpecial AVG RMS PP INTEG MIN MAX  P I

syntax region mdlCString start=+"+ skip=+\\\\\|\\"+ end=+"+

syntax keyword mdlPreproc include
syntax match mdlIntegral "[ ][*/%^+-][ ]"
syntax match mdlRelational "[<>]"
syntax match mdlRelational "[<>=!][=]"
syntax match mdlLogical 	"&&"
syntax match mdlLogical 	"||"
syntax match mdlGives "=>"
syntax match mdlBitOperator "|"
syntax match mdlBitOperator "&"
syntax match mdlUnary "[\~]"

syntax match mdlComment "#.*$"
syntax region mdlMultiLineComment start=+/\*+ end=+\*/+ contains=mdlLineCont
syntax match mdlNumber "-\=\<[0-9]\+\>"
syntax match mdlFloat "[+\-]\=\d*\.\d\+\(e[+\-]\=\d\+\)\="
syntax match mdlString "\<[a-zA-Z_][a-zA-Z0-9_]*\>"
syntax match mdlArray "@[a-zA-Z_][a-zA-Z0-9_]*\>"
syntax match mdlHash  "%[a-zA-Z_][a-zA-Z0-9_]*\>"
syntax match mdlScalar "\$[a-zA-Z_][a-zA-Z0-9_]*\>"
syntax match mdlTemplateScalar "\${[a-zA-Z_][a-zA-Z0-9_]*\>}"

syntax case ignore

syntax keyword mdlIgCase  my

highlight link mdlType		  Type
highlight link mdlIgCase	  Type
highlight link mdlLabel		  Label
highlight link mdlBoolean	  Boolean
highlight link mdlCondition	  Conditional
highlight link mdlLoop  	  Repeat
highlight link mdlFunction	  Function
highlight mdlStatement   gui=bold guifg=#00A000
highlight link mdlIdentifier  Statement
highlight link mdlDirection   Constant
highlight link mdlConstant    Constant
highlight link mdlParams      Constant
highlight link mdlSims        Constant
highlight link mdlSpecial     Constant
highlight link mdlPreproc     PreProc
highlight link mdlIntegral    Operator
highlight link mdlRelational  Operator
highlight link mdlLogical     Operator
highlight link mdlGives       Operator
highlight link mdlBitOperator Operator
highlight link mdlUnary       Operator
highlight link mdlCString     String

highlight link mdlNumber	  Number
highlight link mdlFloat		  Float
highlight link mdlArray       Identifier
highlight link mdlHash        Identifier
highlight link mdlScalar      Identifier
highlight link mdlTemplateScalar Identifier
highlight link mdlComment     Comment

" To use the mdl.vim, add the following line to your .vimrc and .gvimrc file.
" (without the leading double quote)
" :autocmd BufRead,BufNewFile *.mdl source <FILE-PATH>/mdl.vim
" Add the following line in .gvimrc file
" :amenu Syntax.L-Ma.mdl :source <FILE-PATH>/mdl.vim<Enter>


