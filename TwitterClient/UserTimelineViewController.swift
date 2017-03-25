//
//  UserTimelineViewController.swift
//  TwitterClient
//
//  Created by Eve Denison on 3/23/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class UserTimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var dataSource = [Tweet]() {
        didSet {
            self.userTableView.reloadData()
        }
    }
    
    var user : User!
    var userProfile: User!
    
    @IBOutlet weak var userTableView: UITableView!
    @IBOutlet weak var userImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userTableView.dataSource = self
        self.userTableView.delegate = self
        self.userTableView.estimatedRowHeight = 50
        self.userTableView.rowHeight = UITableViewAutomaticDimension
        
        
        let userTweetNib = UINib(nibName: "TweetNibCell", bundle: nil)
        
        self.userTableView.register(userTweetNib, forCellReuseIdentifier: TweetNibCell.identifier)
        

        getUser()
        updateUserTimeline()
    }
    
    
    func getUser() {
    
        API.shared.getOAuthUser { (userB) in
            guard let aUser = userB else {fatalError("Oh noooooooo error!")}
            OperationQueue.main.addOperation {
                self.user = aUser
                
            }
        }
    }

    func updateUserTimeline() {
        
        
        API.shared.getTweets { (tweets) in
            guard let tweets = tweets else { fatalError("Tweets came back nil.") }
            
            
            OperationQueue.main.addOperation {
              
                self.dataSource = tweets
                
                }
            
            }
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TweetNibCell.identifier, for: indexPath) as! TweetNibCell
        
        let tweet = self.dataSource[indexPath.row]
        
        cell.tweet = tweet
        
        return cell
    }
        
        
}
