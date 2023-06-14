//
//  SignInViewController.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 8.06.2023.
//

import UIKit
protocol ISignInView {
    var presenter : ISignInPresenter? {get set}
    func showLoginResponse(with loginResponse : LoginResponseModel?)
    func showLoginResponse(with error : String)
}
class SignInViewController: UIViewController,ISignInView {
    var presenter: ISignInPresenter?
    private let paddingValue = 25
    private let userNameorEmailLabel : UILabel = {
        let label = UILabel()
        label.text = LocaleKeys.userNameOrEmail.locale
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail  // üç nokta şeklinde belirtir eğer aşarsa. yukarısını 0 yaptığım için büyük ihtimal burası çalışmaz. 0 yapınca sınırsız oluyor
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.font = label.font.withSize(14)
        return label
    }()
    private let userTextField = UserTextField(validator: true)
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
    private let passwordTextField = PasswordTextField(validator: true)
    private let forgotPasswordButton : UIButton = {
        let button = UIButton()
        button.setTitle(LocaleKeys.forgotPassword.locale, for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var loginButton : LoadingButton = {
        let button = LoadingButton()
        button.setTitle(LocaleKeys.login.locale, for: .normal)
        button.setTitleColor(.white, for: .normal)

        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        return button
    }()
    var  paddingView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
       configure()
    }
    @objc func loginButtonTapped() {
        if(userTextField.isValidate){
            loginButton.changeLoadingState()
            print(loginButton.isLoading)
            presenter?.fetchLogin(userName: userTextField.text!, password: passwordTextField.text!)
            loginButton.changeLoadingState()
            print(loginButton.isLoading)
    
        }
    }
    func showLoginResponse(with loginResponse: LoginResponseModel?) {
        if(loginResponse?.success==true){
            let alert = SuccessAlert(title: nil, message: loginResponse?.token, preferredStyle: .alert)
            present(alert,animated: true,completion: nil)
        }
        else {
            let alert = ErrorAlert(title: nil, message: loginResponse?.message, preferredStyle: .alert)
            present(alert,animated: true,completion: nil)
        }
        
    }
    func showLoginResponse(with error: String) {
        let alert = ErrorAlert(title: nil, message: error, preferredStyle: .alert)
        present(alert,animated: true,completion: nil)
       
    }
}
extension SignInViewController {
    
    func configure(){
        addSubviews()
        setupAll()
        
    }
    func addSubviews(){
        view.addSubview(paddingView)
        view.addSubview(userNameorEmailLabel)
        view.addSubview(userTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
    }
    func setupAll() {
        setupView()
        setupPaddingView()
        setupUserNameLabel()
        setupUserTextField()
        setupPasswordLabel()
        setupPasswordTextField()
        setupForgotPasswordButton()
        setupLoginButton()
    }
    func setupView() {
        view.backgroundColor = .white
        
    }
    func setupPaddingView() {
        paddingView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(25)
            make.bottom.equalTo(view)
            paddingView.paddingPage()
            
        }
        paddingView.paddingPage()
        
    }
    func setupUserNameLabel() {
        userNameorEmailLabel.snp.makeConstraints { make in
            make.top.equalTo(paddingView)
            make.leading.equalTo(paddingView)
        }
    }
    
    func setupUserTextField() {
        userTextField.snp.makeConstraints { make in
            make.top.equalTo(userNameorEmailLabel.snp.bottom).offset(paddingValue-15)
            make.leading.equalTo(paddingView)
        
        }
    }
    func setupPasswordLabel() {
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(userTextField.snp.bottom).offset(paddingValue)
            make.leading.equalTo(paddingView)
        }
    }
    
    func setupPasswordTextField() {
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(paddingValue-15)
            make.leading.equalTo(paddingView)
        }
    }
    func setupForgotPasswordButton() {
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(paddingValue)
            make.trailing.equalTo(passwordTextField)
        }
    }
    func setupLoginButton() {
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(paddingValue)
            make.centerX.equalTo(paddingView.snp.centerX)
            make.width.equalTo(paddingView)
            make.height.equalTo(50)
            
        }
    }
}
