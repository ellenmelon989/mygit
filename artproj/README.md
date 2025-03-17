# Image Processing with Processing

## Description
This Processing sketch performs various image manipulations including grayscale conversion, edge detection, mirroring, and repetition along the x and y axes. The program allows users to interactively modify an image by pressing specific keys.

## Features
- **Load an Image:** Automatically loads "*filename*.jpg" at startup.
- **Grayscale Conversion:** Converts the image to grayscale.
- **Edge Detection:** Applies an edge-detection filter.
- **Mirroring:** Reflects the image either horizontally or vertically.
- **Repetition:** Repeats the image along the x or y axis.
- **Interactive Controls:** Modify the image using keyboard input.

## Controls
- `r`: Reset image.
- `e`: Apply edge detection.
- `g`: Toggle grayscale mode.
- `m`: Apply mirroring effect.
- `l`: Repeat the image along the x-axis.
- `k`: Repeat the image along the y-axis.

## Setup Instructions
1. Install [Processing](https://processing.org/).
2. Place the images in the same directory as the script and modify script to use correct filenames.
3. Run the script in Processing.
4. Use the keyboard controls to manipulate the image in real-time.

## Functions Overview
- `gray(PImage img)`: Converts an image to grayscale.
- `edge(PImage img)`: Applies edge detection using a kernel.
- `mirror(PImage img)`: Mirrors the image horizontally or vertically.
- `repeatx(PImage img)`: Repeats the image along the x-axis.
- `repeaty(PImage img)`: Repeats the image along the y-axis.

## Notes
- Ensure the images exist in the project directory to avoid errors.
- The image may take a bit to load.
- The mirroring function toggles between horizontal and vertical mirroring.