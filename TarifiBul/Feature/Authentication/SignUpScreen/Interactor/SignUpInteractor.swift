//
//  SignUpInteractor.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 14.06.2023.
//

import Foundation

protocol SignUpInteractorProtocol{
    var presenter : SignUpPresenterProtocol? { get set}
    //func fetchLoginResponse(userName:String,password:String)
}

final class SignUpInteractor : SignUpInteractorProtocol {
    var presenter: SignUpPresenterProtocol?
    
}
