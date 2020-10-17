//
//  ViewController.swift
//  Flujo de caja
//
//  Created by Fray Pineda on 10/3/20.
//

import UIKit

class ViewController: UIViewController {

    //MARK: properties
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: LoginPresenter?
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewController()
        self.presenter = LoginPresenter(view: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setupViewController() {
        self.loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    @objc func loginTapped() {
        if let user = self.userTextField.text, let password = self.passwordTextField.text {
            let dict = [
                "email": user,
                "password": password
            ]
            self.activityIndicator.startAnimating()
            presenter?.loginUser(dict: dict)
        }
    }


}

extension ViewController: LoginView {
    
    func loginUserSucceded(user: User) {
        print("user: \(user)")
        self.activityIndicator.stopAnimating()
        UserDefaults.standard.set(true, forKey: Constants.UserDefaults.loging)
        self.goToViewcontroller(name: "MenuViewController", title: "")
    }
    
    func loginUserFailed(error: String) {
        self.activityIndicator.stopAnimating()
        self.showAlert(title: "Error", message: error)
    }
    
    
}


