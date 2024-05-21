//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Michael on 20.05.2024.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView(content: {
                HomeView()
                    .toolbar(.hidden, for: .automatic)
            })
            .environmentObject(vm)
        }
    }
}
