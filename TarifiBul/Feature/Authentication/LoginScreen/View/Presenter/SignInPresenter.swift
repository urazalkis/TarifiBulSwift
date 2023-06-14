//
//  SignInPresenter.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 9.06.2023.
//

import Foundation

protocol ISignInPresenter {
    var router : ISignInRouter? { get set }
    var interactor : ISignInInteractor? {get set}
    var view : ISignInView? {get set}
    func fetchLogin(userName:String, password: String)
    func interactorDidFetchLogin(result : Result<LoginResponseModel,Error>)
}

final class SignInPresenter : ISignInPresenter {
   
    
    var router: ISignInRouter?
    var interactor: ISignInInteractor?
    var view: ISignInView?
    
    func fetchLogin(userName:String, password: String){
        print("fetchlogin tiklandi")
        interactor?.fetchLoginResponse(userName: userName, password: password)
        
    }
    func interactorDidFetchLogin(result: Result<LoginResponseModel, Error>) {
        switch result {
        case .success(let model):
            print("success calisti")
            view?.showLoginResponse(with: model)
            
        case .failure(let error):
            view?.showLoginResponse(with: error.localizedDescription)
        }
    }
}
