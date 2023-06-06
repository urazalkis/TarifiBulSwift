//
//  LoginRouter.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 5.06.2023.
//

import Foundation
import UIKit

typealias LoginEntryPoint = ILoginView & UIViewController
protocol ILoginRouter {
    var entry : LoginEntryPoint? {get}
    static func startExecution() -> ILoginRouter
}

class LoginRouter : ILoginRouter {
    var entry : LoginEntryPoint?
    static func startExecution() -> ILoginRouter {
        let router = LoginRouter()
        var view : ILoginView = LoginViewController()
        var presenter : ILoginPresenter = LoginPresenter()
        var interactor : ILoginInteractor = LoginInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry =  view as? LoginEntryPoint
        return router
    }
    
}
