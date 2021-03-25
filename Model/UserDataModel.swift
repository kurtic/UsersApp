//
//  User.swift
//  UsersApp
//
//  Created by Игорь on 21.03.2021.
//

import Foundation

struct ServerResponse: Decodable{
    var info: ResponseData
    var results: [UserData]
}

struct UserData: Decodable {
    var name: Name
    var email: String
    var phone: String
    var picture: Picture?
}

struct Name: Decodable {
    var first: String
    var last: String
}

struct Picture: Decodable {
    var large: String
}

struct ResponseData: Decodable{
    var results: Int
}




