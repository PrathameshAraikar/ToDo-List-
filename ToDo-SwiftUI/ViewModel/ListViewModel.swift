//
//  ListViewModel.swift
//  ToDo-SwiftUI
//
//  Created by Prathamesh Araikar on 15/01/22.
//

/*
 
 CRUD FUNCTIONS:
 
 C -> CREATE
 R -> READ
 U -> UPDATE
 D -> DELETE
 
 */

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
//    let itemKey = "item_key"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: "item_key"),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.items = savedItems
    }
    
    func deleteItem(at indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItems(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: "item_key")
        }
    }
}

//    func getItems() {
//        let newItems = [
//            ItemModel(title: "Find Mike", isCompleted: false),
//            ItemModel(title: "Destroy Demogorgon", isCompleted: false),
//            ItemModel(title: "Buy Eggos", isCompleted: true)
//            //        "Find Mike",
//            //        "Destroy Demogorgon",
//            //        "Buy Eggos"
//        ]
//
//        items.append(contentsOf: newItems)
//    }

                                             
                                             
                                             
