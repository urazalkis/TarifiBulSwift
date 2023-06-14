//
//  SignUpViewController.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 14.06.2023.
//

import UIKit

protocol SignUpViewProtocol {
    var presenter : SignUpPresenterProtocol? {get set}
}
class SignUpViewController: UIViewController,SignUpViewProtocol {
    var presenter: SignUpPresenterProtocol?
    
      let stackView = UIStackView()
      let userTextField = UserTextField(validator: true)
    override func viewDidLoad() {
        super.viewDidLoad()
configure()
    }
    

}

extension SignUpViewController {
    
    func configure(){
        addSubViews()
        setupAll()
    }
    func addSubViews() {
        view.addSubview(stackView)
        stackView.addSubview(userTextField)
    }
    func setupAll(){
        setupView()
        setupUserTextField()
    }
    func setupView(){
        view.backgroundColor = .white
        stackView.alignment = .leading
       
        stackView.paddingPageModalView()
    }
    func setupUserTextField() {
    
    }
}
