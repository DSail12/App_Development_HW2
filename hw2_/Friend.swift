//
//  Friend.swift
//  hw2_
//
//  Created by Eugene Zvyagin on 01.07.2023.
// 

struct Friend {
    let name: String
    var messages: [String]
    
    static func getFriends() -> [Friend] {
        [
            Friend(
                name: Friends.brad.rawValue,
                messages: []
            ),
            Friend(
                name: Friends.emma.rawValue,
                messages: []
            ),
            Friend(
                name: Friends.keira.rawValue,
                messages: []
            ),
            Friend(
                name: Friends.leo.rawValue,
                messages: []
            ),
            Friend(
                name: Friends.tom.rawValue,
                messages: []
            )
        ]
    }
}

enum Friends: String {
    case brad = "Brad"
    case emma = "Emma"
    case keira = "Keira"
    case leo = "Leo"
    case tom = "Tom"
}
