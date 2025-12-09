# c67game

A simple game library for [C67](https://github.com/xyproto/c67), wrapping SDL3.

## Installation

**SDL3 is required.** Install it for your platform:

```bash
# Linux
sudo apt install libsdl3-dev  # Ubuntu/Debian
sudo pacman -S sdl3           # Arch

# macOS
brew install sdl3

# Windows
# Download SDL3.dll from https://github.com/libsdl-org/SDL/releases
# Place in your game directory
```

## Usage

```c67
import github.com/xyproto/c67game

main = {
    Init_window("My Game", 800, 600)
    
    @ Running() {
        Poll_events()
        Clear_screen(0x1E1E2E)
        Fill_rect(100, 100, 50, 50, 0xFF0000)
        Present()
        Delay(16)
    }
}
```

## API

**Initialization:**
- `Init_window(title, width, height)` - Initialize window/renderer
- `Running()` - Check if game is running

**Drawing:**
- `Clear_screen(color)` - Clear with color (0xRRGGBB)
- `Fill_rect(x, y, w, h, color)` - Draw filled rectangle
- `Draw_rect(x, y, w, h, color)` - Draw rectangle outline
- `Draw_line(x1, y1, x2, y2, color)` - Draw line
- `Present()` - Present frame

**Input (Keyboard + Gamepad):**
- `Input_up()` - Up/W/D-pad up
- `Input_down()` - Down/S/D-pad down
- `Input_left()` - Left/A/D-pad left
- `Input_right()` - Right/D/D-pad right
- `Input_action1()` - Space/A button
- `Input_action2()` - Shift/B button

**Window:**
- `Is_fullscreen()` - Check fullscreen state
- `Toggle_fullscreen()` - Toggle fullscreen

**Timing:**
- `Delay(ms)` - Delay milliseconds

## Testing

```bash
c67 test
```

## License

BSD-3
