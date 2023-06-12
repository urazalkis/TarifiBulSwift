//
//  ErrorAlert.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 9.06.2023.
//

import Foundation
import UIKit

final class ErrorAlert : UIAlertController {
    override func viewDidLoad() {
        setupAlert()
    }
    private func setupAlert(){
        title = LocaleKeys.error.locale
        view.subviews.first?.backgroundColor = .systemRed
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
    }
}
