//
// ViewModel.swift
// Using Swift 6.0
//
// Created by Zemise on 2025/4/8
// Copyright (c) 2023 Chapter13. All rights reserved.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var sentenceModel: [SentenceModel] = []

    init() {
        loadData()
    }

    public func addNote(sentence: String) {
        let newNote = SentenceModel(sentence: sentence, create_time: getCurrentTime())
        sentenceModel.append(newNote)
        saveData()
    }

    // 删除笔记
    func deleteNote(id: UUID) {
        if let index = sentenceModel.firstIndex(where: { $0.id == id }) {
            sentenceModel.remove(at: index)
            saveData()
        }
    }

    // 获得当前时间
    func getCurrentTime() -> String {
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "yyyy-MM-dd"
        let currentTime = Date()
        let formattedTime = dateFomatter.string(from: currentTime)

        return formattedTime
    }

    // 保存数据到文件
    func saveData() {
        do {
            let data = try JSONEncoder().encode(sentenceModel)
            // 获取应用的文档目录，在获取文档目录的URL后，使用.first获取第一个URL，指向sentenceModel.json
            // 文件不存在时，系统自动创建
            if let documentsDirectiory = FileManager.default.urls(
                for: .documentDirectory, in: .userDomainMask).first
            {
                let fileURL = documentsDirectiory.appendingPathComponent("sentenceModel.json")

                try data.write(to: fileURL)
            }

        } catch {
            print("保存失败信息: \(error)")
        }
    }

    // 加载文件中的数据
    func loadData() {
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentsDirectory.appendingPathComponent("sentenceModel.json")

            do {
                let data = try Data(contentsOf: fileURL)
                sentenceModel = try JSONDecoder().decode([SentenceModel].self, from: data)
            } catch {
                print("读取失败信息：\(error)")
            }
        }
    }
}
