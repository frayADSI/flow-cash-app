//
//  TransactionsListViewController.swift
//  Flujo de caja
//
//  Created by Fray Pineda on 10/3/20.
//

import UIKit

class TransactionsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNav(icon: #imageLiteral(resourceName: "back"), target: self, action: #selector(backAction))
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.setupTableView()
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell") as! TransactionCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 164.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.getViewController(name: "TransactionDetailViewController")
        vc.title = "Detalle de la transacción"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
