//
//  DateFormatterExtension.swift
//  QueenGuard
//
//  Created by Marc on 09.02.21.
//

import Foundation

public func createMediumDateString(date: Date) -> String{
    let formatter = DateFormatter()
        formatter.dateStyle = .medium
    
    let string = formatter.string(from: date)
     return string
}
