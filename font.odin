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

    fmt.println(face)

}

font_create_map :: proc(ttf_file_content: []u8, out_file: string) {
    fmt.println("TODO: implement font_create_map")
}
