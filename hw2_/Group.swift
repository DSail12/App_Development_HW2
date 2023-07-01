//
//  Group.swift
//  hw2_
//
//  Created by Eugene Zvyagin on 01.07.2023.
//  

struct Group {
    let name: String
    let description: String
    
    static func getGroups() -> [Group] {
        [
            Group(
                name: "apple",
                description: "American multinational technology company"
            ),
            Group(
                name: "bmw",
                description: "German multinational manufacturer of luxury vehicles and motorcycles"
            ),
            Group(
                name: "fanta",
                description: "American-owned German brand of fruit-flavored carbonated soft drinks"
            ),
            Group(
                name: "intel",
                description: "American multinational corporation and technology company"
            ),
            Group(
                name: "pepsi",
                description: "American multinational food, snack, and beverage corporation"
            )
        ]
    }
}
