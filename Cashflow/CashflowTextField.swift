//
//  CashflowTextField.swift
//  Cashflow
//
//  Created by Chamod Shehanka Perera on 2022-07-23.
//

import UIKit

class CashflowTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 250/255, alpha: 1).cgColor
    }

}
