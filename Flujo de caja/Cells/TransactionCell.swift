//
//  TransactionCell.swift
//  Flujo de caja
//
//  Created by Fray Pineda on 10/4/20.
//

import UIKit

class TransactionCell: UITableViewCell {

    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCell(transaction: TransactionUnit) {
        self.amountLabel.text = "COP \(transaction.amount ?? 0)" 
        self.idLabel.text = "\(transaction.id ?? 0)"
        self.dateLabel.text = transaction.date ?? ""
        self.typeLabel.text = transaction.transactionType ?? ""
    }
    
}
