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
        
        let edgePadding = 25
        translatesAutoresizingMaskIntoConstraints = false
        if let safeAreaLayoutGuide = self.superview?.safeAreaLayoutGuide{
            self.snp.makeConstraints { make in
                make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
                make.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin)
                make.leading.equalToSuperview().offset(edgePadding)
                make.trailing.equalToSuperview().offset(-edgePadding)
                
            }
        }
       
    }
    func paddingPageModalView() {
        
        let edgePadding = 25
        let topBottomPadding = 25
        translatesAutoresizingMaskIntoConstraints = false
        if let safeAreaLayoutGuide = self.superview?.safeAreaLayoutGuide{
            self.snp.makeConstraints { make in
                make.top.equalTo(safeAreaLayoutGuide.snp.topMargin).offset(topBottomPadding)
                make.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin).offset(-topBottomPadding)
                make.leading.equalToSuperview().offset(edgePadding)
                make.trailing.equalToSuperview().offset(-edgePadding)
                
            }
        }
       
    }
}
