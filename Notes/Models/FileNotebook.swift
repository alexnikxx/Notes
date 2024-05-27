//
//  FileNotebook.swift
//  Notes
//
//  Created by Aleksandra Nikiforova on 28/01/24.
//

import Foundation

class FileNotebook {
    private(set) var notes = [Note]()
    
    public func add(_ note: Note) {
        notes.append(note)
    }
    
    public func remove(with uid: String) {
        notes.removeAll { note in
            return note.uid == uid
        }
    }
    
    public func saveToFile() {
        var url: URL
        
        if let dir = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first {
            url = dir.appendingPathComponent("notes.json")
        } else {
            print("URL doesn't exist")
            return
        }
        
        // перевели массив заметок в массив словарей, так как массив словарей - это по сути своей JSON
        var dictNotes = Array<Dictionary<String, Any>>()
        for note in notes {
            dictNotes.append(note.json)
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: dictNotes)
            try? data.write(to: url)
        } catch {
            print(String(describing: error))
        }
    }
    
    public func loadFromFile() {
        var url: URL
        
        if let dir = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first {
            url = dir.appendingPathComponent("notes.json")
        } else {
            print("URL doesn't exist")
            return
        }
        
        do {
            if let data = try JSONSerialization.jsonObject(with: Data(contentsOf: url)) as? [[String: Any]] {
                for noteData in data {
                    if let note = Note.parse(json: noteData) {
                        notes.append(note)
                    }
                }
            } else {
                print("Invalid JSON format")
            }
        } catch {
            print(String(describing: error))
        }
    }
    
    public func saveToFileCodable() {
        var url: URL
        
        if let dir = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first {
            url = dir.appendingPathComponent("notes.json")
        } else {
            print("URL doesn't exist")
            return
        }
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(notes) {
            do {
                try encoded.write(to: url)
            } catch {
                print("Failed to write JSON data: \(error.localizedDescription)")
            }
        }
    }
    
    public func loadFromFileCodable() {
        var url: URL
        
        if let dir = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first {
            url = dir.appendingPathComponent("notes.json")
        } else {
            print("URL doesn't exist")
            return
        }
        
        guard let json = try? Data(contentsOf: url) else {
            fatalError("Failed to load data from bundle.")
        }
        
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode([Note].self, from: json)
            notes.append(contentsOf: decoded)
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}
