//
//  Label.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 15.06.2023.
//

import Foundation
import UIKit

class BoldLabel : UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel(){
        numberOfLines = 0
        lineBreakMode = .byTruncatingTail  // üç nokta şeklinde belirtir eğer aşarsa. yukarısını 0 yaptığım için büyük ihtimal burası çalışmaz. 0 yapınca sınırsız oluyor
        textColor = .black
        UIFont.boldSystemFont(ofSize: 16).withSize(14)
        //let myFont = UIFont.boldSystemFont(ofSize: 16)
        //font = myFont.withSize(14)
    }
}
