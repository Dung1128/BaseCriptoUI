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
    
    init(){
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
    }
    
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
