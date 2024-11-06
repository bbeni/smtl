package smtl

import    "core:os"
import    "core:fmt"
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
    fmt.printfln("units_per_EM:        %d", face.units_per_EM);
    fmt.printfln("ascender:            %d", face.ascender);
    fmt.printfln("descender:           %d", face.descender);
    fmt.printfln("underline_position:  %d", face.underline_position);
    fmt.printfln("underline_thickness: %d", face.underline_thickness);
    fmt.println("")
}

font_create_map :: proc(ttf_file_content: []u8, out_file: string) {
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



    fmt.println(face)
}
