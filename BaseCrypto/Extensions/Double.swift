//
//  Double.swift
//  BaseCrypto
//
//  Created by Dũng Nguyễn on 8/11/24.
//

import Foundation


extension Double {
    
    ///converts a bouble into a currency with 2-6 places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    /// ```
    
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current // default value
        formatter.currencyCode = "usd" // change currency
        formatter.currencySymbol = "$" // change currency symbol
        
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    ///converts a bouble into a currency as a string with 2-6 places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    /// ```
    
    
    func asCurrencyWith6Decimals()-> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from:number) ?? "$0.00"
    }
    
    
    ///converts a bouble into string  with 2-6 places
    /// ```
    /// Convert 12.3456 to $12.35
    /// ```
    func asNumberString()-> String {
        return String(format: "%.2f", self)
    }
    
    
    ///converts a bouble into string  with 2-6 places with symbol
    /// ```
    /// Convert 12.3456 to $12.35
    /// ```
    
    func asPercentString()-> String {
        return asNumberString()+"%"
    }
}
