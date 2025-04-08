//
// NoteView.swift
// Using Swift 6.0
//
// Created by Zemise on 2025/4/8
// Copyright (c) 2023 Chapter13. All rights reserved.
//

import SwiftUI

struct NoteView: View {
    @State var viewModel = ViewModel()

    var body: some View {
        // 视图布局
        ZStack {
            Color(.systemGray6)
                .edgesIgnoringSafeArea(.all)

            if viewModel.sentenceModel.isEmpty {
                defaultImageView
            } else {
                noteCardList
            }
        }
    }

    // 笔记列表
    private var noteCardList: some View {
        ScrollView(content: {
            ForEach(viewModel.sentenceModel, content: { item in
                NoteCard(
                    sentence: item.sentence,
                    create_tiem: item.create_time
                )

            })
        })
    }

    // 默认图
    private var defaultImageView: some View {
        Image(systemName: "figure.indoor.cycle")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
    }
}

// 笔记卡片
struct NoteCard: View {
    var sentence: String
    var create_tiem: String
    var body: some View {
        HStack {
            VStack(alignment: .leading, content: {
                Text(sentence)
                    .lineLimit(2)

                Spacer()
                Text(create_tiem)
                    .foregroundStyle(.gray)
            })

            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 60, maxHeight: 80)
        .padding()
        .background(.white)
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

#Preview {
    NoteView()
}
