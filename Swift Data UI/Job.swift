//
//  Job.swift
//  Swift Data UI
//
//  Created by Tony Gultom on 18/08/24.
//

import Foundation
import SwiftData

@Model
class Job {
    var name: String
    var priority: Int
    /*
     these link directly to user
     */
    var owner: User?
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
