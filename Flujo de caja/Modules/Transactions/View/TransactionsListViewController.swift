//
//  TransactionsListViewController.swift
//  Flujo de caja
//
//  Created by Fray Pineda on 10/3/20.
//

import UIKit

class TransactionsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var transactions = [TransactionUnit]()
    var presenter: MenuPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNav(icon: #imageLiteral(resourceName: "back"), target: self, action: #selector(backAction))
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.setupTableView()
        self.presenter = MenuPresenter(view: self)
        self.activityIndicator.startAnimating()
        self.presenter?.getTransactions()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerCell(named: "TransactionCell")
    }

    
}

extension TransactionsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell") as! TransactionCell
        if indexPath.row < transactions.count {
            cell.setupCell(transaction: transactions[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 164.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.getViewController(name: "TransactionDetailViewController") as! TransactionDetailViewController
        vc.title = "Detalle de la transacción"
        if indexPath.row < transactions.count {
            vc.currentTransaction = transactions[indexPath.row]
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension TransactionsListViewController: MenuView {
    func getTransactionsSucceded(transactions: Transaction) {
        self.activityIndicator.stopAnimating()
        if let tran = transactions.transactions {
            self.transactions = tran
            self.tableView.reloadData()
        }
    }
    
    func getTransactionsFailed(error: String) {
        self.activityIndicator.stopAnimating()
        self.showAlert(title: "Error", message: error)
    }
}
