//
//  Socios.swift
//  HBE Horarios IOS
//
//  Created by user164066 on 4/21/20.
//  Copyright © 2020 Carlos Miranda. All rights reserved.
//

import UIKit

class Socios: NSObject {
    var id : Int = 0
    var idSocio : String = ""
    var password : String = ""
    
    init(id : Int, idSocio : String, password : String){
        self.id = id
        self.idSocio = idSocio
        self.password = password
    }
}
