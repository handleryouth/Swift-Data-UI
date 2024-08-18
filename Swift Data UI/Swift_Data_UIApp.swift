//
//  Swift_Data_UIApp.swift
//  Swift Data UI
//
//  Created by Tony Gultom on 18/08/24.
//

import SwiftUI
import SwiftData

@main
struct Swift_Data_UIApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: User.self)
    }
}
