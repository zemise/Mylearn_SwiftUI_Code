//
// SentenceModel.swift
// Using Swift 6.0
//
// Created by Zemise on 2025/4/8
// Copyright (c) 2023 Chapter13. All rights reserved.
//

import Foundation

struct SentenceModel: Identifiable, Codable {
    var id: UUID = .init()
    var sentence: String
    var create_time: String
}
