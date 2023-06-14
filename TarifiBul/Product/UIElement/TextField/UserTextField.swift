//
//  UserTextField.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 8.06.2023.
//

import Foundation
import UIKit
class UserTextField: StandardTextField {
    private let prefixView: UIView = {
        let view = UIView()
    
        return view
    }()
    
    private let prefixImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .gray
        return imageView
    }()
    
    private let hint = LocaleKeys.userNameOrEmail.locale
    
    override init(validator: Bool?) {
        super.init(validator: validator)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        clearButtonMode = .whileEditing
        placeholder = hint
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.black.cgColor
        
        leftView = prefixView
        leftViewMode = .always
        
        prefixView.addSubview(prefixImageView)
        prefixImageView.snp.makeConstraints { make in
            //make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)) //alttakinin aynısı gibi
            make.center.equalToSuperview()
            make.leftMargin.equalTo(10)
        }
        
        // Sol kenar için boşluk eklemek için TextField'in layoutConstraint'lerini güncelle
        self.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(45)
        }
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}

