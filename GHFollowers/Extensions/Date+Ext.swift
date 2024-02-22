//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Fede Garcia on 18/04/2024.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        return formatted(.dateTime.month().year())
    }
}
