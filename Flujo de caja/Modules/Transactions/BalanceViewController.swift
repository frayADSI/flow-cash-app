//
//  BalanceViewController.swift
//  Flujo de caja
//
//  Created by Fray Pineda on 10/3/20.
//

import UIKit

class BalanceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNav(icon: #imageLiteral(resourceName: "back"), target: self, action: #selector(self.backAction))
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

}
