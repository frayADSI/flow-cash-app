//
//  LoginServices.swift
//  Flujo de caja
//
//  Created by Fray Pineda on 10/4/20.
//

import Foundation
import Alamofire

class LoginServices {
    
    static func loginUser(dict:[String: Any], successBlock: @escaping (_ user: User)->(), errorBlock: @escaping (_ error: String) -> ()) {
        let url = API.Login.loginUser
        print("url: \(url)")
        print(dict)
        AF.request(url, method: .post, parameters: dict).responseJSON { response in
            let statusCode = response.response?.statusCode ?? 0
            print("code: \(statusCode)")
            switch statusCode {
            case 200:
                if let res = response.value as? [String: Any], let completeData = res["data"] as? [String: Any], let data = completeData["user"] {

                    if !JSONSerialization.isValidJSONObject(data) {
                        errorBlock("Ha ocurrido un error")
                    }
                    if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: .prettyPrinted) {
                        let decoder = JSONDecoder()
                        
                        do {
                            let user = try decoder.decode(User.self, from: jsonData)
                            successBlock(user)
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
