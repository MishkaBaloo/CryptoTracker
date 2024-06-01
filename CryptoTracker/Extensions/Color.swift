//
//  Color.swift
//  CryptoTracker
//
//  Created by Michael on 20.05.2024.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    static let launch = LaunchTheme()
    
}

struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("SecondColor")
    let red = Color("FirstColor")
    let secondaryText = Color("SecondaryTextColor")
    
}

struct LaunchTheme {
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
}
