//
// ContentView.swift
// Using Swift 5.0
//
// Created by Zemise on 2023/11/4
// Copyright (c) 2023 FoodPicker. All rights reserved.
//

import SwiftUI

extension View {
    func mainButtonStyle() -> some View {
        buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
    }
    
    func roundedRectBackground(radius: CGFloat = 8, fill: some ShapeStyle = Color.bg) -> some View {
        background(RoundedRectangle(cornerRadius: radius).foregroundStyle(fill))
    }
}

struct ContentView: View {
    @State private var selectedFood: Food?
    @State private var shouldShowInfo = false
    
    let food = Food.examples
        
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                foodImage
                
                Text("今天吃什么？").bold()
                
                selectedFoodInfoView
                
                Spacer() // .layoutPriority(1)
                
                selectedFoodButton
                
                cancelButton
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height - 100)
            .font(.title)
            .mainButtonStyle()
            .animation(.myEase, value: selectedFood)
            .animation(.mySpring, value: shouldShowInfo)
        }.background(Color.bg2)
    }
}

// MARK: - Subviews

private extension ContentView {
    var foodImage: some View {
        Group {
            if selectedFood != .none {
                Text(selectedFood!.image)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.1)
                    .lineLimit(1)
            } else {
                Image("dinner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }.frame(height: 250)
    }
    
    var foodNameView: some View {
        HStack {
            Text(selectedFood!.name)
                .font(.largeTitle)
                .foregroundColor(.green)
                .bold()
                .id(selectedFood!.name) // 强制为不同的View，要的就是转场的效果
                .transition(AnyTransition.delayInsertionOpacity)
                
            Button(role: .none) {
                shouldShowInfo.toggle()
                    
            } label: {
                Image(systemName: "info.circle.fill").foregroundColor(.secondary)
            }
            .buttonStyle(.plain)
        }
    }
    
    var foodDetailView: some View {
        VStack {
            if shouldShowInfo {
                Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                    GridRow {
                        Text("蛋白质")
                        Text("脂肪")
                        Text("碳水")
                    }
                    .frame(width: 70)
                        
                    Divider().gridCellUnsizedAxes(.horizontal)
                        .padding(.horizontal, -10)
                    GridRow {
                        Text(selectedFood!.$protein)
                        Text(selectedFood!.$fat)
                        Text(selectedFood!.$carb)
                    }
                }
                .font(.title3)
                .padding()
                .roundedRectBackground()
                .transition(.moveUpWithOpacity)
            }
        }
        .frame(maxWidth: .infinity)
        .clipped()
    }
    
    @ViewBuilder var selectedFoodInfoView: some View {
        if selectedFood != .none {
            foodNameView
            
            Text("热量 \(selectedFood!.$calorie)").font(.title2)
              
            foodDetailView
        }
    }

    var selectedFoodButton: some View {
        Button(role: .none) {
            selectedFood = food.shuffled().first
        } label: {
            Text(selectedFood == .none ? "告诉我" : "换一个")
                .animation(.none, value: selectedFood)
                .frame(width: 200) // 提供空间
                .transformEffect(.identity)
            
        }.padding(.bottom, -15)
    }
    
    var cancelButton: some View {
        Button(role: .destructive) {
            selectedFood = .none
            shouldShowInfo = false
        } label: {
            Text("重置")
                .frame(width: 200)
        }.buttonStyle(.bordered)
    }
}

extension ContentView {
    init(selectedFood: Food) {
        _selectedFood = State(wrappedValue: selectedFood)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedFood: .examples.first!)
        ContentView(selectedFood: .examples.first!).previewDevice(.iphoneSE)
        ContentView(selectedFood: .examples.first!).previewDevice(.iPad)
    }
}
