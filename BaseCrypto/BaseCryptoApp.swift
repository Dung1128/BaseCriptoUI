//
//  BaseCryptoApp.swift
//  BaseCrypto
//
//  Created by Dũng Nguyễn on 8/11/24.
//

import SwiftUI

@main
struct BaseCryptoApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            NavigationView{
                HomeView()
            }
            .environmentObject(vm)
        }
    }
}
