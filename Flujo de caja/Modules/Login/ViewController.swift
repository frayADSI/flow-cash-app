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
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setupViewController() {
        self.loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    @objc func loginTapped() {
        self.goToViewcontroller(name: "MenuViewController", title: "")
    }


}

