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

