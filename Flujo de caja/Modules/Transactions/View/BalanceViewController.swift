//
//  BalanceViewController.swift
//  Flujo de caja
//
//  Created by Fray Pineda on 10/3/20.
//

import UIKit

class BalanceViewController: UIViewController {

    var presenter: MenuPresenter?
    var balance: Double = 0
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var balanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNav(icon: #imageLiteral(resourceName: "back"), target: self, action: #selector(self.backAction))
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.presenter = MenuPresenter(view: self)
        self.activityIndicator.startAnimating()
        self.presenter?.getTransactions()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

}

extension BalanceViewController: MenuView {
    func getTransactionsSucceded(transactions: Transaction) {
        self.activityIndicator.stopAnimating()
        if let amount = transactions.balance {
            self.balance = amount
        }
        self.balanceLabel.text = "COP \(self.balance)"
    }
    
    func getTransactionsFailed(error: String) {
        self.activityIndicator.stopAnimating()
        self.showAlert(title: "Error", message: error)
    }
}
