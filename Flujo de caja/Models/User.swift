//
//  User.swift
//  Flujo de caja
//
//  Created by Fray Pineda on 10/4/20.
//

import Foundation
import UIKit

class User: Codable {
    var id: Int?
    var name: String?
    var lastName: String?
    var email: String?
    var companyRif: String
    var rolId: Int?
    var rol: Rol?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case lastName = "last_name"
        case email
        case companyRif = "company_rif"
        case rolId = "rol_id"
        case rol
    }
    
}
