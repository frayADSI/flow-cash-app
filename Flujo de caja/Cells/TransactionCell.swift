//
//  TransactionCell.swift
//  Flujo de caja
//
//  Created by Fray Pineda on 10/4/20.
//

import UIKit

class TransactionCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
