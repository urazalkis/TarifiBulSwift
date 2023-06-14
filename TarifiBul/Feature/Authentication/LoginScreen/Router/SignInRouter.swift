//
//  SignInRouter.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 9.06.2023.
//

import Foundation
import UIKit


typealias SignInEntryPoint = ISignInView & UIViewController
protocol ISignInRouter {
    var entry : SignInEntryPoint? {get}
    static func startExecution() -> ISignInRouter
}

final class SignInRouter : ISignInRouter {
    var entry : SignInEntryPoint?
    static func startExecution() -> ISignInRouter {
      
        var view : ISignInView = SignInViewController()
        var interactor : ISignInInteractor = SignInInteractor()
        var presenter : ISignInPresenter = SignInPresenter()
        let router = SignInRouter()
       
        
        
        view.presenter = presenter

        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
    
        router.entry =  view as? SignInEntryPoint
        return router
    }
}
