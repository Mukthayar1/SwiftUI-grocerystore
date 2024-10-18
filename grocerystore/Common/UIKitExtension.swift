//
//  UIKitExtension.swift
//  grocerystore
//
//  Created by Muhammd Mukthayar on 18/10/2024.
//

import Foundation

extension String {
    
    var  isValidEmail : Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
    
}
