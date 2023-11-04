//
// ContentView.swift
// Using Swift 5.0
//
// Created by Zemise on 2023/11/4
// Copyright (c) 2023 FoodPicker. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let food = ["汉堡", "沙拉", "披萨", "意大利面", "刀削面"]
    @State private var selectedFood: String?

    var body: some View {
        VStack(spacing: 30) {
            Image("dinner")
                .resizable()
                .aspectRatio(contentMode: .fit)

            Text("今天吃什么？")
                .bold()

            if selectedFood != .none {
                Text(selectedFood ?? "")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.green)
                    .id(selectedFood) // 强制为不同的View，要的就是转场的效果
                    .transition(.asymmetric(
                        insertion: .opacity.animation(.easeInOut(duration: 0.5).delay(0.2)),
                        removal: .opacity.animation(.easeOut(duration: 0.4))))
            }

            Button(role: .none) {
                selectedFood = food.shuffled().first
            } label: {
                Text(selectedFood == .none ? "告诉我" : "换一个")
                    .animation(.none, value: selectedFood)
                    .frame(width: 200) // 提供空间
                    .transformEffect(.identity)

            }.padding(.bottom, -15)

            Button(role: .destructive) {
                selectedFood = .none
            } label: {
                Text("重置")
                    .frame(width: 200)
            }.buttonStyle(.bordered)
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color.secondary)
        .font(.title2)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .animation(.easeInOut(duration: 0.6), value: selectedFood)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
