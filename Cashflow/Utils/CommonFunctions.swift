//
//  CommonFunctions.swift
//  Cashflow
//
//  Created by Chamod Shehanka Perera on 2022-07-27.
//

import Foundation
import UIKit

class CommonFunctions
{
    func getFormattedDecimalDouble(value: Double) -> Double
    {
        return (value * 100).rounded() / 100
    }
    
    func getFormattedDecimalString(value: Double) -> String
    {
        return String(format: "%.02f", value)
    }
}
