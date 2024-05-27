//
//  Item.swift
//  Red Flags
//
//  Created by Mohameth Seck on 4/28/24.
//

import Foundation
import SwiftData

@Model
final class Flag {
    var title: String
    var detail: String
    var isGreenFlag: Bool
    var timeStamp: Date
    
    @Relationship(deleteRule: .nullify, inverse: \Person.flags) var person: Person?
    
    init(title: String, detail: String, isGreenFlag: Bool, timeStamp: Date, person: Person? = nil) {
        self.title = title
        self.detail = detail
        self.isGreenFlag = isGreenFlag
        self.timeStamp = timeStamp
        self.person = person
    }
    
    
  
}
