//
//  SignInInteractor.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 9.06.2023.
//

import Foundation

protocol ISignInInteractor{
    var presenter : ISignInPresenter? { get set}
    func fetchLoginResponse(userName:String,password:String)
}

final class SignInInteractor : ISignInInteractor {
    var presenter: ISignInPresenter?
    
    func fetchLoginResponse(userName:String,password:String) {
        let loginModel = SignInModel(username: userName, password: password)
        NetworkManager.shared.post(path: .login,model: loginModel) { (response:SignInResponseModel) in
            self.presenter?.interactorDidFetchLogin(result: .success(response))
        
        } onError: { error in
            self.presenter?.interactorDidFetchLogin(result: .failure(error))
         
        }
    }
}
