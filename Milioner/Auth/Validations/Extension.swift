//
//  Extension.swift
//  Milioner
//
//  Created by Bakhtiyar Pirizada on 16.10.24.
//

import Foundation
import UIKit
extension String {
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
}
