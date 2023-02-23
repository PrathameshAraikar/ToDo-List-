//
//  ToDo_SwiftUIApp.swift
//  ToDo-SwiftUI
//
//  Created by Prathamesh Araikar on 14/01/22.
//

import SwiftUI

@main
struct ToDo_SwiftUIApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
