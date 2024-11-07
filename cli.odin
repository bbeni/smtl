package smtl

import "core:fmt"
import "core:os"
import "core:strings"

usage :: proc(program_name: string) {
    fmt.println("Usage: %s font-file.ttf [-o char-map.png]")
}

descr :: proc() {
    fmt.println("  Show Me Those Letters (smtl) is used to get insights into font files.")
    fmt.println("")
    fmt.println("  -o  If provided, create an image with all characters in font file")
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
    } else {
        // parse -o ..
        next_arg := shift(&args)
        if next_arg == "-o" {
            if len(args) == 0 {
                usage(program_name)
                fmt.println("Error: no png after -o specified")
                os.exit(1)
            }
            out_file := shift(&args)
            font_create_map(ttf_file_content, out_file)
        } else {
            usage(program_name)
            fmt.println("Error: expected -o")
        }
    }

}
