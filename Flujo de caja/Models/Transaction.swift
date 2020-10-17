//
//  Transaction.swift
//  Flujo de caja
//
//  Created by Fray Pineda on 10/4/20.
//

import Foundation
import UIKit

class Transaction: Codable {
    var balance: Double?
    var transactions: [TransactionUnit]?
}

class TransactionUnit: Codable {
    var id: Int?
    var date: String?
    var description: String?
    var transactionType: String?
    var amount: Double?
    var balance: Double?
    var rateId: Int?
    var userCI: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case description
        case transactionType = "transaction_type"
        case amount
        case balance
        case rateId = "rate_id"
        case userCI = "user_ci"
    }
}
