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
}

final class LoginPresenter : ILoginPresenter {
   
    
    var router: ILoginRouter?
    var interactor: ILoginInteractor?
    var view: ILoginView?

}
  
