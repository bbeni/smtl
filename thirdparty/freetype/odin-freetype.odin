package freetype

import "core:os"
import "core:c"

when ODIN_OS == .Linux do foreign import freetype "linux/lib/libfreetype.a"
else { #assert(false, "Unsopported OS") }


@(default_calling_convention="c")
foreign freetype {
    @(link_name="FT_Init_FreeType") Init_FreeType :: proc(library: ^Library) -> Error ---
    @(link_name="FT_New_Face") New_Face :: proc(library: Library,  filepathname: cstring, face_index: c.long, aface: ^Face) -> Error ---
    @(link_name="FT_New_Memory_Face") New_Memory_Face :: proc(library: Library, file_base: ^byte, file_size, file_index: c.long, aface: ^Face) -> Error ---
}

Library :: distinct rawptr
Face :: ^FaceRec_

// The code below is partially auto-generated with (find, grep, sed, sort, uniq):
//
// find thirdparty/freetype/freetype-2.13.3-src -name *.h -exec cat {} + | grep -oP "typedef struct FT_.*\* .*" | sort | uniq | sed -n "s/^.*FT_\(\S*\)\*.*FT_\(\S*\);$/\/\/TODO: \2 :: ^\1\n\2 :: rawptr/p"
//

//TODO: The needed structures should be defined for more functionality
//TODO: BitmapGlyph :: ^BitmapGlyphRec_
BitmapGlyph :: rawptr
//TODO: CMap :: ^CMapRec_
CMap :: rawptr
//TODO: CharMap :: ^CharMapRec_
CharMap :: rawptr
//TODO: Driver :: ^DriverRec_
Driver :: rawptr
//TODO: Face_Internal :: ^Face_InternalRec_
Face_Internal :: rawptr
//TODO: Glyph :: ^GlyphRec_
Glyph :: rawptr
//TODO: GlyphSlot :: ^GlyphSlotRec_
GlyphSlot :: rawptr
//TODO: Incremental :: ^IncrementalRec_
Incremental :: rawptr
//TODO: Incremental_Metrics :: ^Incremental_MetricsRec_
Incremental_Metrics :: rawptr
//TODO: ListNode :: ^ListNodeRec_
ListNode :: rawptr
//TODO: List :: ^ListRec_
List :: rawptr
//TODO: Memory :: ^MemoryRec_
Memory :: rawptr
//TODO: Module :: ^ModuleRec_
Module :: rawptr
//TODO: OutlineGlyph :: ^OutlineGlyphRec_
OutlineGlyph :: rawptr
//TODO: Raster :: ^RasterRec_
Raster :: rawptr
//TODO: Renderer :: ^RendererRec_
Renderer :: rawptr
//TODO: SVG_Document :: ^SVG_DocumentRec_
SVG_Document :: rawptr
//TODO: Size :: ^SizeRec_
Size :: rawptr
//TODO: Size_Internal :: ^Size_InternalRec_
Size_Internal :: rawptr
//TODO: Slot_Internal :: ^Slot_InternalRec_
Slot_Internal :: rawptr
//TODO: Stream :: ^StreamRec_
Stream :: rawptr
//TODO: Stroker :: ^StrokerRec_
Stroker :: rawptr
//TODO: SubGlyph :: ^SubGlyphRec_
SubGlyph :: rawptr
//TODO: SvgGlyph :: ^SvgGlyphRec_
SvgGlyph :: rawptr
//TODO: WinFNT_Header :: ^WinFNT_HeaderRec_
WinFNT_Header :: rawptr


Pos :: c.long;

BBox:: struct {
    xMin: Pos,
    yMin: Pos,
    xMax: Pos,
    yMax: Pos,
}

Bitmap_Size:: struct {
    height: c.short,
    width:  c.short,
    size:   Pos,
    x_ppem: Pos,
    y_ppem: Pos,
}


Generic:: struct {
    data: rawptr,
    finalizer: Generic_Finalizer,
}

ListRec:: struct {
    head: ListNode,
    tail: ListNode
}

FaceRec_:: struct {
    num_faces:   c.long,
    face_index:  c.long,
    face_flags:  c.long,
    style_flags: c.long,
    num_glyphs:  c.long,
    family_name: cstring,
    style_name:  cstring,
    num_fixed_sizes: c.int,
    available_sizes: [^]Bitmap_Size,
    num_charmaps: c.int,
    charmaps:     [^]CharMap,
    generic:      Generic,
    /* The following member variables (down to `underline_thickness`) */
    /* are only relevant to scalable outlines, cf. @Bitmap_Size    */
    /* for bitmap fonts.                                           */
    bbox:         BBox,
    units_per_EM: c.ushort,
    ascender:     c.short,
    descender:    c.short,
    height:       c.short,
    max_advance_width:   c.short,
    max_advance_height:  c.short,
    underline_position:  c.short,
    underline_thickness: c.short,
    glyph:   GlyphSlot,
    size:    Size,
    charmap: CharMap,
    /* private fields, internal to FreeType */
    driver: Driver,
    memory: Memory,
    stream: Stream,
    sizes_list: ListRec,
    autohint: Generic,  /* face-specific auto-hinter data */
    extensions: rawptr, /* unused                         */
    internal: Face_Internal,
}

Generic_Finalizer :: #type proc "c" (object: rawptr)

/*Error :: enum c.int {
    Ok                            = 0x00,
    Cannot_Open_Resource          = 0x01,
    Unknown_File_Format           = 0x02,
    Invalid_File_Format           = 0x03,
    Invalid_Version               = 0x04,
    Lower_Module_Version          = 0x05,
    Invalid_Argument              = 0x06,
    Unimplemented_Feature         = 0x07,
    Invalid_Table                 = 0x08,
    Invalid_Offset                = 0x09,
    Array_Too_Large               = 0x0A,
    Missing_Module                = 0x0B,
    Missing_Property              = 0x0C,
    Invalid_Glyph_Index           = 0x10,
    Invalid_Character_Code        = 0x11,
    Invalid_Glyph_Format          = 0x12,
    Cannot_Render_Glyph           = 0x13,
    Invalid_Outline               = 0x14,
    Invalid_Composite             = 0x15,
    Too_Many_Hints                = 0x16,
    Invalid_Pixel_Size            = 0x17,
    Invalid_SVG_Document          = 0x18,
    Invalid_Handle                = 0x20,
    Invalid_Library_Handle        = 0x21,
    Invalid_Driver_Handle         = 0x22,
    Invalid_Face_Handle           = 0x23,
    Invalid_Size_Handle           = 0x24,
    Invalid_Slot_Handle           = 0x25,
    Invalid_CharMap_Handle        = 0x26,
    Invalid_Cache_Handle          = 0x27,
    Invalid_Stream_Handle         = 0x28,
    Too_Many_Drivers              = 0x30,
    Too_Many_Extensions           = 0x31,
    Out_Of_Memory                 = 0x40,
    Unlisted_Object               = 0x41,
    Cannot_Open_Stream            = 0x51,
    Invalid_Stream_Seek           = 0x52,
    Invalid_Stream_Skip           = 0x53,
    Invalid_Stream_Read           = 0x54,
    Invalid_Stream_Operation      = 0x55,
    Invalid_Frame_Operation       = 0x56,
    Nested_Frame_Access           = 0x57,
    Invalid_Frame_Read            = 0x58,
    Raster_Uninitialized          = 0x60,
    Raster_Corrupted              = 0x61,
    Raster_Overflow               = 0x62,
    Raster_Negative_Height        = 0x63,
    Too_Many_Caches               = 0x70,
    Invalid_Opcode                = 0x80,
    Too_Few_Arguments             = 0x81,
    Stack_Overflow                = 0x82,
    Code_Overflow                 = 0x83,
    Bad_Argument                  = 0x84,
    Divide_By_Zero                = 0x85,
    Invalid_Reference             = 0x86,
    Debug_OpCode                  = 0x87,
    ENDF_In_Exec_Stream           = 0x88,
    Nested_DEFS                   = 0x89,
    Invalid_CodeRange             = 0x8A,
    Execution_Too_Long            = 0x8B,
    Too_Many_Function_Defs        = 0x8C,
    Too_Many_Instruction_Defs     = 0x8D,
    Table_Missing                 = 0x8E,
    Horiz_Header_Missing          = 0x8F,
    Locations_Missing             = 0x90,
    Name_Table_Missing            = 0x91,
    CMap_Table_Missing            = 0x92,
    Hmtx_Table_Missing            = 0x93,
    Post_Table_Missing            = 0x94,
    Invalid_Horiz_Metrics         = 0x95,
    Invalid_CharMap_Format        = 0x96,
    Invalid_PPem                  = 0x97,
    Invalid_Vert_Metrics          = 0x98,
    Could_Not_Find_Context        = 0x99,
    Invalid_Post_Table_Format     = 0x9A,
    Invalid_Post_Table            = 0x9B,
    DEF_In_Glyf_Bytecode          = 0x9C,
    Missing_Bitmap                = 0x9D,
    Missing_SVG_Hooks             = 0x9E,
    Syntax_Error                  = 0xA0,
    Stack_Underflow               = 0xA1,
    Ignore                        = 0xA2,
    No_Unicode_Glyph_Name         = 0xA3,
    Glyph_Too_Big                 = 0xA4,
    Missing_Startfont_Field       = 0xB0,
    Missing_Font_Field            = 0xB1,
    Missing_Size_Field            = 0xB2,
    Missing_Fontboundingbox_Field = 0xB3,
    Missing_Chars_Field           = 0xB4,
    Missing_Startchar_Field       = 0xB5,
    Missing_Encoding_Field        = 0xB6,
    Missing_Bbx_Field             = 0xB7,
    Bbx_Too_Big                   = 0xB8,
    Corrupted_Font_Header         = 0xB9,
    Corrupted_Font_Glyphs         = 0xBA,
}*/

