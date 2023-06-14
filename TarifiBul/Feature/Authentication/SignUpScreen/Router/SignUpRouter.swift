//
//  SignUpRouter.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 14.06.2023.
//

import Foundation
import UIKit
typealias SignUpEntryPoint = SignUpViewProtocol & UIViewController
protocol SignUpRouterProtocol {
    var entry : SignUpEntryPoint? {get}
    static func startExecution() -> SignUpRouterProtocol
}

final class SignUpRouter : SignUpRouterProtocol {
    var entry : SignUpEntryPoint?
    static func startExecution() -> SignUpRouterProtocol {
      
        var view : SignUpViewProtocol = SignUpViewController()
        var interactor : SignUpInteractorProtocol = SignUpInteractor()
        var presenter : SignUpPresenterProtocol = SignUpPresenter()
        let router = SignUpRouter()
         
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
    
        router.entry =  view as? SignUpEntryPoint
        return router
    }
}
