package smtl

import sdl "vendor:sdl2"
import "core:fmt"
import "core:time"
import "core:math"


font_viewer :: proc(img: ^Image) -> bool {

    if sdl.Init(sdl.INIT_VIDEO) < 0 {
        fmt.println("Error: failed to initialize the SDL2 library")
        return false
    }

    window := sdl.CreateWindow("Font Viewer", sdl.WINDOWPOS_CENTERED, sdl.WINDOWPOS_CENTERED, 1600, 980, sdl.WINDOW_SHOWN)
    if window == nil {
        fmt.println("Error: failed to create window")
        return false
    }

    window_surface := sdl.GetWindowSurface(window)
    if window_surface == nil {
        fmt.println("Error: failed to get the surface from the window")
        return false
    }

    draw :: proc(surf: ^sdl.Surface, img: ^Image, pos_x, pos_y: i32) {
        assert(img.comp == 3)
        for j in 0..<surf.h {
            for i in 0..<surf.w {
                dst_index := j*surf.w + i
                src_index := 3*((j+pos_y)*img.w + i + pos_x)
                if src_index < 0 || src_index > img.w * img.h * 3 do continue
                r := img.data[src_index]
                g := img.data[src_index+1]
                b := img.data[src_index+2]
                color := sdl.MapRGBA(surf.format, r, g, b, 255)
                buf := cast([^]u32)surf.pixels
                buf[dst_index] = color
            }
        }
    }

    move_toward :: proc(target, current, speed_up, speed_down, dt: f32) -> f32 {
        cur := current
        if cur < target {
            cur += dt * speed_up
            if cur > target do cur = target
        }
        if cur > target {
            cur -= dt * speed_down
            if cur < target do cur = target
        }
        return cur
    }

    pos_x, pos_y: f32 = 0, 0
    pan_speed_x, pan_speed_y: f32 = 0, 0
    max_speed: f32: 900

    // high precision timer
    start_tick := time.tick_now()

    last_t: f32 = 0;
    loop: for {
	duration := time.tick_since(start_tick)
	t := f32(time.duration_seconds(duration))
        delta_t := t - last_t
        last_t = t

	// event polling
	event: sdl.Event
	for sdl.PollEvent(&event) {
	    #partial switch event.type {
 		case .KEYDOWN:
		#partial switch event.key.keysym.sym {
		    case .ESCAPE:
		    break loop
                }
		case .QUIT:
		break loop
	    }
	}

        // pan input
        tvx, tvy: f32 = 0, 0
        keystate := sdl.GetKeyboardState(nil);
        if keystate[sdl.Scancode.LEFT] > 0 do tvx -= 1
        if keystate[sdl.Scancode.RIGHT] > 0 do tvx += 1
        if keystate[sdl.Scancode.UP] > 0 do tvy -= 1
        if keystate[sdl.Scancode.DOWN] > 0 do tvy += 1

        if !(tvx == 0 && tvy == 0) {
            l := math.sqrt(tvx*tvx + tvy*tvy)
            tvx = tvx/l * max_speed
            tvy = tvy/l * max_speed
        }

        pan_speed_x = move_toward(tvx, pan_speed_x, 2500, 2800, delta_t)
        pan_speed_y = move_toward(tvy, pan_speed_y, 2500, 2800, delta_t)

        pos_x += pan_speed_x * delta_t
        pos_y += pan_speed_y * delta_t


        draw(window_surface, img, cast(i32)pos_x, cast(i32)pos_y)

        sdl.UpdateWindowSurface(window)
        sdl.Delay(1)

    }

    sdl.FreeSurface(window_surface)
    window_surface = nil
    sdl.DestroyWindow(window)
    window = nil
    sdl.Quit()
    return true
}
