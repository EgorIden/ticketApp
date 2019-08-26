//
//  Events.swift
//  ticketApp
//
//  Created by Egor on 11.08.2019.
//  Copyright © 2019 Egor. All rights reserved.
//

import UIKit

//структура события

struct  Json: Decodable {
    var results: [Events]
}
struct Events: Decodable{
    var id: Int?
    var place: Place
    var description: String?
    var price: String?
    var short_title: String?
    var images: [Image]
    var mainImage: Data?
}
struct Place: Decodable {
    var title: String?
}
struct Image: Decodable {
    var image: String?
}

