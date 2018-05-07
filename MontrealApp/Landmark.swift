//
//  Landmark.swift
//  MontrealApp
//
//  Created by Louis-Simon Poulin on 2018-05-05.
//  Copyright © 2018 Louis-Simon Poulin. All rights reserved.
//

import Foundation
import ObjectMapper

struct Landmark:Mappable{
    
    var id:Int = 0
    var title:String = ""
    var description:String = ""
    var address:String = ""
    var latitude:Float = 0.0
    var longitude:Float = 0.0
    var url:String = ""
    var price:Float = 0.0
    var distanceKM:Float = 0.0
    var image:String = ""
    var tags:String = ""
    var liked:Bool = false
    
    init?(map: Map) {
        self.id <- map["id"]
        self.title <- map["title"]
        self.description <- map["description"]
        self.address <- map["address"]
        self.latitude <- map["latitude"]
        self.longitude <- map["longitude"]
        self.url <- map["url"]
        self.price <- map["price"]
        self.image <- map["image"]
        self.tags <- map["tags"]
        self.liked <- map["liked"]
    }
    
    mutating func mapping(map: Map) {
        self.id <- map["id"]
        self.title <- map["title"]
        self.description <- map["description"]
        self.address <- map["address"]
        self.latitude <- map["latitude"]
        self.longitude <- map["longitude"]
        self.url <- map["url"]
        self.price <- map["price"]
        self.image <- map["image"]
        self.tags <- map["tags"]
        self.liked <- map["liked"]
    }
    
    
    
}
