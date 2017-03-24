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
    
    @IBOutlet weak var detailText: UILabel!
    @IBOutlet weak var userText: UILabel!
    @IBOutlet weak var isRetweet: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.detailText.text = tweet.text
        self.userText.text = tweet.user?.name
        if (tweet.retweet_status == true) {
            self.isRetweet.text = "This is a Retweet."
        } else {
            self.isRetweet.text = "Not a Retweet."
        }
    }
}
