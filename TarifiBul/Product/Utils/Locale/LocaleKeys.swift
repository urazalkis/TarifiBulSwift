//
//  LocaleKeys.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 1.06.2023.
//

import Foundation
import UIKit

struct LocaleKeys {
    static let recipeIngredients = "recipeIngredients"
    static let later = "later"
    static let login = "login"
    static let createNewAccount = "createNewAccount"
}

extension String {
    var locale:String {
        return NSLocalizedString(self, comment: "")
    }
}
