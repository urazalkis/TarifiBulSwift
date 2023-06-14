//
//  LoginResponseModel.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 5.06.2023.
//

import Foundation
struct SignInResponseModel: Codable {
    let success: Bool?
    let data: UserData?
    let expiresIn: Int?
    let token: String?
    let message: String?
}

struct UserData: Codable {
    let id, email, username, role: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case email, username, role
    }
}








