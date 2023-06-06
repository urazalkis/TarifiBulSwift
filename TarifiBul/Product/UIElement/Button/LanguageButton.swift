//
//  LanguageButton.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 1.06.2023.
//

import UIKit

/*class LanguageButton: UIButton {
    private var pickerView: UIPickerView!
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupButton()
        setupPickerView()
    
        }
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupButton()
        
        }
    private func setupButton() {
            // Buton özel özelliklerini burada ayarlayabilirsiniz
        backgroundColor = UIColor(named: ColorName.oriolesOrange.rawValue)
        setTitle(Languages.turkish.rawValue, for: .normal)
            setTitleColor(.white, for: .normal)
            layer.cornerRadius = 10
            addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        }
    @objc private func buttonClicked() {
        let alertController = UIAlertController(title: "Language", message: nil, preferredStyle: .alert)
                alertController.view.addSubview(pickerView)
                
                let pickerViewHeight: CGFloat = 300 // Example height, adjust as needed
                pickerView.translatesAutoresizingMaskIntoConstraints = false
                pickerView.centerXAnchor.constraint(equalTo: alertController.view.centerXAnchor).isActive = true
                pickerView.centerYAnchor.constraint(equalTo: alertController.view.centerYAnchor).isActive = true
                pickerView.widthAnchor.constraint(equalTo: alertController.view.widthAnchor).isActive = true
                pickerView.heightAnchor.constraint(equalToConstant: pickerViewHeight).isActive = true
                
                guard let viewController = UIApplication.shared.keyWindow?.rootViewController else { return }
                viewController.present(alertController, animated: true, completion: nil)
        }
    
}

extension LanguageButton : UIPickerViewDelegate, UIPickerViewDataSource {
    private func setupPickerView() {
            pickerView = UIPickerView()
            pickerView.delegate = self
            pickerView.dataSource = self
        }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
   
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Languages.allCases.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Languages.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedTitle = Languages.allCases[row].rawValue
        setTitle(selectedTitle, for: .normal)
    }
    
}

enum Languages: String,CaseIterable {
    case turkish = "Türkçe"
    case english = "English"
}
*/
