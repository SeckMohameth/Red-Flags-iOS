//
//  Person.swift
//  Red Flags
//
//  Created by Mohameth Seck on 4/28/24.
//

import Foundation
import SwiftData


@Model class Person: Identifiable {
    var name: String
    var startDate: Date
    
    init(name: String, startDate: Date) {
        self.name = name
        self.startDate = startDate
    }
}
