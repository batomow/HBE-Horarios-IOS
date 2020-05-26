//
//  Monolito.swift
//  HBE Horarios IOS
//
//  Created by Carlos Miranda on 24/05/20.
//  Copyright © 2020 Carlos Miranda. All rights reserved.
//

import UIKit

struct User: Codable{
    var firstName: String
    var middleName: String
    var lastName: String
    var password: String
}

struct Resume: Codable{
    var overtime: String
    var total: String
}

struct Day: Codable{
    var breakReturn: String
    var schedule: String
    var free: Bool
    var entry: String
    var exit: String
    var breakLeave: String
}

struct Monolito: Codable{
    var user: User
    
    var resume0: Resume
    var resume1: Resume
    var resume2: Resume
    var resume3: Resume
    var resume4: Resume
    
    var week0: [Day]
    var week1: [Day]
    var week2: [Day]
    var week3: [Day]
    var week4: [Day]
}
