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

}

final class SignUpPresenter : SignUpPresenterProtocol {
   
    
    var router: SignUpRouterProtocol?
    var interactor: SignUpInteractorProtocol?
    var view: SignUpViewProtocol?
    
    
}
