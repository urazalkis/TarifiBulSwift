//
//  LoginPresenter.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 5.06.2023.
//

import Foundation
//talks to interactor,router,view
protocol ILoginPresenter {
    var router : ILoginRouter? { get set }
    var interactor : ILoginInteractor? {get set}
    var view : ILoginView? {get set}
    func fetchLogin(userName:String, password: String)
    func interactorDidFetchLogin(result : Result<LoginResponseModel,Error>)
}

class LoginPresenter : ILoginPresenter {
   
    
    var router: ILoginRouter?
    var interactor: ILoginInteractor?
    var view: ILoginView?
    
    func fetchLogin(userName:String, password: String){
        interactor?.fetchLoginResponse(userName: userName, password: password)
        
    }
    func interactorDidFetchLogin(result: Result<LoginResponseModel, Error>) {
        switch result {
        case .success(let model):
            view?.showLoginResponse(with: model)
            
        case .failure(let error):
            view?.showLoginResponse(with: error.localizedDescription)
        }
    }
}
  
