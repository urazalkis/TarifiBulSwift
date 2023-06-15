//
//  CircularButton.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 7.06.2023.
//

import Foundation
import UIKit


class CircularButton: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        setTitleColor(.white, for: .normal)
        frame.size = CGSize(width:200 , height: 60)
        backgroundColor = UIColor(named: ColorName.oriolesOrange.rawValue)
        layer.borderWidth = 0
        layer.cornerRadius = 15
        setTitleColor(.white, for: .normal)
        
        snp.makeConstraints { make in
            make.height.equalTo(UIConstant.buttonHeight)
        }
    }
    
    
}


