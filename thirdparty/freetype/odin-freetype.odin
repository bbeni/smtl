package freetype

import "core:os"
import "core:c"

when ODIN_OS == .Linux do foreign import freetype "linux/lib/libfreetype.a"
else { #assert(false, "Unsopported OS") }


@(default_calling_convention="c")
foreign freetype {
    // Semi-auto-generated
    @(link_name="FT_Init_FreeType") Init_FreeType :: proc(alibrary: ^Library) -> Error  ---
    @(link_name="FT_Done_FreeType") Done_FreeType :: proc(library: Library) -> Error  ---
    @(link_name="FT_New_Face") New_Face :: proc(library: Library, filepathname: cstring, face_index: c.long, aface: ^Face) -> Error  ---
    @(link_name="FT_New_Memory_Face") New_Memory_Face :: proc(library: Library, file_base: ^byte, file_size: c.long, face_index: c.long, aface: ^Face) -> Error  ---
    @(link_name="FT_Open_Face") Open_Face :: proc(library: Library, args: ^Open_Args, face_index: c.long, aface: ^Face) -> Error  ---
    @(link_name="FT_Attach_File") Attach_File :: proc(face: Face, filepathname: cstring) -> Error  ---
    @(link_name="FT_Attach_Stream") Attach_Stream :: proc(face: Face, parameters: ^Open_Args) -> Error  ---
    @(link_name="FT_Reference_Face") Reference_Face :: proc(face: Face) -> Error  ---
    @(link_name="FT_Done_Face") Done_Face :: proc(face: Face) -> Error  ---
    @(link_name="FT_Select_Size") Select_Size :: proc(face: Face, strike_index: c.int) -> Error  ---
    @(link_name="FT_Request_Size") Request_Size :: proc(face: Face, req: Size_Request) -> Error  ---
    @(link_name="FT_Set_Char_Size") Set_Char_Size :: proc(face: Face, char_width: F26Dot6, char_height: F26Dot6, horz_resolution: c.uint, vert_resolution: c.uint) -> Error  ---
    @(link_name="FT_Set_Pixel_Sizes") Set_Pixel_Sizes :: proc(face: Face, pixel_width: c.uint, pixel_height: c.uint) -> Error  ---
    @(link_name="FT_Load_Glyph") Load_Glyph :: proc(face: Face, glyph_index: c.uint, load_flags: c.int32_t) -> Error  ---
    @(link_name="FT_Load_Char") Load_Char :: proc(face: Face, char_code: c.ulong, load_flags: c.int32_t) -> Error  ---
    @(link_name="FT_Set_Transform") Set_Transform :: proc(face: Face, mat: ^Matrix, delta: ^Vector)  ---
    @(link_name="FT_Get_Transform") Get_Transform :: proc(face: Face, mat: ^Matrix, delta: ^Vector)  ---
    @(link_name="FT_Render_Glyph") Render_Glyph :: proc(slot: GlyphSlot, render_mode: Render_Mode) -> Error  ---
    @(link_name="FT_Get_Kerning") Get_Kerning :: proc(face: Face, left_glyph: c.uint, right_glyph: c.uint, kern_mode: c.uint, akerning: ^Vector) -> Error  ---
    @(link_name="FT_Get_Track_Kerning") Get_Track_Kerning :: proc(face: Face, point_size: Fixed, degree: c.int, akerning: ^Fixed) -> Error  ---
    @(link_name="FT_Select_Charmap") Select_Charmap :: proc(face: Face, encoding: Encoding) -> Error  ---
    @(link_name="FT_Set_Charmap") Set_Charmap :: proc(face: Face, charmap: CharMap) -> Error  ---
    @(link_name="FT_Get_Charmap_Index") Get_Charmap_Index :: proc(charmap: CharMap) -> c.int  ---
    @(link_name="FT_Get_Char_Index") Get_Char_Index :: proc(face: Face, charcode: c.ulong) -> c.uint  ---
    @(link_name="FT_Get_First_Char") Get_First_Char :: proc(face: Face, agindex: ^c.uint) -> c.ulong  ---
    @(link_name="FT_Get_Next_Char") Get_Next_Char :: proc(face: Face, char_code: c.ulong, agindex: ^c.uint) -> c.ulong  ---
    @(link_name="FT_Face_Properties") Face_Properties :: proc(face: Face, num_properties: c.uint, properties: ^Parameter) -> Error  ---
    @(link_name="FT_Get_Name_Index") Get_Name_Index :: proc(face: Face, glyph_name: cstring) -> c.uint  ---
    @(link_name="FT_Get_Glyph_Name") Get_Glyph_Name :: proc(face: Face, glyph_index: c.uint, buffer: rawptr, buffer_max: c.uint) -> Error  ---
    @(link_name="FT_Get_Postscript_Name") Get_Postscript_Name :: proc(face: Face) -> cstring  ---
    @(link_name="FT_Get_SubGlyph_Info") Get_SubGlyph_Info :: proc(glyph: GlyphSlot, sub_index: c.uint, p_index: ^c.int, p_flags: ^c.uint, p_arg1: ^c.int, p_arg2: ^c.int, p_transform: ^Matrix) -> Error  ---
    @(link_name="FT_Get_FSType_Flags") Get_FSType_Flags :: proc(face: Face) -> c.ushort  ---
    @(link_name="FT_Face_GetCharVariantIndex") Face_GetCharVariantIndex :: proc(face: Face, charcode: c.ulong, variantSelector: c.ulong) -> c.uint  ---
    @(link_name="FT_Face_GetCharVariantIsDefault") Face_GetCharVariantIsDefault :: proc(face: Face, charcode: c.ulong, variantSelector: c.ulong) -> c.int  ---
    @(link_name="FT_Face_GetVariantSelectors") Face_GetVariantSelectors :: proc(face: Face) -> ^c.uint32_t  ---
    @(link_name="FT_Face_GetVariantsOfChar") Face_GetVariantsOfChar :: proc(face: Face, charcode: c.ulong) -> ^c.uint32_t  ---
    @(link_name="FT_Face_GetCharsOfVariant") Face_GetCharsOfVariant :: proc(face: Face, variantSelector: c.ulong) -> ^c.uint32_t  ---
    @(link_name="FT_MulDiv") MulDiv :: proc(a: c.long, b: c.long, _c: c.long) -> c.long  ---
    @(link_name="FT_MulFix") MulFix :: proc(a: c.long, b: c.long) -> c.long  ---
    @(link_name="FT_DivFix") DivFix :: proc(a: c.long, b: c.long) -> c.long  ---
    @(link_name="FT_RoundFix") RoundFix :: proc(a: Fixed) -> Fixed  ---
    @(link_name="FT_CeilFix") CeilFix :: proc(a: Fixed) -> Fixed  ---
    @(link_name="FT_FloorFix") FloorFix :: proc(a: Fixed) -> Fixed  ---
    @(link_name="FT_Vector_Transform") Vector_Transform :: proc(vector: ^Vector, mat: ^Matrix)  ---
    @(link_name="FT_Library_Version") Library_Version :: proc(library: Library, amajor: ^c.int, aminor: ^c.int, apatch: ^c.int)  ---
    @(link_name="FT_Face_CheckTrueTypePatents") Face_CheckTrueTypePatents :: proc(face: Face) -> c.bool  ---
    @(link_name="FT_Face_SetUnpatentedHinting") Face_SetUnpatentedHinting :: proc(face: Face, value: c.bool) -> c.bool  ---

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
//TODO: Size_Request :: ^Size_RequestRec_
Size_Request :: rawptr
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

Encoding :: enum c.uint32_t {
    NONE = 0,
    MS_SYMBOL = c.uint32_t('s') << 24 | c.uint32_t('y') << 16 | c.uint32_t('m') << 8 | c.uint32_t('b') << 0,
    UNICODE = c.uint32_t('u') << 24 | c.uint32_t('n') << 16 | c.uint32_t('i') << 8 | c.uint32_t('c') << 0,
    // TODO: add more encodings
}

Render_Mode:: enum {
    NORMAL = 0,
    LIGHT,
    MONO,
    LCD,
    LCD_V,
    SDF,

    MAX
}

Pos :: c.long;
Fixed :: c.long;
F26Dot6 :: c.long;

Parameter:: struct {
    tag: c.ulong,
    data: rawptr,
}

Vector:: struct {
    x, y: Pos
}

Matrix:: struct {
    xx, xy, yx, yy: Fixed
}

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

Open_Args:: struct {
    flags: c.uint,
    memory_base: ^byte,
    memory_size: c.long,
    pathname: cstring,
    stream: Stream,
    driver: Module,
    num_params: c.int,
    params: ^Parameter,
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

