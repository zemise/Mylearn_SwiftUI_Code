//
// Extensions.swift
// Using Swift 5.0
//
// Created by Zemise on 2023/11/9
// Copyright (c) 2023 FoodPicker. All rights reserved.
//


import SwiftUI

extension Animation {
    static let mySpring = Animation.spring(dampingFraction: 0.55)
    static let myEase = Animation.easeInOut(duration: 0.6)
}

extension Color {
    static let bg = Color(.systemBackground)
    static let bg2 = Color(.secondarySystemBackground)
}

extension AnyTransition {
    static let delayInsertionOpacity = Self.asymmetric(
        insertion: .opacity.animation(.easeInOut(duration: 0.5).delay(0.2)),
        removal: .opacity.animation(.easeOut(duration: 0.4)))
    
    static let moveUpWithOpacity = Self.move(edge: .top).combined(with: .opacity)
}
