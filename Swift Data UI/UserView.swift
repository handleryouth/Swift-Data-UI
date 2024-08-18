//
//  UserView.swift
//  Swift Data UI
//
//  Created by Tony Gultom on 18/08/24.
//

import SwiftData
import SwiftUI

struct UserView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
    
    var body: some View {
        List(users) {
            user in NavigationLink(value: user) {
                HStack {
                    Text(user.name)
                    
                    Spacer()
                    
                    Text(String(user.jobs.count)).fontWeight(.black).padding(.vertical, 5)
                        .padding(.horizontal, 10).background(.blue).foregroundStyle(.white).clipShape(.capsule)
                }
                
            }
        }.onAppear(perform: addSample)
    }
    
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        /*
         _ is swift way of getting access to that query behind the actual array to make a whole new query object
         */
        _users = Query(filter: #Predicate<User>{
            user in user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    func addSample() {
        let user1 = User(name: "Piper Chapman", city: "New York", joinDate: .now)
        
        let job1 = Job(name: "Organize sock drawer", priority: 3)
        let job2 = Job(name: "Make plans with Alex", priority: 4)
        
        modelContext.insert(user1)
       
        user1.jobs.append(job1)
        user1.jobs.append(job2)
        
    }
}

#Preview {
    UserView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)]).modelContainer(for: User.self)
}
