//
//  Note.swift
//  Notes
//
//  Created by Aleksandra Nikiforova on 28/01/24.
//

import Foundation
import UIKit
import SwiftUI

struct Note: Codable {
    let uid: String
    let title: String
    let content: String
    let color: UIColor
    let importance: Importance
    let selfDestructionDate: Date?

    enum Importance: Int, Decodable {
        case important = 1
        case normal = 2
        case unimportant = 3
    }

    private enum CodingKeys: String, CodingKey { case uid, title, content, color, importance, selfDestructionDate }

    init(uid: String?, title: String, content: String, color: UIColor?, importance: Importance, selfDestructionDate: Date?) {
        self.uid = uid ?? UUID().uuidString
        self.title = title
        self.content = content
        self.color = color ?? UIColor.white
        self.importance = importance
        self.selfDestructionDate = selfDestructionDate ?? nil
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        uid = try container.decode(String.self, forKey: .uid)
        title = try container.decode(String.self, forKey: .title)
        content = try container.decode(String.self, forKey: .content)
        color = try container.decode(Color.self, forKey: .color).uiColor
        importance = try container.decode(Importance.self, forKey: .importance)
        selfDestructionDate = try? container.decode(Date.self, forKey: .selfDestructionDate)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uid, forKey: .uid)
        try container.encode(title, forKey: .title)
        try container.encode(content, forKey: .content)
        try container.encode(Color(uiColor: color), forKey: .color)
        try container.encode(importance.rawValue, forKey: .importance)
        try container.encode(selfDestructionDate, forKey: .selfDestructionDate)
    }
}

extension Note {
    static var allNotes: [Note] {
        return [
            Note(
                uid: nil,
                title: "Заголовок заметки",
                content: "Текст заметки, Текст заметки, Текст заметки, Текст заметки, Текст заметки",
                color: UIColor.red,
                importance: Importance.normal,
                selfDestructionDate: nil
            ),
            Note(
                uid: nil,
                title: "Короткая заметка",
                content: "Привет",
                color: UIColor.yellow,
                importance: Importance.normal,
                selfDestructionDate: nil
            ),
            Note(
                uid: nil,
                title: "Длинная заметка",
                content: "Очень длинная заметка, Очень длинная заметка, Очень длинная заметка, Очень длинная заметка, Очень длинная заметка, Очень длинная заметка, Очень длинная заметка, Очень длинная заметка, Очень длинная заметка, Очень длинная заметка, Очень длинная заметка",
                color: UIColor.blue,
                importance: Importance.normal,
                selfDestructionDate: nil
            ),
            Note(
                uid: nil,
                title: "Заголовок заметки - 2",
                content: "Текст заметки, Текст заметки, Текст заметки, Текст заметки, Текст заметки",
                color: UIColor.yellow,
                importance: Importance.normal,
                selfDestructionDate: nil
            ),
            Note(
                uid: nil,
                title: "Короткая заметка",
                content: "Не забыть выключить утюг",
                color: UIColor.cyan,
                importance: Importance.normal,
                selfDestructionDate: nil
            ),
            Note(
                uid: nil,
                title: "Короткая заметка",
                content: "Не забыть выключить утюг",
                color: UIColor.cyan,
                importance: Importance.normal,
                selfDestructionDate: nil
            ),
            Note(
                uid: nil,
                title: "Короткая заметка",
                content: "Не забыть выключить утюг",
                color: UIColor.cyan,
                importance: Importance.normal,
                selfDestructionDate: nil
            )
        ]
    }
}
