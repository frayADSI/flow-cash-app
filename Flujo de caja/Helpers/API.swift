//
//  API.swift
//  Flujo de caja
//
//  Created by Fray Pineda on 10/4/20.
//

import Foundation

struct API {
    
    static var ip = "192.168.1.104:8000"
    static var baseUrl = "http://" + ip
    struct Login {
        static var loginUser = baseUrl + "/api/v1/login"
    }
    
    struct Transactions {
        static var getTransaction = baseUrl + "/api/v1/getTransactions"
    }
}
