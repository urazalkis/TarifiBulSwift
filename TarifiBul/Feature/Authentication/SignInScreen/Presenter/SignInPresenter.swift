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
    func interactorDidFetchLogin(result : Result<SignInResponseModel,Error>)
}

final class SignInPresenter : ISignInPresenter {
   
    
    var router: ISignInRouter?
    var interactor: ISignInInteractor?
    var view: ISignInView?
    
    func fetchLogin(userName:String, password: String){
        interactor?.fetchLoginResponse(userName: userName, password: password)
    }
    func interactorDidFetchLogin(result: Result<SignInResponseModel, Error>) {
        switch result {
        case .success(let model):
            self.view?.changeButtonLoadingState()
            view?.showLoginResultAlert(with: model)
           
            
        case .failure(let error):
            self.view?.changeButtonLoadingState()
            view?.showLoginResultAlert(with: error.localizedDescription)
            
        }
    }
}
