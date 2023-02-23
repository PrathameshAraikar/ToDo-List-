//
//  ItemModel.swift
//  ToDo-SwiftUI
//
//  Created by Prathamesh Araikar on 14/01/22.
//

import Foundation

// Model for our items: id, title, isCompleted

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
