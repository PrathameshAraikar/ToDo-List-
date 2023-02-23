//
//  ListView.swift
//  ToDo-SwiftUI
//
//  Created by Prathamesh Araikar on 14/01/22.
//

import SwiftUI

struct ListView: View {
    
//    let it = Items()
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            
            // If our ToDo List is empty then:
            
            if listViewModel.items.isEmpty {
                NoItemView()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            } else {
                List {
                    ForEach(listViewModel.items) { item in      // Iterating through our items array using ForEach loop
                        ListRowView(item: item)
                            .onTapGesture {                     // To put/remove checkmark if our item gets selected/deselected
                                withAnimation (.linear) {
                                    listViewModel.updateItems(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)    // Swipe right action for deleting items
                    .onMove(perform: listViewModel.moveItem)        // On tapping Edit button we can move items in the list
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("ToDo List 📝")        // Navigation Title
        .navigationBarItems(
            leading: EditButton(),              // Edit Button on left
            trailing: NavigationLink("Add", destination: AddView()) // Add button on right -> AddView
        )
    }
    
//    func deleteItem(at indexSet: IndexSet) {
//        it.items.remove(atOffsets: indexSet)
//    }
//
//    func moveItem(from: IndexSet, to: Int) {
//        it.items.move(fromOffsets: from, toOffset: to)
//    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
        
    }
}

//class Items {
//    var items: [ItemModel] = [
//        ItemModel(title: "Find Mike", isCompleted: false),
//        ItemModel(title: "Destroy Demogorgon", isCompleted: false),
//        ItemModel(title: "Buy Eggos", isCompleted: true)
//        //        "Find Mike",
//        //        "Destroy Demogorgon",
//        //        "Buy Eggos"
//    ]
//}

