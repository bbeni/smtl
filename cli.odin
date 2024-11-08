package smtl

import "core:fmt"
import "core:os"
import "core:strings"

usage :: proc(program_name: string) {
    fmt.printfln("Usage: %s font-file.ttf [show|-o char-map.png]", program_name)
}

descr :: proc() {
    fmt.println("  Show Me Those Letters (smtl) is used to get insights into font files.")
    fmt.println("")
    fmt.println("        Without arguments it shows some useful infos about the font.")
    fmt.println("  -o    If provided, create an image with all glyphs of the font file.")
    fmt.println("  show  Show all glyphs in a window. Pan with arrow keys.")
}

main :: proc() {

    args := os.args[:]
    shift :: proc(args: ^[]string) -> (res: string) {
        res = args[0]
        args^ = args[1:]
        return
    }

    program_name := shift(&args)

    if len(args) == 0 {
        usage(program_name)
        fmt.println("Error: not font file provided")
        descr()
        os.exit(1)
    }


    in_file_name := shift(&args)
    if !strings.ends_with(in_file_name, ".ttf") {
        // TODO: support other formats
        usage(program_name)
        fmt.println("Error: font file does not end with .ttf")
        os.exit(1)
    }

    ttf_file_content, success := os.read_entire_file_from_filename(in_file_name)
    if !success {
        fmt.printfln("Error: can not open the specified file_name `%s`", in_file_name)
        os.exit(1)
    }

    if len(args) == 0 {
        // just print infos
        font_print_info(ttf_file_content)
        return
    }

    next_arg := shift(&args)
    if next_arg == "-o" {
        if len(args) == 0 {
            usage(program_name)
            fmt.println("Error: no png after -o specified")
            os.exit(1)
        }
        out_file := shift(&args)
        font_create_map(ttf_file_content, out_file)
    } else if next_arg == "show" {
        font_show_map(ttf_file_content)
    } else {
        usage(program_name)
        fmt.println("Error: expected -o")
    }
}
