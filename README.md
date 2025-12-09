# c67game

A simple, beginner-friendly game library for [C67](https://github.com/xyproto/c67), wrapping SDL3.

Inspired by pygame and ebiten, this library provides an easy-to-use API for creating 2D games without needing to know SDL3.

## Features

- Simple window and renderer initialization
- Easy drawing functions (rectangles, lines, points)
- Event handling helpers
- Color support with hex notation (0xRRGGBB)
- All functions exported to global namespace (`export *`)
- Meaningful return values (SDL bool results)

## Installation

### Prerequisites

**SDL3 is required**. Install it for your platform:

**Linux:**
```bash
# Ubuntu/Debian
sudo apt install libsdl3-dev

# Arch
sudo pacman -S sdl3

# Or build from source
git clone https://github.com/libsdl-org/SDL
cd SDL
cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build
sudo cmake --install build
```

**macOS:**
```bash
brew install sdl3
```

**Windows:**
- Download SDL3 from https://github.com/libsdl-org/SDL/releases
- Place SDL3.dll in your game's directory (or system PATH)
- Place SDL3 headers in your include path

### Using c67game

**Git clone:**
```bash
cd ~/clones
git clone https://github.com/xyproto/c67game
```

**Import in your game:**
```c67
import "game.c67"  // If in same directory
// or
import "path/to/c67game/game.c67"
```

## Usage

```c67
import github.com/xyproto/c67game as game

main = {
    game.Init_window("My Game", 800, 600)

    game.Clear_screen(0x1E1E2E)
    game.Fill_rect(100, 100, 50, 50, 0xFF0000)
    game.Present()
    game.Delay(2000)

    0
}
```

With `export *` in c67game (which it has), you can skip the `game.` prefix:

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
    
    0
}
```

## API Reference

### Initialization

- `Init_window(title, width, height)` - Initialize SDL3 and create window/renderer
- `Running()` - Check if game is still running

### Drawing

- `Clear_screen(color)` - Clear screen with color (0xRRGGBB)
- `Fill_rect(x, y, w, h, color)` - Draw filled rectangle
- `Draw_rect(x, y, w, h, color)` - Draw rectangle outline  
- `Draw_line(x1, y1, x2, y2, color)` - Draw line
- `Present()` - Present rendered frame

### Events & Input

- `Poll_events()` - Process SDL events and update input state, returns bool if event available

**Unified Input (Keyboard + Gamepad):**
- `Input_up()` - Up arrow / W / D-pad up
- `Input_down()` - Down arrow / S / D-pad down
- `Input_left()` - Left arrow / A / D-pad left
- `Input_right()` - Right arrow / D / D-pad right
- `Input_action1()` - Space / Gamepad A button
- `Input_action2()` - Left Shift / Gamepad B button

### Window Management

- `Is_fullscreen()` - Returns true if window is in fullscreen mode
- `Toggle_fullscreen()` - Toggle between fullscreen and windowed mode

### Timing

- `Delay(ms)` - Delay execution for milliseconds

## Example Game

```c67
import "game.c67"

main = {
    Init_window("My Game", 800, 600)
    
    player_x := 400
    player_y := 300
    
    @ Running() max inf {
        Poll_events()
        
        // Handle input
        Input_left()  { player_x <- player_x - 5 }
        Input_right() { player_x <- player_x + 5 }
        Input_up()    { player_y <- player_y - 5 }
        Input_down()  { player_y <- player_y + 5 }
        
        // Toggle fullscreen with action1 (Space/A-button)
        Input_action1() {
            Toggle_fullscreen()
            Delay(200)  // Debounce
        }
        
        // Draw
        Clear_screen(0x000000)
        Fill_rect(player_x, player_y, 32, 32, 0xFF0000)
        Present()
        Delay(16)  // ~60 FPS
    }
}
```

## Testing

Run the c67game tests:
```bash
cd ~/clones/c67game
c67 test
```

Or with verbose output:
```bash
c67 test -v
```

Compiler integration tests are in the [c67 repository](https://github.com/xyproto/c67):
```bash
cd ~/clones/c67
go test -run TestC67Game
```

## License

BSD-3
