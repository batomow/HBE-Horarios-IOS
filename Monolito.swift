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
    var overtime: Float
    var total: Float
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
    var resume: Resume
    var current: [Day] // semana actual
}
