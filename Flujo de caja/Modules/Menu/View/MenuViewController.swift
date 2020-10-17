//
//  MenuViewController.swift
//  Flujo de caja
//
//  Created by Fray Pineda on 10/3/20.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var transactionsButton: UIButton!
    @IBOutlet weak var balanceButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        transactionsButton.addTarget(self, action: #selector(transactionsButtontapped), for: .touchUpInside)
        balanceButton.addTarget(self, action: #selector(balanceButtontapped), for: .touchUpInside)
        logoutButton.addTarget(self, action: #selector(logoutButtontapped), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func transactionsButtontapped() {
        self.goToViewcontroller(name: "TransactionsListViewController", title: "Transacciones")
    }
    
    @objc func balanceButtontapped() {
        self.goToViewcontroller(name: "BalanceViewController", title: "Detalle del saldo")
    }
    
    @objc func logoutButtontapped() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
