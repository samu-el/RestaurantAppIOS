//
//  Restaurants.swift
//  VereEthiopia
//
//  Created by Eyuel on 10/19/19.
//  Copyright © 2019 Med Innovations Addis. All rights reserved.
//

import UIKit

struct UserData : Decodable {
    //MARK: - Properties
    
    var id : String?
    var ttl: Int?
    var created : String?
    var userId : String?
    var user: user?
    
}

struct user : Decodable {
    var username: String?
    var email: String?
    var id: String?
}
