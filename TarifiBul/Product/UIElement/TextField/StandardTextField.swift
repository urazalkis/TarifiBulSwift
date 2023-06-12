//
//  StandardTextFormField.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 12.06.2023.
//

import Foundation
import UIKit

class StandardTextField : UITextField {
    var validator : Bool?
    var isValidate : Bool = true
    var validationLabel = UILabel()
    
     init(frame: CGRect,validator : Bool?) {
        super.init(frame: frame)
        self.validator = validator
          setupTextField()
          setupValidationLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextField() {
       // frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: 300, height: 45)
        clearButtonMode = .whileEditing
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.black.cgColor
        leftViewMode = .always
        translatesAutoresizingMaskIntoConstraints = false
        self.addTarget(self, action: #selector(textFieldDidChange(_:)), for:.editingChanged)
       snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(45)
        }
    }
    private func setupValidationLabel() {
        //validationLabel.text = validationString()
        validationLabel.textColor = .red
        addSubview(validationLabel)
        validationLabel.font = UIFont.systemFont(ofSize: 12)
        validationLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(20)

         }
    }
    @objc func textFieldDidChange(_ textField:UITextField){
        validationLabel.text = validationString()
    }
}
extension StandardTextField {
    func validationString() -> String?{
       if self.validator==true{
           if(text!.isEmpty){
               isValidate = false
               return LocaleKeys.dontEmptyThisField.locale
           }
           else  {
               isValidate = true
               return nil
           }
        }
        else {
            isValidate = true
            return nil
        }
    }
}
