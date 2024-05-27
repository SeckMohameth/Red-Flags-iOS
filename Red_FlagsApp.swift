//
//  Red_FlagsApp.swift
//  Red Flags
//
//  Created by Mohameth Seck on 4/28/24.
//

import SwiftUI
import SwiftData

@main
struct Red_FlagsApp: App {
    
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
    

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Person.self)
    }
}
