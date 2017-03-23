//
//  TweetDetailViewController.swift
//  TwitterClient
//
//  Created by Eve Denison on 3/23/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {

    var tweet: Tweet!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print(tweet.user?.name ?? "Unknown User")
        print(tweet.text)
    }
}
