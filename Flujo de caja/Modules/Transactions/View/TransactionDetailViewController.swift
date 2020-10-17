//
//  TransactionDetailViewController.swift
//  Flujo de caja
//
//  Created by Fray Pineda on 10/3/20.
//

import UIKit

class TransactionDetailViewController: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    var currentTransaction: TransactionUnit?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNav(icon: #imageLiteral(resourceName: "back"), target: self, action: #selector(backAction))
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setupUI() {
        if let transaction = self.currentTransaction {
            self.idLabel.text = "\(transaction.id ?? 0)"
            self.dateLabel.text = transaction.date
            self.typeLabel.text = transaction.transactionType
            self.descriptionLabel.text = transaction.description
            self.amountLabel.text = "COP \(transaction.amount ?? 0)"
        }
    }

}
