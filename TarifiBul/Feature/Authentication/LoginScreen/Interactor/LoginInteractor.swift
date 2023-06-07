//
//  LoginInteractor.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 5.06.2023.
//

import Foundation
import Alamofire
//talks to presenter
protocol ILoginInteractor{
    var presenter : ILoginPresenter? { get set}
    func fetchLoginResponse(userName:String,password:String)
}

class LoginInteractor : ILoginInteractor {
    var presenter: ILoginPresenter?
    
    func fetchLoginResponse(userName:String,password:String) {
        
        let loginModel = LoginModel(username: userName, password: password)
        NetworkManager.shared.post(path: .login,model: loginModel) { (response:LoginResponseModel) in            
            self.presenter?.interactorDidFetchLogin(result: .success(response))
        } onError: { error in
            self.presenter?.interactorDidFetchLogin(result: .failure(error));
        }

       
    }
        
    
}
