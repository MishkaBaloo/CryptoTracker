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
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    
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
