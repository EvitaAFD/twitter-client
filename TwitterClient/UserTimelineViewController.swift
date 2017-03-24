//
//  UserTimelineViewController.swift
//  TwitterClient
//
//  Created by Eve Denison on 3/23/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class UserTimelineViewController: UIViewController {

    var user : User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       getUser()
    }
    
    func getUser() {
        
        API.shared.getOAuthUser { (userB) in
            guard let aUser = userB else {fatalError("Oh noooooooo error!")}
            OperationQueue.main.addOperation {
                self.user = aUser
            }
        }
    }

}
