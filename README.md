# TailwindPalette
TailwindPalette.swift provides easy access to the [TailwindCSS colours](https://tailwindcss.com/docs/customizing-colors#color-palette-reference) in Swift.

## Installation
Just drag TailwindPalette.swift into your Xcode project.

## Limitations
Colours are only defined for UIColor at the moment, not NSColor, so some modification may be required if you're building for macOS.

## Usage
### Simple
This is similar to using the `.text-indigo-900` class in TailwindCSS:
```swift
label.textColor = TailwindPalette.indigo._900
```
You can assign it to anything accepting a UIColor.

### Dark Mode
Using a dynamic UIColor, this label's text will be `amber._700` in light mode and `amber._200` in dark mode.
```swift
label.textColor = TailwindPalette.amber.dynamic(light: \._700, dark: \._200)
```

### Advanced Usage
Much like with `tailwind.config.js`, TailwindPalette encourages you to build your own palette for your app. You could write something like this:

```swift
enum Theme {
    static let primary = TailwindPalette.lime
    static let gray = TailwindPalette.blueGray
    
    enum Colors {
        static let background = gray.dynamic(light: \._100, dark: \._900)
        static let primaryButton = primary.dynamic(light: \._600, dark: \._500)
    }
}

// In your View Controller:
func viewDidLoad() {
    view.backgroundColor = Theme.Colors.background
    mainButton.backgroundColor = Theme.Colors.primaryButton
}
```

With this architecture, it would be incredibly easy to switch out your app's theme colour: just change `TailwindPalette.lime` into `TailwindPalette.pink`, for example.

### Hate Underscores?
Understandable. If you also hate type safety, you can access the colors with subscripting:
```swift
label1.textColor = TailwindPalette.indigo[900]
label2.textColor = TailwindPalette.indigo.dynamic(light: 900, dark: 100)
```
