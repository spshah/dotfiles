""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Copyright (c) 1997-2008 by Interra Systems, Inc. All rights reserved.
"
" This software and online documentation contain confidential information and
" trade secrets of Interra Systems, Inc. Use, disclosure, or reproduction is
" prohibited without the prior express written permission of Interra Systems,
" Inc.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim syntax file
" Language : MDL
" Maintainer : MC2 team Interra Systems, Inc. <mc2_support@InterraSystems.com>

syntax clear
syntax case match

syntax keyword mdlHeader header
syntax keyword mdlStatement placement netlist bistSection topSection
syntax keyword mdlStatement ViaProgramData block port ports
syntax keyword mdlStatement metalblock ProgramData function bfunction ViaProgram viapcell
syntax keyword mdlStatement return include copyFile
syntax keyword mdlStatement antennaOptimize
syntax keyword mdlStatement cellCount
syntax keyword mdlConditional if elsif else switch
syntax keyword mdlLabel case default
syntax keyword mdlRepeat loop repeat until while foreach ploop
syntax keyword mdlGeometric place array array_x array_y origin pattern sub MR
syntax keyword mdlGeometric subx suby
syntax keyword mdlGeometric connect spice comment
syntax keyword mdlGeometric automap addProperty boundary label
syntax keyword mdlGeometric personalize bitmap column_scramble row_scramble
syntax keyword mdlGeometric col_scramble start_address physical_columns
syntax keyword mdlGeometric physical_rows column_mux_ratio template_cell
syntax keyword mdlGeometric complete_word swap_column swap_row first_column
syntax keyword mdlGeometric first_row template_rotation define inhibit inhibitSpace map_vp
syntax keyword mdlGeometric combine remove via_list no_via index_list
syntax keyword mdlGeometric map map_b map_r map_t map_l map_oto map_one map_all
syntax keyword mdlGeometric map_default map_copy
syntax keyword mdlGeometric exact gridaway gridtowards external
syntax keyword mdlGeometric bridgePower guardRing powerMesh routeOption writeLEF
syntax keyword mdlGeometric contact offset strap
syntax keyword mdlGeometric donut donutCells donutColumn donutRemove donutRow donutSwapCells
syntax keyword mdlGeometric flattenBlock flattenTillLeaf renameBlock
syntax keyword mdlGeometric assert
syntax keyword mdlGeometric sequenceGenerator
syntax keyword mdlGeometric path generatePowerPins generateInhibits
syntax keyword mdlBist algorithm marchElement portType portSet waveform
syntax keyword mdlBist waveformSet bistOption addressSequence biraOption
syntax keyword mdlBist addressDescramble dataDescramble
syntax keyword mdlMetalBlock layer left bottom right top all
syntax keyword mdlDirection input output inout wire scalar
syntax keyword mdlFunctions height width max min log abs fabs sqrt setroundingmode
syntax keyword mdlFunctions floor round ceil float
syntax keyword mdlFunctions import getint getstr getbool getfloat
syntax keyword mdlFunctions export setint setstr setbool setfloat
syntax keyword mdlFunctions getDelayData
syntax keyword mdlFunctions index rindex sprintf strcat split strlen strrev
syntax keyword mdlFunctions substr strreplace
syntax keyword mdlFunctions getenv envExists length system open close exists  
syntax keyword mdlFunctions getNumberOfAR getNumberOfSR getx gety
syntax keyword mdlFunctions getHierarchicalNet getTranslatedRects
syntax keyword mdlFunctions getCellData getKeys sort
syntax keyword mdlFunctions tolower toupper
syntax keyword mdlFunctions compose compare
syntax keyword mdlFunctions cellExists
syntax keyword mdlFunctions getscrambledarray
syntax keyword mdlFunctions keyExists replace readlines rmline replaceCell removeCell
syntax keyword mdlFunctions drcMetalSpacing drcHalation PostProcess
syntax keyword mdlFunctions getLabelPos
syntax keyword mdlFunctions defineArray
syntax keyword mdlFunctions getFuncCallLineNumber
syntax keyword mdlFunctions mdljoinArray mdlpopArray mdlprintArray mdlpushArray mdlreverseArray
syntax keyword mdlDebug print println die warn fprint fprintf MDLDebug uprint
syntax keyword mdlTypes my int float bool string local hash
syntax keyword mdlBoolean true false
syntax keyword mdlConstant reverse
syntax keyword mdlConstant R0 R90 R180 R270 MX MY
syntax keyword mdlConstant INFER PINBOX PROMOTE PINLEF UNIQUE ROUTE METALBOX BITWISE PINTEXT EXPAND SHRINK BELOW_PIN
syntax keyword mdlConstant NOSPACE
syntax keyword mdlConstant ASCENDINGX ASCENDINGY DESCENDINGX DESCENDINGY
syntax keyword mdlConstant MASK1 MASK2 MASK3 MASK4
syntax keyword mdlConstant GRID
syntax keyword mdlConstant BOUNDARY INSTANCE RECTANGLE THIS HALATION
syntax keyword mdlConstant SOUTH NORTH EAST WEST
syntax keyword mdlConstant STAGGERED_SOUTH STAGGERED_NORTH STAGGERED_EAST STAGGERED_WEST STAGGERED
syntax keyword mdlConstant METAL1 METAL2 METAL3 METAL4 METAL5 METAL6
syntax keyword mdlConstant METAL7 METAL8 METAL9 METALWISE
syntax keyword mdlConstant METAL10 METAL11 METAL12 METAL13 METAL14 METAL15 METAL16
syntax keyword mdlConstant METAL17 METAL18
syntax keyword mdlConstant VIA12 VIA23 VIA34 VIA45 VIA56 VIA67 VIA78 VIA89 VIA910 
syntax keyword mdlConstant VIA1011 VIA1112 VIA1213 VIA1314 VIA1415 VIA1516 VIA1617 VIA1718
syntax keyword mdlConstant placeVia SEARCH_HIER
syntax keyword mdlConstant placeStub acceptHorizontal acceptVertical

syntax keyword mdlConstant KEEP_LARGEST_BOUNDARY MERGE_BOUNDARY
syntax keyword mdlConstant MISABUTMENT MISALIGNED_X MISALIGNED_XY MISALIGNED_Y
syntax keyword mdlConstant MISCONNECTION VOID_TILE
syntax keyword mdlConstant ALL ALLOW CENTERVIA COST DONTROUTE EVEN HCOST
syntax keyword mdlConstant HORIZONTAL IGNORE_PIN_SIZE METAL ODD RESTRICT
syntax keyword mdlConstant STRAIGHT TYPE USEMETAL USEPIN USEMETALPIN VCOST VERTICAL VIA RESERVE
syntax keyword mdlConstant BLOCKAGE LAYER PIN
syntax keyword mdlConstant CONVERT COPY DELETE
syntax keyword mdlConstant TILE_ROM NO_TILE_ROM
syntax keyword mdlConstant KEEP REMOVE REMOVE_BLOCK at 
syntax keyword mdlConstant graphical textual
syntax keyword mdlConstant IPR_ie IPR_oe OPR_ie OPR_oe
syntax keyword mdlConstant BINARY EXPONENT LINEAR
syntax keyword mdlOperator eq ne gt lt ge le

syntax region mdlCString start=+"+ skip=+\\\\\|\\"+ end=+"+

syntax match mdlComment "#.*$"
syntax match mdlLineCont "$" contained
syntax region mdlMultiLineComment start=+/\*+ end=+\*/+ contains=mdlLineCont
syntax match mdlNumber "-\=\<[0-9]\+\>"
syntax match mdlFloat "[+\-]\=\d*\.\d\+\(e[+\-]\=\d\+\)\="
syntax match mdlString "\<[a-zA-Z_][a-zA-Z0-9_]*\>"
syntax match mdlArray "@[a-zA-Z_][a-zA-Z0-9_]*\>"
syntax match mdlHash "[%][a-zA-Z_][a-zA-Z0-9_]*\>"
syntax match mdlScalar "\$[a-zA-Z_][a-zA-Z0-9_]*\>"
syntax match mdlFunctionCall "&[a-zA-Z_][a-zA-Z0-9_]*\>"
syntax match mdlConcat "[a-zA-Z_][a-zA-Z0-9_]*\(\${[a-zA-Z_][a-zA-Z0-9_]*}[a-zA-Z0-9_]*\)\+"

syntax match mdlRange "[<\[]\s*\d\+\s*,\s*\d\+\s*[>\]]"
" Added space around the operators so that hash variables can be recognized
" This is a temporary solution. Try to find if using regions we can get better
" solution.
syntax match mdlIntegral "[ ][*/%^][ ]"
syntax match mdlRelational "[<>]"
syntax match mdlRelational "[<>=!][=]"
syntax match mdlGives "=>"

highlight link mdlTypes		Type
highlight link mdlFloat		Float
highlight link mdlLabel		Label
highlight link mdlDebug		Debug
highlight link mdlRange		Special
highlight link mdlConcat	Special
highlight link mdlRepeat	Repeat
highlight link mdlNumber	Number
highlight link mdlArray		Identifier
highlight link mdlHash		Identifier
highlight link mdlScalar	Identifier
highlight link mdlCString	String
highlight link mdlBoolean	Boolean
highlight link mdlComment	Comment
highlight link mdlMultiLineComment	Comment
highlight link mdlConstant	Constant
highlight link mdlGives		Operator
highlight link mdlOperator	Operator
highlight link mdlIntegral	Operator
highlight link mdlRelational	Operator
highlight link mdlFunctions	Function
highlight link mdlFunctionCall	Special
highlight link mdlDirection	Constant
highlight link mdlHeader	Statement
highlight link mdlGeometric	Statement
highlight link mdlBist	Statement
highlight link mdlStatement	Statement
highlight link mdlMetalBlock	Special
highlight link mdlConditional	Conditional

highlight mdlString		guifg=brown

" To use the MDL.vim, add the following line to your .vimrc and .gvimrc file.
" (without the leading double quote)
" :autocmd BufRead,BufNewFile *.pf source <FILE-PATH>/MDL.vim
" Add the following line in .gvimrc file
" :amenu Syntax.L-Ma.MDL :source <FILE-PATH>/MDL.vim<Enter>

