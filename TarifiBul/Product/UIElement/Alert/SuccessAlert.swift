//
//  SuccessAlert.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 9.06.2023.
//

import Foundation
import UIKit

final class SuccessAlert : UIAlertController {
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           setupAlert()
       }
    private func setupAlert(){
        title = LocaleKeys.success.locale
        view.subviews.first?.backgroundColor = .systemGreen
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
    }
}
