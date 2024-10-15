//
// ContentView.swift
// Using Swift 5.0
//
// Created by Zemise on 2024/10/15
// Copyright (c) 2023 PodTest. All rights reserved.
//

import FMDB
import MyLibrary
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")

            Text(Person(name: "Hello, Zemise").name)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
