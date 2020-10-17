//
//  MenuPresenter.swift
//  Flujo de caja
//
//  Created by Fray Pineda on 10/17/20.
//

import Foundation

protocol MenuView {
    func getTransactionsSucceded(transactions: Transaction)
    func getTransactionsFailed(error: String)
}

class MenuPresenter {
    var view: MenuView?
    init(view: MenuView) {
        self.view = view
    }
    
    func getTransactions() {
        MenuServices.getTransactions(successBlock: { [weak self] transactions in
            self?.view?.getTransactionsSucceded(transactions: transactions)
        }, errorBlock: { [weak self] error in
            self?.view?.getTransactionsFailed(error: error)
        })
    }
    
}

