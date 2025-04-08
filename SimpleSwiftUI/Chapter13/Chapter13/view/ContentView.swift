//
// ContentView.swift
// Using Swift 6.0
//
// Created by Zemise on 2025/4/8
// Copyright (c) 2023 Chapter13. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var sentences: [(Color, String)] = [
        (.red, "在那些心情低落经历挫折的日子"),
        (.green, "这里应是一个审美多元的年代"),
        (.blue, "月光在窗棂上写下银色的诗行"),
        (.orange, "候鸟掠过城市最后的黄昏"),
        (.purple, "咖啡凉了故事却刚刚开始温热"),
        (.yellow, "风铃摇晃着夏日未完成的约定"),
        (.pink, "信纸折痕里藏着不敢邮寄的悸动"),
        (.indigo, "灯塔在雾中练习孤独的辩证法"),
        (.teal, "老唱片在暮色里旋转着昨日温度"),
        (.brown, "落叶在台阶上数着秋天的脚步"),
        (.cyan, "漂流瓶载着坐标不明的期待"),
        (.mint, "青苔在石缝间拼写潮湿的密码"),
        (.gray, "备忘录里躺着过期未兑现的诺言"),
        (.black, "影子是光最沉默的合作伙伴")
    ]

    @State private var selectdTabIndex = 0
    @State var sentence: String = ""

    var body: some View {
        ZStack {
            Color(.systemGray6).edgesIgnoringSafeArea(.all)
            VStack(spacing: 48, content: {
                Text(sentence)

                slideCard

                copyBtnView
            })
        }
        .onAppear {
            sentence = sentences[selectdTabIndex].1
        }
    }

    // 滑动卡片
    private var slideCard: some View {
        TabView(selection: $selectdTabIndex) {
            ForEach(0 ..< sentences.count, id: \.self) { index in
                TextCard(
                    bgColor: sentences[index].0,
                    text: sentences[index].1
                )
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(height: UIScreen.main.bounds.height / 3)
        .onChange(of: selectdTabIndex, initial: true) { newIndex, _ in
            sentence = sentences[newIndex].1
        }
    }

    private var copyBtnView: some View {
        Button(action: {}, label: {
            Label("收藏", systemImage: "square.filled.on.square")
                .bold()
                .foregroundStyle(.white)
                .padding(.vertical)
                .padding(.horizontal, 48)
                .background(.green)
                .cornerRadius(16)
        })
    }
}

// 文字卡片
struct TextCard: View {
    var bgColor: Color
    var text: String

    var body: some View {
        ZStack {
            Rectangle()
                .fill(bgColor)
                .cornerRadius(16)
                .opacity(0.5)

            Text(text)
                .font(.system(size: 20))
                .foregroundStyle(.white)
                .padding(32)
        }
        .frame(height: UIScreen.main.bounds.height / 3)
        .padding()
    }
}

#Preview {
    ContentView()
}
