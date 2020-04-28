//
//  infoModel.swift
//  mvp-pra
//
//  Created by 山田楓也 on 2020/04/12.
//  Copyright © 2020 Fuuya Yamada. All rights reserved.
//

import Foundation

struct InfoModel: Codable {
    var title: String
    var user: User
    var url: String
    
    struct User: Codable {
        var id: String!
        var description: String!
        var profile_image_url: String!
    }
}
