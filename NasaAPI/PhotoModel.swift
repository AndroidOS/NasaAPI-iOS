//
//  PhotoModel.swift
//  NasaAPI
//
//  Created by Manuel Carvalho on 31/1/21.
//

import Foundation

struct Camera: Decodable {
    enum Category: String, Decodable {
        case swift, combine, debugging, xcode
    }
    let id: Int
    let name: String
    let rover_id: Int
    let full_name: String
}

struct Rover: Decodable {
    enum Category: String, Decodable {
        case swift, combine, debugging, xcode
    }
    let id: Int
    let name: String
    let landing_date: String
    let launch_date: String
    let status: String
}

struct Photo: Decodable {
    enum Category: String, Decodable {
        case swift, combine, debugging, xcode
    }
    let id: Int
    let sol: Int
    let camera:Camera
    let img_src: String
    let earth_date: String
    let rover: Rover
}

struct Root: Decodable {
    enum Category: String, Decodable {
        case swift, combine, debugging, xcode
    }
    let photos: [Photo]
}

struct BlogPost: Decodable {
    enum Category: String, Decodable {
        case swift, combine, debugging, xcode
    }

    let title: String
    let url: URL
    let category: Category
    let views: Int
}
