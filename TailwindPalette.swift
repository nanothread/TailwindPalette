//
//  TailwindPalette.swift
//  WordsToRemember
//
//  Created by Andrew Glen on 04/04/2021.
//
//  Ported from https://github.com/tailwindlabs/tailwindcss/blob/master/colors.js
//  Colours from https://tailwindcss.com/docs/customizing-colors#color-palette-reference
//


import UIKit

/// A hue contains multiple shades of the same colour, where `_50` is the lightest
/// and `_900` is the darkest.
///
/// You can access a colour safely by directly accessing the member variables
/// (e.g. `myHue._500`) or unsafely via subscripting (e.g. `myHue[500]`).
///
/// To support dark mode, you can generate a dynamic colour, e.g.
///
/// ```
/// label.textColor = myHue.dynamic(light: \._700, dark: \._300)
/// ```
///
/// In this case, the label colour will be the 700 shade in light mode and
/// the 300 shade in dark mode.
struct Hue {
    var _50 : UIColor
    var _100: UIColor
    var _200: UIColor
    var _300: UIColor
    var _400: UIColor
    var _500: UIColor
    var _600: UIColor
    var _700: UIColor
    var _800: UIColor
    var _900: UIColor
    
    func dynamic(light: KeyPath<Self, UIColor>, dark: KeyPath<Self, UIColor>) -> UIColor {
        UIColor { trait in
            trait.userInterfaceStyle == .dark ? self[keyPath: dark] : self[keyPath: light]
        }
    }
    
    func dynamic(light: Int, dark: Int) -> UIColor {
        UIColor { trait in
            trait.userInterfaceStyle == .dark ? self[dark] : self[light]
        }
    }
    
    subscript(_ shade: Int) -> UIColor {
        switch shade {
        case 50: return _50
        case 100: return _100
        case 200: return _200
        case 300: return _300
        case 400: return _400
        case 500: return _500
        case 600: return _600
        case 700: return _700
        case 800: return _800
        case 900: return _900
        
        default:
            fatalError("Invalid shade \(shade) for hue. Must be one of: [50,100,200,300,400,500,600,700,800,900]")
        }
    }
}

/// A namespace containing predefined hues from the TailwindCSS framework.
/// You can see what the colours look like
/// [here](https://tailwindcss.com/docs/customizing-colors#color-palette-reference).
///
/// You can access colours like:
/// ```
/// label1.textColor = TailwindPalette.indigo._900
/// label2.textColor = TailwindPalette.amber.dynamic(light: \._800, dark: \._200)
/// ```
enum TailwindPalette {
    static let amber = Hue(
        _50 : "#FFFBEB".color(),
        _100: "#FEF3C7".color(),
        _200: "#FDE68A".color(),
        _300: "#FCD34D".color(),
        _400: "#FBBF24".color(),
        _500: "#F59E0B".color(),
        _600: "#D97706".color(),
        _700: "#B45309".color(),
        _800: "#92400E".color(),
        _900: "#78350F".color()
     )

    static let lightBlue = Hue(
        _50 : "#F0F9FF".color(),
        _100: "#E0F2FE".color(),
        _200: "#BAE6FD".color(),
        _300: "#7DD3FC".color(),
        _400: "#38BDF8".color(),
        _500: "#0EA5E9".color(),
        _600: "#0284C7".color(),
        _700: "#0369A1".color(),
        _800: "#075985".color(),
        _900: "#0C4A6E".color()
     )

    static let indigo = Hue(
        _50 : "#EEF2FF".color(),
        _100: "#E0E7FF".color(),
        _200: "#C7D2FE".color(),
        _300: "#A5B4FC".color(),
        _400: "#818CF8".color(),
        _500: "#6366F1".color(),
        _600: "#4F46E5".color(),
        _700: "#4338CA".color(),
        _800: "#3730A3".color(),
        _900: "#312E81".color()
     )

    static let warmGray = Hue(
        _50 : "#FAFAF9".color(),
        _100: "#F5F5F4".color(),
        _200: "#E7E5E4".color(),
        _300: "#D6D3D1".color(),
        _400: "#A8A29E".color(),
        _500: "#78716C".color(),
        _600: "#57534E".color(),
        _700: "#44403C".color(),
        _800: "#292524".color(),
        _900: "#1C1917".color()
     )

    static let violet = Hue(
        _50 : "#F5F3FF".color(),
        _100: "#EDE9FE".color(),
        _200: "#DDD6FE".color(),
        _300: "#C4B5FD".color(),
        _400: "#A78BFA".color(),
        _500: "#8B5CF6".color(),
        _600: "#7C3AED".color(),
        _700: "#6D28D9".color(),
        _800: "#5B21B6".color(),
        _900: "#4C1D95".color()
     )

    static let yellow = Hue(
        _50 : "#FEFCE8".color(),
        _100: "#FEF9C3".color(),
        _200: "#FEF08A".color(),
        _300: "#FDE047".color(),
        _400: "#FACC15".color(),
        _500: "#EAB308".color(),
        _600: "#CA8A04".color(),
        _700: "#A16207".color(),
        _800: "#854D0E".color(),
        _900: "#713F12".color()
     )

    static let blueGray = Hue(
        _50 : "#F8FAFC".color(),
        _100: "#F1F5F9".color(),
        _200: "#E2E8F0".color(),
        _300: "#CBD5E1".color(),
        _400: "#94A3B8".color(),
        _500: "#64748B".color(),
        _600: "#475569".color(),
        _700: "#334155".color(),
        _800: "#1E293B".color(),
        _900: "#0F172A".color()
     )

    static let lime = Hue(
        _50 : "#F7FEE7".color(),
        _100: "#ECFCCB".color(),
        _200: "#D9F99D".color(),
        _300: "#BEF264".color(),
        _400: "#A3E635".color(),
        _500: "#84CC16".color(),
        _600: "#65A30D".color(),
        _700: "#4D7C0F".color(),
        _800: "#3F6212".color(),
        _900: "#365314".color()
     )

    static let blue = Hue(
        _50 : "#EFF6FF".color(),
        _100: "#DBEAFE".color(),
        _200: "#BFDBFE".color(),
        _300: "#93C5FD".color(),
        _400: "#60A5FA".color(),
        _500: "#3B82F6".color(),
        _600: "#2563EB".color(),
        _700: "#1D4ED8".color(),
        _800: "#1E40AF".color(),
        _900: "#1E3A8A".color()
     )

    static let purple = Hue(
        _50 : "#FAF5FF".color(),
        _100: "#F3E8FF".color(),
        _200: "#E9D5FF".color(),
        _300: "#D8B4FE".color(),
        _400: "#C084FC".color(),
        _500: "#A855F7".color(),
        _600: "#9333EA".color(),
        _700: "#7E22CE".color(),
        _800: "#6B21A8".color(),
        _900: "#581C87".color()
     )

    static let rose = Hue(
        _50 : "#FFF1F2".color(),
        _100: "#FFE4E6".color(),
        _200: "#FECDD3".color(),
        _300: "#FDA4AF".color(),
        _400: "#FB7185".color(),
        _500: "#F43F5E".color(),
        _600: "#E11D48".color(),
        _700: "#BE123C".color(),
        _800: "#9F1239".color(),
        _900: "#881337".color()
     )

    static let fuchsia = Hue(
        _50 : "#FDF4FF".color(),
        _100: "#FAE8FF".color(),
        _200: "#F5D0FE".color(),
        _300: "#F0ABFC".color(),
        _400: "#E879F9".color(),
        _500: "#D946EF".color(),
        _600: "#C026D3".color(),
        _700: "#A21CAF".color(),
        _800: "#86198F".color(),
        _900: "#701A75".color()
     )

    static let orange = Hue(
        _50 : "#FFF7ED".color(),
        _100: "#FFEDD5".color(),
        _200: "#FED7AA".color(),
        _300: "#FDBA74".color(),
        _400: "#FB923C".color(),
        _500: "#F97316".color(),
        _600: "#EA580C".color(),
        _700: "#C2410C".color(),
        _800: "#9A3412".color(),
        _900: "#7C2D12".color()
     )

    static let red = Hue(
        _50 : "#FEF2F2".color(),
        _100: "#FEE2E2".color(),
        _200: "#FECACA".color(),
        _300: "#FCA5A5".color(),
        _400: "#F87171".color(),
        _500: "#EF4444".color(),
        _600: "#DC2626".color(),
        _700: "#B91C1C".color(),
        _800: "#991B1B".color(),
        _900: "#7F1D1D".color()
     )

    static let pink = Hue(
        _50 : "#FDF2F8".color(),
        _100: "#FCE7F3".color(),
        _200: "#FBCFE8".color(),
        _300: "#F9A8D4".color(),
        _400: "#F472B6".color(),
        _500: "#EC4899".color(),
        _600: "#DB2777".color(),
        _700: "#BE185D".color(),
        _800: "#9D174D".color(),
        _900: "#831843".color()
     )

    static let trueGray = Hue(
        _50 : "#FAFAFA".color(),
        _100: "#F5F5F5".color(),
        _200: "#E5E5E5".color(),
        _300: "#D4D4D4".color(),
        _400: "#A3A3A3".color(),
        _500: "#737373".color(),
        _600: "#525252".color(),
        _700: "#404040".color(),
        _800: "#262626".color(),
        _900: "#171717".color()
     )

    static let emerald = Hue(
        _50 : "#ECFDF5".color(),
        _100: "#D1FAE5".color(),
        _200: "#A7F3D0".color(),
        _300: "#6EE7B7".color(),
        _400: "#34D399".color(),
        _500: "#10B981".color(),
        _600: "#059669".color(),
        _700: "#047857".color(),
        _800: "#065F46".color(),
        _900: "#064E3B".color()
     )

    static let cyan = Hue(
        _50 : "#ECFEFF".color(),
        _100: "#CFFAFE".color(),
        _200: "#A5F3FC".color(),
        _300: "#67E8F9".color(),
        _400: "#22D3EE".color(),
        _500: "#06B6D4".color(),
        _600: "#0891B2".color(),
        _700: "#0E7490".color(),
        _800: "#155E75".color(),
        _900: "#164E63".color()
     )

    static let gray = Hue(
        _50 : "#FAFAFA".color(),
        _100: "#F4F4F5".color(),
        _200: "#E4E4E7".color(),
        _300: "#D4D4D8".color(),
        _400: "#A1A1AA".color(),
        _500: "#71717A".color(),
        _600: "#52525B".color(),
        _700: "#3F3F46".color(),
        _800: "#27272A".color(),
        _900: "#18181B".color()
     )

    static let coolGray = Hue(
        _50 : "#F9FAFB".color(),
        _100: "#F3F4F6".color(),
        _200: "#E5E7EB".color(),
        _300: "#D1D5DB".color(),
        _400: "#9CA3AF".color(),
        _500: "#6B7280".color(),
        _600: "#4B5563".color(),
        _700: "#374151".color(),
        _800: "#1F2937".color(),
        _900: "#111827".color()
     )

    static let green = Hue(
        _50 : "#F0FDF4".color(),
        _100: "#DCFCE7".color(),
        _200: "#BBF7D0".color(),
        _300: "#86EFAC".color(),
        _400: "#4ADE80".color(),
        _500: "#22C55E".color(),
        _600: "#16A34A".color(),
        _700: "#15803D".color(),
        _800: "#166534".color(),
        _900: "#14532D".color()
     )

    static let teal = Hue(
        _50 : "#F0FDFA".color(),
        _100: "#CCFBF1".color(),
        _200: "#99F6E4".color(),
        _300: "#5EEAD4".color(),
        _400: "#2DD4BF".color(),
        _500: "#14B8A6".color(),
        _600: "#0D9488".color(),
        _700: "#0F766E".color(),
        _800: "#115E59".color(),
        _900: "#134E4A".color()
     )
}


fileprivate extension String {
    /// Unsafely generates a UIColor from this string, assuming it's in the strict format `#123ABC`.
    func color() -> UIColor {
        let red = Int(self[index(startIndex, offsetBy: 1)...index(startIndex, offsetBy: 2)], radix: 16)!
        let green = Int(self[index(startIndex, offsetBy: 3)...index(startIndex, offsetBy: 4)], radix: 16)!
        let blue = Int(self[index(startIndex, offsetBy: 5)...index(startIndex, offsetBy: 6)], radix: 16)!
        return UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1)
    }
}
