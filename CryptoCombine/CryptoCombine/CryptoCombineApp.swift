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
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(homeViewModel)
        }
    }
}
