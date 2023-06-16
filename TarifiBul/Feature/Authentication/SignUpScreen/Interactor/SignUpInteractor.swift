//
//  SignUpInteractor.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 14.06.2023.
//

import Foundation

protocol SignUpInteractorProtocol{
    var presenter : SignUpPresenterProtocol? { get set}
    func fetchLoginResponse(userName:String,email:String,password:String)
}

final class SignUpInteractor : SignUpInteractorProtocol {
    
    var presenter: SignUpPresenterProtocol?
    
    func fetchLoginResponse(userName: String, email: String, password: String) {
        let registerModel = SignUpModel(username: userName,email: email, password: password)
        NetworkManager.shared.post(path: .register, model: registerModel) { response in
            self.presenter?.interactorDidFetchRegister(result: .success(response))
        } onError: { error in
            self.presenter?.interactorDidFetchRegister(result:.failure(error))
        }

    }
}
