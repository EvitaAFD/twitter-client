//
//  TweetDetailViewController.swift
//  TwitterClient
//
//  Created by Eve Denison on 3/23/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tweet: Tweet!
    
    @IBOutlet weak var tweetDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tweetDetailTableView.dataSource = self
        self.tweetDetailTableView.delegate = self
        self.tweetDetailTableView.estimatedRowHeight = 50
        self.tweetDetailTableView.rowHeight = UITableViewAutomaticDimension
        
        let tweetNib = UINib(nibName: "TweetNibCell", bundle: nil)
        
        self.tweetDetailTableView.register(tweetNib, forCellReuseIdentifier: TweetNibCell.identifier)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == UserTimelineViewController.identifier {
            guard let destinationController = segue.destination as? UserTimelineViewController else { fatalError("Oh nooooooo usertimeline error")}
            destinationController.userProfile = self.tweet.user
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tweetCell = tweetDetailTableView.dequeueReusableCell(withIdentifier: TweetNibCell.identifier, for: indexPath) as! TweetNibCell
        
            tweetCell.tweet = self.tweet
        
            return tweetCell
    }
}

