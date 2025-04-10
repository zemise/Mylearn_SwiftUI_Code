//
// Chapter13App.swift
// Using Swift 6.0
//
// Created by Zemise on 2025/4/8
// Copyright (c) 2023 Chapter13. All rights reserved.
//


import SwiftUI

@main
struct Chapter13App: App {
    // 创建 ViewModel 实例
    @StateObject private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(viewModel)
        }
    }
}
