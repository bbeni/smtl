package freetype

import "core:c"

Error :: enum c.int {
    Ok = 0x00, // "no error"
    Cannot_Open_Resource = 0x01, // "cannot open resource"
    Unknown_File_Format = 0x02, // "unknown file format"
    Invalid_File_Format = 0x03, // "broken file"
    Invalid_Version = 0x04, // "invalid FreeType version"
    Lower_Module_Version = 0x05, // "module version is too low"
    Invalid_Argument = 0x06, // "invalid argument"
    Unimplemented_Feature = 0x07, // "unimplemented feature"
    Invalid_Table = 0x08, // "broken table"
    Invalid_Offset = 0x09, // "broken offset within table"
    Array_Too_Large = 0x0A, // "array allocation size too large"
    Missing_Module = 0x0B, // "missing module"
    Missing_Property = 0x0C, // "missing property"
    Invalid_Glyph_Index = 0x10, // "invalid glyph index"
    Invalid_Character_Code = 0x11, // "invalid character code"
    Invalid_Glyph_Format = 0x12, // "unsupported glyph image format"
    Cannot_Render_Glyph = 0x13, // "cannot render this glyph format"
    Invalid_Outline = 0x14, // "invalid outline"
    Invalid_Composite = 0x15, // "invalid composite glyph"
    Too_Many_Hints = 0x16, // "too many hints"
    Invalid_Pixel_Size = 0x17, // "invalid pixel size"
    Invalid_SVG_Document = 0x18, // "invalid SVG document"
    Invalid_Handle = 0x20, // "invalid object handle"
    Invalid_Library_Handle = 0x21, // "invalid library handle"
    Invalid_Driver_Handle = 0x22, // "invalid module handle"
    Invalid_Face_Handle = 0x23, // "invalid face handle"
    Invalid_Size_Handle = 0x24, // "invalid size handle"
    Invalid_Slot_Handle = 0x25, // "invalid glyph slot handle"
    Invalid_CharMap_Handle = 0x26, // "invalid charmap handle"
    Invalid_Cache_Handle = 0x27, // "invalid cache manager handle"
    Invalid_Stream_Handle = 0x28, // "invalid stream handle"
    Too_Many_Drivers = 0x30, // "too many modules"
    Too_Many_Extensions = 0x31, // "too many extensions"
    Out_Of_Memory = 0x40, // "out of memory"
    Unlisted_Object = 0x41, // "unlisted object"
    Cannot_Open_Stream = 0x51, // "cannot open stream"
    Invalid_Stream_Seek = 0x52, // "invalid stream seek"
    Invalid_Stream_Skip = 0x53, // "invalid stream skip"
    Invalid_Stream_Read = 0x54, // "invalid stream read"
    Invalid_Stream_Operation = 0x55, // "invalid stream operation"
    Invalid_Frame_Operation = 0x56, // "invalid frame operation"
    Nested_Frame_Access = 0x57, // "nested frame access"
    Invalid_Frame_Read = 0x58, // "invalid frame read"
    Raster_Uninitialized = 0x60, // "raster uninitialized"
    Raster_Corrupted = 0x61, // "raster corrupted"
    Raster_Overflow = 0x62, // "raster overflow"
    Raster_Negative_Height = 0x63, // "negative height while rastering"
    Too_Many_Caches = 0x70, // "too many registered caches"
    Invalid_Opcode = 0x80, // "invalid opcode"
    Too_Few_Arguments = 0x81, // "too few arguments"
    Stack_Overflow = 0x82, // "stack overflow"
    Code_Overflow = 0x83, // "code overflow"
    Bad_Argument = 0x84, // "bad argument"
    Divide_By_Zero = 0x85, // "division by zero"
    Invalid_Reference = 0x86, // "invalid reference"
    Debug_OpCode = 0x87, // "found debug opcode"
    ENDF_In_Exec_Stream = 0x88, // "found ENDF opcode in execution stream"
    Nested_DEFS = 0x89, // "nested DEFS"
    Invalid_CodeRange = 0x8A, // "invalid code range"
    Execution_Too_Long = 0x8B, // "execution context too long"
    Too_Many_Function_Defs = 0x8C, // "too many function definitions"
    Too_Many_Instruction_Defs = 0x8D, // "too many instruction definitions"
    Table_Missing = 0x8E, // "SFNT font table missing"
    Horiz_Header_Missing = 0x8F, // "horizontal header (hhea) table missing"
    Locations_Missing = 0x90, // "locations (loca) table missing"
    Name_Table_Missing = 0x91, // "name table missing"
    CMap_Table_Missing = 0x92, // "character map (cmap) table missing"
    Hmtx_Table_Missing = 0x93, // "horizontal metrics (hmtx) table missing"
    Post_Table_Missing = 0x94, // "PostScript (post) table missing"
    Invalid_Horiz_Metrics = 0x95, // "invalid horizontal metrics"
    Invalid_CharMap_Format = 0x96, // "invalid character map (cmap) format"
    Invalid_PPem = 0x97, // "invalid ppem value"
    Invalid_Vert_Metrics = 0x98, // "invalid vertical metrics"
    Could_Not_Find_Context = 0x99, // "could not find context"
    Invalid_Post_Table_Format = 0x9A, // "invalid PostScript (post) table format"
    Invalid_Post_Table = 0x9B, // "invalid PostScript (post) table"
    DEF_In_Glyf_Bytecode = 0x9C, // "found FDEF or IDEF opcode in glyf bytecode"
    Missing_Bitmap = 0x9D, // "missing bitmap in strike"
    Missing_SVG_Hooks = 0x9E, // "SVG hooks have not been set"
    Syntax_Error = 0xA0, // "opcode syntax error"
    Stack_Underflow = 0xA1, // "argument stack underflow"
    Ignore = 0xA2, // "ignore"
    No_Unicode_Glyph_Name = 0xA3, // "no Unicode glyph name found"
    Glyph_Too_Big = 0xA4, // "glyph too big for hinting"
    Missing_Startfont_Field = 0xB0, // `STARTFONT' field missing"
    Missing_Font_Field = 0xB1, // `FONT' field missing"
    Missing_Size_Field = 0xB2, // `SIZE' field missing"
    Missing_Fontboundingbox_Field = 0xB3, // `FONTBOUNDINGBOX' field missing"
    Missing_Chars_Field = 0xB4, // `CHARS' field missing"
    Missing_Startchar_Field = 0xB5, // `STARTCHAR' field missing"
    Missing_Encoding_Field = 0xB6, // `ENCODING' field missing"
    Missing_Bbx_Field = 0xB7, // `BBX' field missing"
    Bbx_Too_Big = 0xB8, // `BBX' too big"
    Corrupted_Font_Header = 0xB9, // "Font header corrupted or missing fields"
    Corrupted_Font_Glyphs = 0xBA, // "Font glyphs corrupted or missing fields"
}

error_string :: proc (error: Error) -> string {
    switch error {
    case .Ok: return "no error"
    case .Cannot_Open_Resource: return "cannot open resource"
    case .Unknown_File_Format: return "unknown file format"
    case .Invalid_File_Format: return "broken file"
    case .Invalid_Version: return "invalid FreeType version"
    case .Lower_Module_Version: return "module version is too low"
    case .Invalid_Argument: return "invalid argument"
    case .Unimplemented_Feature: return "unimplemented feature"
    case .Invalid_Table: return "broken table"
    case .Invalid_Offset: return "broken offset within table"
    case .Array_Too_Large: return "array allocation size too large"
    case .Missing_Module: return "missing module"
    case .Missing_Property: return "missing property"
    case .Invalid_Glyph_Index: return "invalid glyph index"
    case .Invalid_Character_Code: return "invalid character code"
    case .Invalid_Glyph_Format: return "unsupported glyph image format"
    case .Cannot_Render_Glyph: return "cannot render this glyph format"
    case .Invalid_Outline: return "invalid outline"
    case .Invalid_Composite: return "invalid composite glyph"
    case .Too_Many_Hints: return "too many hints"
    case .Invalid_Pixel_Size: return "invalid pixel size"
    case .Invalid_SVG_Document: return "invalid SVG document"
    case .Invalid_Handle: return "invalid object handle"
    case .Invalid_Library_Handle: return "invalid library handle"
    case .Invalid_Driver_Handle: return "invalid module handle"
    case .Invalid_Face_Handle: return "invalid face handle"
    case .Invalid_Size_Handle: return "invalid size handle"
    case .Invalid_Slot_Handle: return "invalid glyph slot handle"
    case .Invalid_CharMap_Handle: return "invalid charmap handle"
    case .Invalid_Cache_Handle: return "invalid cache manager handle"
    case .Invalid_Stream_Handle: return "invalid stream handle"
    case .Too_Many_Drivers: return "too many modules"
    case .Too_Many_Extensions: return "too many extensions"
    case .Out_Of_Memory: return "out of memory"
    case .Unlisted_Object: return "unlisted object"
    case .Cannot_Open_Stream: return "cannot open stream"
    case .Invalid_Stream_Seek: return "invalid stream seek"
    case .Invalid_Stream_Skip: return "invalid stream skip"
    case .Invalid_Stream_Read: return "invalid stream read"
    case .Invalid_Stream_Operation: return "invalid stream operation"
    case .Invalid_Frame_Operation: return "invalid frame operation"
    case .Nested_Frame_Access: return "nested frame access"
    case .Invalid_Frame_Read: return "invalid frame read"
    case .Raster_Uninitialized: return "raster uninitialized"
    case .Raster_Corrupted: return "raster corrupted"
    case .Raster_Overflow: return "raster overflow"
    case .Raster_Negative_Height: return "negative height while rastering"
    case .Too_Many_Caches: return "too many registered caches"
    case .Invalid_Opcode: return "invalid opcode"
    case .Too_Few_Arguments: return "too few arguments"
    case .Stack_Overflow: return "stack overflow"
    case .Code_Overflow: return "code overflow"
    case .Bad_Argument: return "bad argument"
    case .Divide_By_Zero: return "division by zero"
    case .Invalid_Reference: return "invalid reference"
    case .Debug_OpCode: return "found debug opcode"
    case .ENDF_In_Exec_Stream: return "found ENDF opcode in execution stream"
    case .Nested_DEFS: return "nested DEFS"
    case .Invalid_CodeRange: return "invalid code range"
    case .Execution_Too_Long: return "execution context too long"
    case .Too_Many_Function_Defs: return "too many function definitions"
    case .Too_Many_Instruction_Defs: return "too many instruction definitions"
    case .Table_Missing: return "SFNT font table missing"
    case .Horiz_Header_Missing: return "horizontal header (hhea) table missing"
    case .Locations_Missing: return "locations (loca) table missing"
    case .Name_Table_Missing: return "name table missing"
    case .CMap_Table_Missing: return "character map (cmap) table missing"
    case .Hmtx_Table_Missing: return "horizontal metrics (hmtx) table missing"
    case .Post_Table_Missing: return "PostScript (post) table missing"
    case .Invalid_Horiz_Metrics: return "invalid horizontal metrics"
    case .Invalid_CharMap_Format: return "invalid character map (cmap) format"
    case .Invalid_PPem: return "invalid ppem value"
    case .Invalid_Vert_Metrics: return "invalid vertical metrics"
    case .Could_Not_Find_Context: return "could not find context"
    case .Invalid_Post_Table_Format: return "invalid PostScript (post) table format"
    case .Invalid_Post_Table: return "invalid PostScript (post) table"
    case .DEF_In_Glyf_Bytecode: return "found FDEF or IDEF opcode in glyf bytecode"
    case .Missing_Bitmap: return "missing bitmap in strike"
    case .Missing_SVG_Hooks: return "SVG hooks have not been set"
    case .Syntax_Error: return "opcode syntax error"
    case .Stack_Underflow: return "argument stack underflow"
    case .Ignore: return "ignore"
    case .No_Unicode_Glyph_Name: return "no Unicode glyph name found"
    case .Glyph_Too_Big: return "glyph too big for hinting"
    case .Missing_Startfont_Field: return "`STARTFONT' field missing"
    case .Missing_Font_Field: return "`FONT' field missing"
    case .Missing_Size_Field: return "`SIZE' field missing"
    case .Missing_Fontboundingbox_Field: return "`FONTBOUNDINGBOX' field missing"
    case .Missing_Chars_Field: return "`CHARS' field missing"
    case .Missing_Startchar_Field: return "`STARTCHAR' field missing"
    case .Missing_Encoding_Field: return "`ENCODING' field missing"
    case .Missing_Bbx_Field: return "`BBX' field missing"
    case .Bbx_Too_Big: return "`BBX' too big"
    case .Corrupted_Font_Header: return "Font header corrupted or missing fields"
    case .Corrupted_Font_Glyphs: return "Font glyphs corrupted or missing fields"
    case : return "Unknown Error"
    }
}
