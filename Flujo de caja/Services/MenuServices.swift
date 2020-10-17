//
//  MenuServices.swift
//  Flujo de caja
//
//  Created by Fray Pineda on 10/17/20.
//

import Foundation
import Alamofire

class MenuServices {
    
    static func getTransactions(successBlock: @escaping (_ transactions: Transaction)->(), errorBlock: @escaping (_ error: String) -> ()) {
        let path = API.Transactions.getTransaction
        AF.request(path, method: .get).responseJSON { response in
            let statusCode = response.response?.statusCode ?? 0
            print("code: \(statusCode)")
            switch statusCode {
            case 200:
                if let res = response.value as? [String: Any], let data = res["data"] as? [String: Any] {
                    if !JSONSerialization.isValidJSONObject(data) {
                        errorBlock("Ha ocurrido un error")
                    }
                    if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: .prettyPrinted) {
                        let decoder = JSONDecoder()
                        
                        do {
                            let transactions = try decoder.decode(Transaction.self, from: jsonData)
                            successBlock(transactions)
                        } catch {
                            errorBlock("Ha ocurrido un error")
                        }
                    } else {
                        errorBlock( "Ha ocurrido un error")
                    }
                    
                    
                    
                } else {
                    errorBlock( "Ha ocurrido un error")
                }
                break
            case 401:
                if let data = response.value as? [String: Any], let msg = data["msg"] as? String {
                    errorBlock(msg)
                } else {
                    errorBlock( "Ha ocurrido un error")
                }
                break
            default:
                errorBlock( "Ha ocurrido un error")
                break
        }
    }
}
}
