//
//  SettingsView.swift
//  CryptoTracker
//
//  Created by Michael on 6/1/24.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://nuwm.edu.ua")! // better use guard let but it's just example
    let instagramURL = URL(string: "https://www.instagram.com/mishkabaloo")!
    let telegramURL = URL(string: "https://t.me/.mishkabalooo")!
    let coinGekoURL = URL(string: "https://www.coingecko.com/uk")!
    let personalURL = URL(string: "https://github.com/MishkaBaloo/CryptoTracker")!
    
    var body: some View {
        NavigationStack {
            List {
                cryptoTrackerSection
                coinGekoSection
                developerSection
                applicationSection
            }
            .font(.callout)
            .tint(Color.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton()
                }
            })
        }
    }
}

#Preview {
    SettingsView()
}

extension SettingsView {
    
    private var cryptoTrackerSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made for tracking crypto and have possibility to manage them in own portfolio. For example market and coins stats. The project benefits a couple features from multi-threading, publisher/subscribers and data persistance. It uses MVVM Architecture, Combine, Animation and CoreData!")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.theme.accent)
            }
            Link("GitHub repository", destination: personalURL)
        } header: {
            Text("Crypto Tracker")
        }
    }
    
    private var coinGekoSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that used in this app comes from API by CoinGecko! ")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.theme.accent)
            }
            Link("Visit CoinGeko", destination: coinGekoURL)
        } header: {
            Text("Coin Geko")
        }
    }
    
    private var developerSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("mishka")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100 ,height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Tracker developed by four course student Mykhailo Tokmakov for defens diploma of NUWM. That application uses SwiftUI and written hundred procent of Swift! ")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.theme.accent)
            }
            Link("Follow Instagram", destination: instagramURL)
            Link("Telegram", destination: telegramURL)
        } header: {
            Text("Developer")
        }
    }
    
    private var applicationSection: some View {
        Section {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn more", destination: defaultURL)
        } header: {
            Text("Application")
        }
    }
    
}
