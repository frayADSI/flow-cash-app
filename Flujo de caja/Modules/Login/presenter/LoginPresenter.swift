//
//  LoginPresenter.swift
//  Flujo de caja
//
//  Created by Fray Pineda on 10/4/20.
//

import Foundation
import UIKit

protocol LoginView {
    func loginUserSucceded(user: User)
    func loginUserFailed(error: String)
}

class LoginPresenter {
    
    var view: LoginView?
    
    init(view: LoginView) {
        self.view = view
    }
    
    func loginUser(dict: [String: Any]) {
        LoginServices.loginUser(dict: dict, successBlock: { [weak self] user in
            self?.view?.loginUserSucceded(user: user)
        }, errorBlock: { [weak self] error in
            self?.view?.loginUserFailed(error: error)
        })
    }
}
