//
//  TransactionDetailViewController.swift
//  Flujo de caja
//
//  Created by Fray Pineda on 10/3/20.
//

import UIKit

class TransactionDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNav(icon: #imageLiteral(resourceName: "back"), target: self, action: #selector(backAction))
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
