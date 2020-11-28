//
//  NSNumberFormatter.swift
//  PasswordMaker
//
//  Created by Elliot Maisl on 28/11/2020.
//

import Foundation

class OnlyIntegerFormatter: NumberFormatter {
    override func isPartialStringValid(_ partialString: String, newEditingString newString: AutoreleasingUnsafeMutablePointer<NSString?>?, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        if partialString.isEmpty {
            return true
        }
        return Int(partialString) != nil
    }
}
