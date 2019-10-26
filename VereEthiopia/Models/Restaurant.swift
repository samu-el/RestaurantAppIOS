//
//  Restaurants.swift
//  VereEthiopia
//
//  Created by Eyuel on 10/19/19.
//  Copyright © 2019 Med Innovations Addis. All rights reserved.
//

import UIKit

struct Restaurant : Codable {
    //MARK: - Properties
    
    var name : String?
    var cover_image: String?
    var logo : String?
    var rating : Float?
    var distance : Float?
    var min_price: Float?
    var fee: Float?
    var opening_hrs: openingHrs?
    var tags : [String]?
    
}

struct openingHrs : Codable {
    var from: String?
    var to: String?
}
