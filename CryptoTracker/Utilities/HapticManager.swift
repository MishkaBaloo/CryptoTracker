//
//  HapticManager.swift
//  CryptoTracker
//
//  Created by Michael on 5/25/24.
//

import Foundation
import SwiftUI

class HapticManager {
    static private let generator  = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
