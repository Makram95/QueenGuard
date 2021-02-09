//
//  StringExtension.swift
//  QueenGuard
//
//  Created by Marc on 08.02.21.
//

import Foundation

extension String {
    var isNumeric : Bool {
        return Double(self) != nil
    }
}
