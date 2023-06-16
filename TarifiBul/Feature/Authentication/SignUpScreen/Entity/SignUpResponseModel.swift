//
//  SignUpResponseModel.swift
//  TarifiBul
//
//  Created by Uraz Alkış on 16.06.2023.
//

import Foundation

struct SignUpResponseModel: Codable {
    let success: Bool?
    let data: RegisterData?
    let token: String?
    let message: String?
}

struct RegisterData: Codable {
    let id, email, username,createdAt,updatedAt, role: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case email, username,createdAt,updatedAt,role
    }
}
