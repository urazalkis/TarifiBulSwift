//
//  SignUpPresenter.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 14.06.2023.
//

import Foundation

protocol SignUpPresenterProtocol {
    var router : SignUpRouterProtocol? { get set }
    var interactor : SignUpInteractorProtocol? {get set}
    var view : SignUpViewProtocol? {get set}
    func fetchRegister(userName:String,email:String, password: String)
    func interactorDidFetchRegister(result : Result<SignUpResponseModel,Error>)

}

final class SignUpPresenter : SignUpPresenterProtocol {
   
    var router: SignUpRouterProtocol?
    var interactor: SignUpInteractorProtocol?
    var view: SignUpViewProtocol?
    
    func fetchRegister(userName: String, email: String, password: String) {
        interactor?.fetchLoginResponse(userName: userName,email:email, password: password)
    }
    
    func interactorDidFetchRegister(result: Result<SignUpResponseModel, Error>) {
        switch result {
        case .success(let model):
            view?.changeButtonLoadingState()
            view?.showRegisterResultAlert(with: model)
        case .failure(let error):
            view?.changeButtonLoadingState()
            view?.showRegisterResultAlert(with: error.localizedDescription)
        }
    }
    
}
