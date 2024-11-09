//
//  ContentView.swift
//  BaseCrypto
//
//  Created by Dũng Nguyễn on 8/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            VStack(spacing: 40, content: {
                Text("Accent color")
                    .foregroundColor(Color.theme.accent)
                Text("Secondary text color")
                    .foregroundColor(Color.theme.secondaryText)
                Text("Red color")
                    .foregroundColor(Color.theme.red)
            })
        }
    }
}

#Preview {
    ContentView()
}
