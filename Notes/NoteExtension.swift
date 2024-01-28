//
//  NoteExtension.swift
//  Notes
//
//  Created by Aleksandra Nikiforova on 28/01/24.
//

import Foundation
import UIKit

extension Note {
    var json: [String: Any] {
        var jsonResult: [String: Any] = [
            "uid": uid,
            "title": title,
            "content": content
        ]
        
        if color != .white {
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            let tint = color.getRed(&r, green: &g, blue: &b, alpha: &a)
            
            let red = Int(r * 255.0)
            let green = Int(g * 255.0)
            let blue = Int(b * 255.0)
            
            let colorStr = String(format: "#%02X%02X%02X", red, green, blue)
//            print(colorStr)
            jsonResult["color"] = colorStr
        }
        
        if importance != .normal {
            jsonResult["importance"] = importance.rawValue
        }
        
        if let selfDestructionDate = selfDestructionDate {
            let fmt = DateFormatter()
            fmt.dateFormat = "yyyy-MM-dd"
            let str = fmt.string(from: selfDestructionDate)
            jsonResult["selfDestructionDate"] = str
        }
        
        return jsonResult
    }
    
    static func parse(json: [String: Any]) -> Note? {
        guard
            let uid = json["uid"] as? String,
            let title = json["title"] as? String,
            let content = json["content"] as? String
        else { return nil }
        
        var color: UIColor?
        if let colorStr = json["color"] as? String {
            color = UIColor(named: colorStr)
        }
        
        var importance: Note.Importance = .normal
        if let importanceInt = json["importance"] as? Int {
            importance = Note.Importance(rawValue: importanceInt) ?? .normal
        }
        
        var selfDestructionDate: Date?
        if let selfDestructionDateStr = json["selfDestructionDate"] as? String {
            let fmt = DateFormatter()
            selfDestructionDate = fmt.date(from: selfDestructionDateStr)
        }
        
        return Note(uid: uid, title: title, content: content, color: color, importance: importance, selfDestructionDate: selfDestructionDate)
    }
}
