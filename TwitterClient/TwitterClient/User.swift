//
//  User.swift
//  TwitterClient
//
//  Created by Eve Denison on 3/20/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import Foundation


class User {
    
    let name: String
    let profileImageURL: String
    let location: String
    let screenName: String
    let profileDescription: String
    
    init?(json: [String: Any]) {
        if let name = json["name"] as? String,
            let profileImageURL = json["profile_image_url_https"] as? String,
            let location = json["location"] as? String,
            let screen_name = json["screen_name"] as? String,
            let descriptor = json["description"] as? String {
            
            self.name = name
            self.profileImageURL = profileImageURL
            self.location = location
            self.screenName = screen_name
            self.profileDescription = descriptor
            
        } else {
            return nil
        }
    }
}
