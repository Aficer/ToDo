//
//  cftNotesApp.swift
//  cftNotes
//
//  Created by Вадим Эфис on 31.01.2023.
//

import SwiftUI



@main
struct cftNotesApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
               ListView()
            }
           .navigationViewStyle(StackNavigationViewStyle())
          .environmentObject(listViewModel)
        
        }
    }
}
