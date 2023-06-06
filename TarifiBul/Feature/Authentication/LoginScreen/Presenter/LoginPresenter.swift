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
    func interactorDidFetchLogin(result : Result<LoginResponseModel,Error>)
}

class LoginPresenter : ILoginPresenter {
    var router: ILoginRouter?
    
    var interactor: ILoginInteractor? {
        didSet{
            interactor?.fetchLoginResponse(userName: "urazalkis", password: "uraz12345", onSuccess: { response in
                print(response?.success)
                print(response?.data?.username)
                print(response?.message)
            }, onError: {error in  print(error.localizedDescription)})
        }
    }
    
    
    
    var view: ILoginView?
    
    func interactorDidFetchLogin(result : Result<LoginResponseModel,Error>) {
        switch result {
        case .success(let model):
            view?.update(with: model)
            
        case .failure(let error):
            view?.update(with: error.localizedDescription)
        }
    }
    
    
}

  
