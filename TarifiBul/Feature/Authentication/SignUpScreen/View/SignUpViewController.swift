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
    private let userNameLabel : BoldLabel = {
        let label = BoldLabel()
        label.text = LocaleKeys.userName.locale
        return label
    }()
    let userTextField = UserTextField(validator: true)
    private let emailLabel : BoldLabel = {
        let label = BoldLabel()
        label.text = LocaleKeys.emailAddress.locale
        return label
    }()
    let emailTextField = UserTextField(validator: true)
    let passwordLabel : UILabel = {
        let label = UILabel()
        label.text = LocaleKeys.password.locale
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.font = label.font.withSize(14)
        return label
    }()
    let passwordTextField = PasswordTextField(validator: true)
    private lazy var registerButton : LoadingButton = {
        let button = LoadingButton()
        button.setTitle(LocaleKeys.login.locale, for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    @objc func registerButtonTapped() {
        changeButtonLoadingState()
        if(userTextField.isValidate){
            //  presenter?.fetchLogin(userName: userTextField.text!, password: passwordTextField.text!)
        }
    }
    func changeButtonLoadingState(){
        if(userTextField.isValidate){
            registerButton.changeLoadingState()
        }
    }
}
extension SignUpViewController {
    
    func configure(){
        addSubViews()
        setupAll()
    }
    func addSubViews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(userNameLabel)
        stackView.addArrangedSubview(userTextField)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordLabel)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(registerButton)
    }
    func setupAll(){
        setupView()
        setupUserTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupRegisterButton()
    }
    func setupView(){
        view.backgroundColor = .white
        stackView.paddingPageModalView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 15
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
   func setupUserTextField() {
       userTextField.placeholder = LocaleKeys.userName.locale
       userTextField.snp.removeConstraints()
       userTextField.snp.makeConstraints{ make in
           make.width.equalTo(stackView)
           make.height.equalTo(UIConstant.textFieldHeight)
       }
       
    }
    func setupEmailTextField() {
        emailTextField.placeholder = LocaleKeys.emailAddress.locale
        emailTextField.snp.removeConstraints()
        emailTextField.snp.makeConstraints{ make in
            make.width.equalTo(stackView)
            make.height.equalTo(UIConstant.textFieldHeight)
        }
     }
    func setupPasswordTextField() {
        passwordTextField.snp.removeConstraints()
        passwordTextField.snp.makeConstraints{ make in
            make.width.equalTo(stackView)
            make.height.equalTo(UIConstant.textFieldHeight)
        }
     }
    func setupRegisterButton(){
        registerButton.snp.makeConstraints { make in
            make.width.equalTo(stackView)
        }
    }
    
}
