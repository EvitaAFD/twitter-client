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
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var retweetSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userLabel.text = self.tweet.user?.screenName
        self.tweetLabel.text = self.tweet.text
        self.retweetSwitch.setOn(self.tweet.retweet_status, animated: true)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == UserTimelineViewController.identifier {
            guard let destinationController = segue.destination as? UserTimelineViewController else { fatalError("Oh nooooooo usertimeline error")}
                destinationController.user = self.tweet.user
        }
        
    }
    
}

