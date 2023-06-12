//
//  UserTextField.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 8.06.2023.
//

import Foundation
import UIKit
class UserTextField : StandardTextField{
    private let prefixImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .gray
        imageView.frame = CGRect(x: 0, y: 0, width: 60, height: 40)
        
        return imageView
        
    }()
    private let hint = LocaleKeys.userNameOrEmail.locale
    
    
    override init(frame: CGRect, validator: Bool?) {
        super.init(frame: frame, validator: validator)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        // frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: 300, height: 45)
        clearButtonMode = .whileEditing
        placeholder = hint
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.black.cgColor
        leftView = prefixImageView
        leftViewMode = .always
        translatesAutoresizingMaskIntoConstraints = false
        
        snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(45)
        }
    }
}
