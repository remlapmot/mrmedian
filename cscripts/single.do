* master do-file for running a single cscript
* 2020-01-17

local path = subinstr("`c(pwd)'", "cscripts", "", 1)
cap noi adopath ++ "`path'"

cap noi log close _all

cscript master

cap noi ado describe mrrobust

local cscripts mrmvivw

foreach dofile of local cscripts {
    log using `dofile'.log, text replace name(`dofile')
    do `dofile'
    log close `dofile'
}

cap noi log close _all

cap noi adopath - "`path'"
