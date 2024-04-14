//
//  Double_Extension.swift
//  Async_Await_CallAPI
//
//  Created by macOS on 14/04/2024.
//

import Foundation

extension Double {
    func toString() -> String {
        return String(format: "%.1f", self)
    }
    func currencyFormat() -> String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
