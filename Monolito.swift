//
//  Monolito.swift
//  HBE Horarios IOS
//
//  HEB Horarios fue desarrollado como proyecto final de la materia Proeycto de Desarrollo
//  para dispositivos móviles en el semestre Febrero Junio 2020.
//  Desarrolladores:
    //  Carlos Andrés Miranda Eguia A00817390 carlosa_miranda@outlook.com
    //  Gabriel Ortega Jacobo A01176807 a01176807@itesm.mx
    //  Paulina Cámara Vidales A01039839 a01039839@itesm.mx
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
    var total: String
    var overtime: String
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
