//
//  ThemeHelper.swift
//  InstagramUI
//
//  Created by Admin on 16/08/22.
//

import Foundation
import SwiftUI

enum Colors {
    enum Content {
        static var contentStrongestColor: Color {
            return setColor(
                dark: Color.white,
                light:  Color.black
            )
        }
    }
    enum backrground {
        static var contentDefaultColor: Color {
            return setColor(
                dark: Color(red: 0.06666667014360428, green: 0.09019608050584793, blue: 0.15294118225574493),
                light:  Color.white
            )
        }
    }
    
    
    enum theme1 {
        static var contentDefaultColor: Color {
            return setColor(
                dark: Color(red: 0.06666667014360428, green: 0.09019608050584793, blue: 0.15294118225574493),
                light:  Color.white
            )
        }
    }
    
    enum theme2 {
        static var contentDefaultColor: Color {
            return setColor(
                dark: Color.orange,
                light:  Color.white
            )
        }
    }
    
    enum theme3{
        static var contentDefaultColor: Color {
            return setColor(
                dark: Color.teal,
                light:  Color.white
            )
        }
    }
    
    
    
}

extension Colors {
    static func setColor(dark: Color, light: Color) -> Color {
        switch UIScreen.main.traitCollection.userInterfaceStyle {
        case .dark: return dark
        case .light: return light
        default: return light
        }
    }
}

