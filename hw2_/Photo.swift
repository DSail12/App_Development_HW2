//
//  Photo.swift
//  hw2_
//
//  Created by Eugene Zvyagin on 01.07.2023.
// 

struct Photo {
    let name: String
    
    static func getPhotos() -> [Photo] {
        [
            Photo(name: "Jupiter"),
            Photo(name: "Mars"),
            Photo(name: "Mercury"),
            Photo(name: "Neptune"),
            Photo(name: "Saturn"),
            Photo(name: "Venus")
        ]
    }
}
