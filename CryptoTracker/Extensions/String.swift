//
//  String.swift
//  CryptoTracker
//
//  Created by Michael on 5/31/24.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil) 
    }
    
}
