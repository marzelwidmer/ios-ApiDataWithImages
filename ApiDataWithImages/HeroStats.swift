//
//  HeroStats.swift
//  ApiDataWithImages
//
//  Created by Marcel Widmer on 21.04.18.
//  Copyright © 2018 Marcel Widmer. All rights reserved.
//

import Foundation

struct HeroStats :Decodable {
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
    let img: String
}
