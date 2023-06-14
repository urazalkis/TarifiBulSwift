//
//  PasswordTextField.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 12.06.2023.
//

import Foundation
import UIKit

class PasswordTextField : StandardTextField , UITextFieldDelegate{
    private let passwordButton = UIButton(type: .custom)
    private var isPasswordVisible = false
    private let prefixView = UIView()
    private let hint = LocaleKeys.password.locale

    private let passwordButtonView: UIView = {
        let view = UIView()
    
        return view
    }()
    
    override init(validator: Bool?) {
        super.init(validator: validator)
        setupTextField()
        setupPasswordButton()
        setupPrefixView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextField() {
        delegate = self
        isSecureTextEntry = true
        clearButtonMode = .whileEditing
        placeholder = hint
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.black.cgColor
       // translatesAutoresizingMaskIntoConstraints = false
       
        
    }
    private func setupPasswordButton(){
        passwordButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
                passwordButton.setImage(UIImage(systemName: "eye.fill"), for: .selected)
                passwordButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
                passwordButton.contentMode = .center
                passwordButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
                
                rightView = passwordButtonView
                rightViewMode = .always
        
        passwordButtonView.addSubview(passwordButton)
        passwordButton.snp.makeConstraints { make in
            //make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)) //alttakinin aynısı gibi
            make.center.equalToSuperview()
            make.right.equalToSuperview().offset(-15)
        }
    }
    private func setupPrefixView (){
        
        leftView = prefixView
        leftViewMode = .always
        prefixView.snp.makeConstraints { make in
            make.width.equalTo(15)
        }
       
    }
    @objc private func togglePasswordVisibility() {
            isPasswordVisible = !isPasswordVisible
            isSecureTextEntry = !isPasswordVisible
            
            passwordButton.isSelected = isPasswordVisible
        }

}
