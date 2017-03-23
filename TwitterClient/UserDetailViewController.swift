//
//  UserDetailViewController.swift
//  TwitterClient
//
//  Created by Eve Denison on 3/23/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    var user : User!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    @IBOutlet weak var userDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUser()
    }
    
    func getUser() {
        
        API.shared.getOAuthUser { (userB) in
            guard let aUser = userB else {fatalError("This shit is bananas")}
            OperationQueue.main.addOperation {
                self.user = aUser
                self.userName.text = "User Name: \(self.user.name)"
                self.screenName.text = "Screen Name: @\(self.user.screenName)"
                self.userLocation.text = "Location: \(self.user.location)"
                self.userDescription.text = "Description: \(self.user.profileDescription)"
            }
        }
    }
}
