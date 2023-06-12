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
    private let userTextField = UserTextField(frame: CGRect(), validator: true)
    let passwordLabel : UILabel = {
        let label = UILabel()
        label.text = LocaleKeys.password.locale
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail  // üç nokta şeklinde belirtir eğer aşarsa. yukarısını 0 yaptığım için büyük ihtimal burası çalışmaz. 0 yapınca sınırsız oluyor
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.font = label.font.withSize(14)
        return label
    }()
    private let passwordTextField = UserTextField(frame: CGRect(), validator: true)
    
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
            presenter?.fetchLogin(userName: userTextField.text!, password: passwordTextField.text!)
        }
    }
    func showLoginResponse(with loginResponse: LoginResponseModel?) {
        let alert = SuccessAlert(title: nil, message: loginResponse?.token, preferredStyle: .alert)
        present(alert,animated: true,completion: nil)
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
        view.addSubview(loginButton)
    }
    func setupAll() {
        setupView()
        setupPaddingView()
        setupUserNameLabel()
        setupUserTextField()
        setupPasswordLabel()
        setupPasswordTextField()
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
            make.top.equalTo(userNameorEmailLabel.snp.bottom).offset(15)
            make.leading.equalTo(userNameorEmailLabel)
        
        }
    }
    func setupPasswordLabel() {
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(userTextField.snp.bottom).offset(15)
            make.leading.equalTo(paddingView)
        }
    }
    func setupPasswordTextField() {
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(15)
            make.leading.equalTo(passwordLabel)
        }
    }
    func setupLoginButton() {
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
            make.centerX.equalTo(paddingView.snp.centerX)
            make.width.equalTo(paddingView)
            make.height.equalTo(50)
            
        }
    }
}
