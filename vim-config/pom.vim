" Phase of Moon calculation
"
" Usage:
"     Use the pom#pom or pom#upom functions in your statusline

let s:NewMoon = 0
let s:WaxingCrescent = 1
let s:FirstQuarter = 7
let s:WaxingGibbous = 8
let s:FullMoon = 15
let s:WaningGibbous = 16
let s:ThirdQuarter = 23
let s:WaningCrescent = 24


function! pom#julday(year, month, day)
    if a:year < 0
        let year = a:year + 1
    else
        let year = a:year
    endif
    let jy = str2nr(l:year)
    let jm = str2nr(a:month) + 1
    if a:month <= 2
        let jy-=1
        let jm += 12
    endif
    let l:jul = float2nr(365.25 * l:jy) + float2nr(30.6001 * l:jm) + str2nr(a:day) + 1720995
    if a:day+31*(a:month+12*l:year) >= (15+31*(10+12*1582))
        let ja = floor(0.01 * l:jy)
        let jul = l:jul + 2 - l:ja + float2nr(0.25 * l:ja)
    endif
    return l:jul
endfunction

function! pom#calculate(y, m, d)
    " Moon Phase Calculation. This is black magic from ben-daglish.net/moon.shtml
    let n = floor(12.37 * (a:y - 1900 + ((1.0*a:m - 0.5)/12.)))
    let RAD = 3.14159265/180.0
    let t = l:n / 1236.85
    let t2 = l:t*l:t
    let as = 359.2242 + 29.105356 * l:n
    let am = 306.0253 + 385.816918 * l:n + 0.010730 * l:t2
    let xtra = 0.75933 + 1.53058868 * l:n + ((1.178e-4) - (1.55e-7) * l:t) * l:t2
    let xtra += (0.1734 - 3.93e-4 * l:t) * sin(l:RAD * l:as) - 0.4068 * sin(l:RAD * l:am)
    let i = (l:xtra > 0.0 ? floor(l:xtra) :    ceil(l:xtra - 1.0))
    let j1 = pom#julday(a:y, a:m, a:d)
    let jd = (2415020 + 28 * l:n) + i
    let phase = float2nr(l:j1-l:jd + 30) % 30

    " Convert to an actual phase
    let ret = s:NewMoon
    if l:phase == s:NewMoon
        let ret = s:NewMoon
    elseif l:phase > s:NewMoon && phase < s:FirstQuarter
        let ret = s:WaxingCrescent
    elseif l:phase == s:FirstQuarter
        let ret = s:FirstQuarter
    elseif l:phase > s:FirstQuarter && phase < s:FullMoon
        let ret = s:WaxingGibbous
    elseif l:phase == s:FullMoon
        let ret = s:FullMoon
    elseif l:phase > s:FullMoon && phase < s:ThirdQuarter
        let ret = s:WaningGibbous
    elseif l:phase == s:ThirdQuarter
        let ret = s:ThirdQuarter
    else
        let ret = s:WaningCrescent
    endif
    return l:ret
endfunction

function! pom#phase(y, m, d)
    let l:pnum = pom#calculate(a:y, a:m, a:d)
    if l:pnum == s:NewMoon
        return 'New Moon'
    elseif l:pnum == s:WaxingCrescent
        return 'Waxing Crescent'
    elseif l:pnum == s:FirstQuarter
        return 'First Quarter'
    elseif l:pnum == s:WaxingGibbous
        return 'Waxing Gibbous'
    elseif l:pnum == s:FullMoon
        return 'Full Moon'
    elseif l:pnum == s:WaningGibbous
        return 'Waning Gibbous'
    elseif l:pnum == s:ThirdQuarter
        return 'Third Quarter'
    elseif l:pnum == s:WaningCrescent
        return 'Waning Crescent'
    endif
endfunction

function! pom#uphase(y, m, d)
    let l:pnum = pom#calculate(a:y, a:m, a:d)
    if l:pnum == s:NewMoon
        return '🌑'
    elseif l:pnum == s:WaxingCrescent
        return '🌒'
    elseif l:pnum == s:FirstQuarter
        return '🌓'
    elseif l:pnum == s:WaxingGibbous
        return '🌔'
    elseif l:pnum == s:FullMoon
        return '🌕'
    elseif l:pnum == s:WaningGibbous
        return '🌖'
    elseif l:pnum == s:ThirdQuarter
        return '🌗'
    elseif l:pnum == s:WaningCrescent
        return '🌘'
    endif
endfunction

function! pom#pom()
    let l:y = str2nr(strftime("%Y"))
    let l:m = str2nr(strftime("%m"))
    let l:d = str2nr(strftime("%d"))
    return pom#phase(l:y, l:m, l:d)
endfunction

function! pom#upom()
    let l:y = str2nr(strftime("%Y"))
    let l:m = str2nr(strftime("%m"))
    let l:d = str2nr(strftime("%d"))
    return pom#uphase(l:y, l:m, l:d)
endfunction
