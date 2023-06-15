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
    var isValidate : Bool = false
    var validationLabel = UILabel()
    
     init(validator : Bool? = nil) {
         super.init(frame: CGRect(x: 0, y: 0, width: 300, height: 45))
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
       
        autocapitalizationType = .none // büyük harfle başlamasını engellemek için
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
        validationLabel.font = UIFont.systemFont(ofSize: 10)
        validationLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(20)

         }
    }
    @objc func textFieldDidChange(_ textField:UITextField){
        if let validationText = validationString(){
            validationLabel.text = validationString()
        }
        
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
               return ""
           }
        }
        else {
            isValidate = true
            return ""
        }
    }
}
