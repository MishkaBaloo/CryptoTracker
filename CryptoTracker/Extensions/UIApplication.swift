//
//  UIApplication.swift
//  CryptoTracker
//
//  Created by Michael on 5/23/24.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
 
