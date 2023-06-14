//
//  ViewController.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 31.05.2023.
//

import UIKit
import Foundation
import SnapKit

// talks to - presenter
protocol ILoginView {
    var presenter : ILoginPresenter? {get set}

}
class LoginViewController: UIViewController,ILoginView{
    var presenter: ILoginPresenter?

    let safeAreaView = UIView()

    let groupImage = UIImageView(image:UIImage(named:ImageName.ingredientGroup.rawValue))
    let recipeTextLabel = UILabel()
    private lazy var loginButton : CircularButton = {
        let button = CircularButton()
        button.setTitle(LocaleKeys.login.locale, for: .normal)
        button.setTitleColor(.white, for: .normal)

        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var createNewAccountButton : UIButton = {
        let button = UIButton()
        button.setTitle(LocaleKeys.createNewAccount.locale, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(newAccountButtonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var laterButton : UIButton = {
        let button = UIButton()
        button.setTitle(LocaleKeys.later.locale, for: .normal)
        button.setTitleColor(UIColor(named: ColorName.oriolesOrange.rawValue), for: .normal)
        button.addTarget(self, action: #selector(newAccountButtonTapped), for: .touchUpInside)
        return button
    }()
    @objc func loginButtonTapped() {

        presenter?.router?.navigateToSignIn()
    }
    @objc func newAccountButtonTapped() {
        presenter?.router?.navigateToSignUp()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configure()
        
    }
  
}

extension LoginViewController{
    func configure(){
        setupBackgroundColor()
        addSubviews()
        setupAll()
    }
    func addSubviews(){
        view.addSubview(safeAreaView)
        view.addSubview(groupImage)
        view.addSubview(recipeTextLabel)
        view.addSubview(loginButton)
        view.addSubview(createNewAccountButton)
        view.addSubview(laterButton)
    }
    func setupAll () {
        setupSafeAreaView()
        setupGroupImage()
        setupRecipeTextLabel()
        setupLoginButton()
        setupCreateAccountButton()
        setupLaterButton()
    }
    func setupSafeAreaView(){
        //safeAreaView.backgroundColor = .green
        safeAreaView.snp.makeConstraints { make in
        //make.edges.equalTo(view.safeAreaLayoutGuide)
            safeAreaView.paddingPage()
            /*make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin) // Safe area üst kenarına hizala
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)*/
            
        }
        
    }
    func setupGroupImage(){
        groupImage.contentMode = .scaleAspectFit
        groupImage.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaView)
            make.centerY.equalTo(safeAreaView).offset(-100)
            make.width.equalTo(safeAreaView).multipliedBy(0.90)
            make.height.equalTo(groupImage.snp.width)
        }
    }
    func setupRecipeTextLabel() {
        recipeTextLabel.text = LocaleKeys.recipeIngredients.locale
        recipeTextLabel.numberOfLines = 0
        recipeTextLabel.lineBreakMode = .byTruncatingTail  // üç nokta şeklinde belirtir eğer aşarsa. yukarısını 0 yaptığım için büyük ihtimal burası çalışmaz. 0 yapınca sınırsız oluyor
        recipeTextLabel.textColor = .white
        recipeTextLabel.font = recipeTextLabel.font.withSize(24)
        recipeTextLabel.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaView)
            make.top.equalTo(groupImage.snp.bottom).offset(50)

        }
    }
    func setupLoginButton() {
        loginButton.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaView)
            make.top.equalTo(recipeTextLabel.snp.bottom).offset(50)
            make.width.equalTo(safeAreaView)
            make.height.equalTo(50)
        }
    }
    func setupCreateAccountButton() {
        createNewAccountButton.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaView)
            make.top.equalTo(loginButton.snp.bottom).offset(50)
            
        }
    }
    func setupLaterButton() {
        laterButton.snp.makeConstraints { make in
            
            make.top.equalTo(safeAreaView)
            make.trailing.equalTo(safeAreaView)
            
        }
    }
    func setupBackgroundColor(){
        
        let gradientView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
    
            UIColor(named: ColorName.russianViolet.rawValue)?.cgColor ?? UIColor.white.cgColor,
            UIColor(named: ColorName.darkCerulean.rawValue)?.cgColor ?? UIColor.white.cgColor
        ]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.frame = gradientView.bounds
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
        view.addSubview(gradientView)
    }
 
}
