//
// SuffixWrapper.swift
// Using Swift 5.0
//
// Created by Zemise on 2023/11/9
// Copyright (c) 2023 FoodPicker. All rights reserved.
//

import SwiftUI

@propertyWrapper struct Suffix: Equatable {
    var wrappedValue: Double
    private let suffix: String

    init(wrappedValue: Double, _ suffix: String) {
        self.wrappedValue = wrappedValue
        self.suffix = suffix
    }

    var projectedValue: String {
        wrappedValue.formatted() + " \(suffix)"
    }
}
