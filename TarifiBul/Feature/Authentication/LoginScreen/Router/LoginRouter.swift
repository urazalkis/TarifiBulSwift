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
    func navigateToSignIn()
    func navigateToSignUp()
}

final class LoginRouter : ILoginRouter {
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
    func navigateToSignIn() {
        let routerInstance = SignInRouter.startExecution()
        if let signInVC = routerInstance.entry{
            if let sheet = signInVC.sheetPresentationController {
                sheet.detents = [.medium(),.large()]
            }
            if let entry = entry {
                entry.present(signInVC,animated: true,completion: nil)
            }

        }
    
    }
    func navigateToSignUp() {
        let routerInstance = SignUpRouter.startExecution()
        print(routerInstance.entry)
        if let signUpVC = routerInstance.entry{
            if let sheet = signUpVC.sheetPresentationController {
                sheet.detents = [.medium(),.large()]
            }
            if let entry = entry {
                entry.present(signUpVC,animated: true,completion: nil)
            }

        }
    
    }
}
