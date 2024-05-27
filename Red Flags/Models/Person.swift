//
//  Person.swift
//  Red Flags
//
//  Created by Mohameth Seck on 4/28/24.
//

import Foundation
import SwiftData


@Model class Person: Identifiable, ObservableObject {
    var id: UUID
    var name: String
    var age: Int
    var city: String
    var height: Double
    var startDate: Date
    var strikes: Int
    @Relationship(deleteRule: .cascade)
    var flags: [Flag]? = [Flag]()
   
    init(id: UUID, name: String, age: Int, city: String, height: Double, startDate: Date, strikes: Int) {
        self.id = id
        self.name = name
        self.age = age
        self.city = city
        self.height = height
        self.startDate = startDate
        self.strikes = strikes
    }
    
   
}
