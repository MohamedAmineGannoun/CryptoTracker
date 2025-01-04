//
//  HapticManager.swift
//  CryptoCombine
//
//  Created by Amine Gannoun on 04/01/2025.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
}
