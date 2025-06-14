//
//  ContentView.swift
//  Landmarks
//
//  Created by Tang Qianqi on 2025/4/17.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false
    @State private var selection: Tab = .featured

    enum Tab {
        case featured
        case list
    }

    var body: some View {
        if isLoggedIn {
            TabView(selection: $selection) {
                CategoryHome()
                    .tabItem {
                        Label("Featured", systemImage: "star")
                    }
                    .tag(Tab.featured)

                LandmarkList()
                    .tabItem {
                        Label("List", systemImage: "list.bullet")
                    }
                    .tag(Tab.list)
            }
        } else {
            LoginView(isLoggedIn: $isLoggedIn)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
