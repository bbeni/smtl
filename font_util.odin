package smtl

platform_name :: proc(platform_id: u16) -> string {
    switch (platform_id) {
    case 0: return "Unicode"
    case 1: return "Macintosh"
    case 2: return "ISO (deprecated)"
    case 3: return "Windows"
    case 4: return "Custom"
        case:   return "Unknown"
    }
}

encoding_name :: proc(platform_id: u16, encoding_id: u16) -> string {
    switch platform_id {
    case 0: //return "Unicode"
        switch encoding_id {
        case 0: return "Unicode 1.0 semantics—deprecated"
        case 1: return "Unicode 1.1 semantics—deprecated"
        case 2: return "ISO/IEC 10646 semantics—deprecated"
        case 3: return "Unicode 2.0+ semantics, Unicode BMP only"
        case 4: return "Unicode 2.0+ semantics, Unicode full repertoire"
        }
    case 1: // return "Macintosh"
        switch encoding_id {
        case 0 : return "Roman"
        case 1 : return "Japanese"
        case 2 : return "Chinese (Traditional)"
        case 3 : return "Korean"
        case 4 : return "Arabic"
        case 5 : return "Hebrew"
        case 6 : return "Greek"
        case 7 : return "Russian"
        case 8 : return "RSymbol"
        case 9 : return "Devanagari"
        case 10: return "Gurmukhi"
        case 11: return "Gujarati"
        case 12: return "Odia"
        case 13: return "Bangla"
        case 14: return "Tamil"
        case 15: return "Telugu"
        case 16: return "Kannada"
        case 17: return "Malayalam"
        case 18: return "Sinhalese"
        case 19: return "Burmese"
        case 20: return "Khmer"
        case 21: return "Thai"
        case 22: return "Laotian"
        case 23: return "Georgian"
        case 24: return "Armenian"
        case 25: return "Chinese (Simplified)"
        case 26: return "Tibetan"
        case 27: return "Mongolian"
        case 28: return "Geez"
        case 29: return "Slavic"
        case 30: return "Vietnamese"
        case 31: return "Sindhi"
        case 32: return "Uninterpreted"
        }
    case 2: //return "ISO (deprecated)"
        return "Unknown ISO (deprectated_"
    case 3: //return "Windows"
        switch encoding_id {
        case 0 : return "Symbol"
        case 1 : return "Unicode BMP"
        case 2 : return "ShiftJIS"
        case 3 : return "PRC"
        case 4 : return "Big5"
        case 5 : return "Wansung"
        case 6 : return "Johab"
        case 7 : return "Reserved"
        case 8 : return "Reserved"
        case 9 : return "Reserved"
        case 10: return "Unicode full repertoire"
        }
    case 4: return "Custom"
    }
    return "Unknown"
}
