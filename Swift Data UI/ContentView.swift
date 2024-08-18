//
//  ContentView.swift
//  Swift Data UI
//
//  Created by Tony Gultom on 18/08/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showingUpcomingOnly = false
    
    //    @Query(
    //        filter: #Predicate<User> { user in
    /*
     contains is case sensitive
     */
    //            user in user.name.contains("R")
    
    /*
     localizedStandardContains is not case sensitive
     */
    //            user in user.name.localizedStandardContains("R") && user.city == "London"
    
    
    //            if user.name.localizedStandardContains("R") {
    //                if user.city == "London" {
    //                    return true
    //                } else {
    //                    return false
    //                }
    //            } else {
    //                return false
    //            }
    //        },
    //        sort: \User.name) var users: [User]
    
    //    @State private var path = [User]()
    
    
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    
    var body: some View {
        //        NavigationStack(path: $path){
        NavigationStack {
            UserView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
                .navigationTitle("Users")
            // ** FOR PATH* *
            //                .navigationDestination(for: User.self) {
            //                user in EditUserView(user: user)
                .toolbar {
                    //                    Button("Add User", systemImage: "plus") {
                    //                        let user = User(name: "", city: "", joinDate: .now)
                    //                        modelContext.insert(user)
                    // push user for editing
                    //                    path = [user]
                    //                    }
                    
                    Button("Add Samples", systemImage: "plus") {
                        
                        /*
                         Try: meaning this code might fail
                         Try?: meaning this code might fail and return nill
                         */
                        try? modelContext.delete(model: User.self)
                        
                        let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                        
                        let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                        
                        let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                        
                        let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))
                        
                        modelContext.insert(first)
                        modelContext.insert(second)
                        modelContext.insert(third)
                        modelContext.insert(fourth)
                    }
                    
                    Button(showingUpcomingOnly ? "Show Everyone" : "Show Upcoming") {
                        showingUpcomingOnly.toggle()
                    }
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by Name").tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate)
                            ])
                            
                            Text("Sort by Join Date").tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                                
                            ])
                        }
                    }
                    
                   
                }
        }
    }
}


#Preview {
    ContentView().modelContainer(for: User.self, inMemory: true)
}
