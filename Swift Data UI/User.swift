//
//  User.swift
//  Swift Data UI
//
//  Created by Tony Gultom on 18/08/24.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var city: String
    var joinDate: Date
//    var jobs = [Job]()
    
    /*
     when you delete the user, delete all their jobs too.
     */
    @Relationship(deleteRule: .cascade) var jobs = [Job]()
    
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
