//
//  UIViewExtension.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 7.06.2023.
//

import Foundation
import UIKit
extension UIView{
    func paddingPage() {
        
        let padding = 25
        translatesAutoresizingMaskIntoConstraints = false
        self.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
            
        }
    }
}
