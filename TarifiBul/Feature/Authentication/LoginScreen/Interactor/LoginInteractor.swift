//
//  LoginInteractor.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 5.06.2023.
//

import Foundation
import Alamofire
//talks to presenter
protocol ILoginInteractor{
    var presenter : ILoginPresenter? { get set}

}

final class LoginInteractor : ILoginInteractor {
    var presenter: ILoginPresenter?
}
