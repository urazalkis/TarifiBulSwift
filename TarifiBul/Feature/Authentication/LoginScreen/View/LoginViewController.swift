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
    func update(with loginResponse : LoginResponseModel?)
    func update(with error : String)
}
class LoginViewController: UIViewController,ILoginView{
    var presenter: ILoginPresenter?

    var mybutton : UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()

    @objc func buttonTapped() {
        // Buton tıklandığında yapılacak işlemleri buraya yazın
        print("merhaba")
    }
    func update(with loginResponse: LoginResponseModel?) {
       // print(loginResponse?.success)
        //print(loginResponse?.data?.username)
    }
    
    func update(with error: String) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        view.backgroundColor = .white
        addSubviews()
        setButtonConstrait()
    
        
    }
  
}
extension LoginViewController{
    func addSubviews(){
        view.addSubview(mybutton)
    }
    
    func setButtonConstrait() {
        mybutton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    func setBackgroundColor(){
        
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
