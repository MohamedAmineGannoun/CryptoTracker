//
//  CryptoCombineApp.swift
//  CryptoCombine
//
//  Created by Amine Gannoun on 24/12/2024.
//

import SwiftUI

@main
struct CryptoCombineApp: App {
    
    @StateObject private var homeViewModel = HomeViewModel()
    @State private var showLaunchView: Bool = true

    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView {
                    HomeView()
                        .navigationBarHidden(true)
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .environmentObject(homeViewModel)

                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
            }
        }
    }
}
