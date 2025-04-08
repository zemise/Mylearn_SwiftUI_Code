//
// MainTabView.swift
// Using Swift 6.0
//
// Created by Zemise on 2025/4/8
// Copyright (c) 2023 Chapter13. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(.white)
    }

    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("推荐", systemImage: "square.filled.on.square")
                }

            NoteView()
                .tabItem {
                    Label("笔记", systemImage: "note.text")
                }
        }
    }
}

#Preview {
    MainTabView()
}
