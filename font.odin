package smtl

import    "core:os"
import    "core:fmt"
import    "core:strings"
import    "vendor:stb/image"

import ft "thirdparty/freetype"

font_print_info :: proc(ttf_file_content: []u8) {
    library: ft.Library
    face: ft.Face

    err := ft.Init_FreeType(&library)
    if err != ft.Error.Ok {
        fmt.printfln("Error: from freetype of type `%s`, %s", err, ft.error_string(err))
        os.exit(1)
    }

    err = ft.New_Memory_Face(library, raw_data(ttf_file_content), cast(i64)(len(ttf_file_content)), 0, &face)
    if err != ft.Error.Ok {
        fmt.printfln("Error: from freetype of type `%s`, %s", err, ft.error_string(err))
        os.exit(1)
    }

    fmt.printfln("================================")
    fmt.printfln("#        Font Summary          #")
    fmt.printfln("================================")

    fmt.printfln("family_name:         %s", face.family_name);
    fmt.printfln("style_name:          %s", face.style_name);
    fmt.printfln("num_faces:           %d", face.num_faces);
    fmt.printfln("num_glyphs:          %d", face.num_glyphs);
    fmt.printfln("num_charmaps:        %d", face.num_charmaps);
    fmt.printfln("num_fixed_sizes:     %d", face.num_fixed_sizes);
    fmt.printfln("units_per_EM:        %d", face.units_per_EM);
    fmt.printfln("ascender:            %d", face.ascender);
    fmt.printfln("descender:           %d", face.descender);
    fmt.printfln("underline_position:  %d", face.underline_position);
    fmt.printfln("underline_thickness: %d", face.underline_thickness);
    fmt.println("")
}

check_or_fail :: proc(err: ft.Error) {
    if err != ft.Error.Ok {
        fmt.printfln("Error: from freetype of type `%s`, %s", err, ft.error_string(err))
        os.exit(1)
    }
}

font_create_map :: proc(ttf_file_content: []u8, out_file: string) {
    library: ft.Library
    face: ft.Face

    err := ft.Init_FreeType(&library)
    check_or_fail(err)

    err = ft.New_Memory_Face(library, raw_data(ttf_file_content), cast(i64)(len(ttf_file_content)), 0, &face)
    check_or_fail(err)

    char_height: i64 = 32*64 // in 1/64 points (note: 1 point=1/72 inch)
    dpi: u32         = 300
    err = ft.Set_Char_Size(face, 0, char_height, dpi, dpi)
    check_or_fail(err)


    img: Image
    init_image(&img)
    pen_x: i32 = 100
    pen_y: i32 = 100

    for i: u32 = 0; i < cast(u32)face.num_glyphs; i += 1 {
        err = ft.Load_Glyph(face, i, 0) // TODO: make ft.Load.DEFAULT etc usable
        check_or_fail(err)
        err = ft.Render_Glyph(face.glyph, ft.Render_Mode.NORMAL)
        check_or_fail(err)
        if pen_x + i32(face.glyph.bitmap.width) + 100 >= img.w {
            pen_y += 140 // TODO: make dynamic
            pen_x = 100
        }
        draw_bitmap(&img, &face.glyph.bitmap, pen_x + face.glyph.bitmap_left, pen_y - face.glyph.bitmap_top)
        pen_x += i32(face.glyph.advance.x >> 6) + 10
    }

    save_image(&img, out_file)
}

Image :: struct {
    w: i32,
    h: i32,
    data: []u8,
    comp: i32,
}

init_image :: proc(using img: ^Image) {
    w = 2800 // TODO: adapt to amount of chars and size
    h = 5800
    comp = 3
    data = make([]u8, w * h * comp)
}

save_image :: proc(using img: ^Image, out_file: string) {
    image.write_png(strings.clone_to_cstring(out_file), w, h, comp, raw_data(data), w * comp)
}

draw_bitmap :: proc(img: ^Image, bm: ^ft.Bitmap, left, top: i32) {
    assert(left >= 0)
    assert(top >= 0)
    xa: u32 = cast(u32)left
    ya: u32 = cast(u32)top
    for i: u32 = 0; i < bm.width; i += 1 {
        for j: u32 = 0; j < bm.rows; j += 1 {
            src_index := j*cast(u32)bm.width + i
            dst_index := ((j + ya)*cast(u32)img.w + i + cast(u32)xa)*3
            for comp in 0..<img.comp {
                img.data[dst_index + cast(u32)comp] = bm.buffer[src_index]
            }
        }
    }
}
