//
//  LaunchView.swift
//  CryptoTracker
//
//  Created by Michael on 6/1/24.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var loadingText: [String] = "Loading portfolio...".map { String($0) }
    @State private var showLoadingText: Bool  = false
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var counter: Int = 0
    @State private var loops: Int  = 0
    @Binding var showLaunchView: Bool
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
        Image("logo-transparent")
                .resizable()
                .frame(width: 100, height: 100)
            
            ZStack {

                if showLoadingText {
                    HStack(spacing: 0) {
                        ForEach(loadingText.indices) { index in
                            Text(loadingText[index])
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.theme.accent)
                                .offset(y: counter == index ? -5 : 0)
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))

                }
            }
            .offset(y: 70)
        }
        .onAppear {
            showLoadingText.toggle()
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.spring) {
                 
                let lastIndex = loadingText.count - 1
                if counter == lastIndex {
                    counter = 0
                    loops += 1
                    if loops >= 2 {
                        showLaunchView = false
                    }
                    
                } else {
                    counter += 1
                }
            }
        })
    }
}

#Preview {
    LaunchView(showLaunchView: .constant(true))
}
