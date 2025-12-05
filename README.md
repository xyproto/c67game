# c67game

A simple, beginner-friendly game library for [C67](https://github.com/xyproto/c67), wrapping SDL3.

Inspired by pygame and ebiten, this library provides an easy-to-use API for creating 2D games without needing to know SDL3.

## Features

- Simple window and renderer initialization
- Easy drawing functions (rectangles, lines, points)
- Event handling helpers
- Color support with hex notation (0xRRGGBB)
- All functions exported to global namespace (`export *`)

## Usage

```c67
import github.com/xyproto/c67game

main = () -> {
    [window, renderer] = init("My Game", 800, 600)
    
    clear_screen(renderer, 0x1E1E2E)
    draw_rect(renderer, 100, 100, 50, 50, 0xFF0000)
    present(renderer)
    delay(2000)
    
    quit()
    0
}
```

## Testing

```bash
make test        # Run basic visual test
make test_bounce # Build bouncing ball demo
```

## License

BSD-3
