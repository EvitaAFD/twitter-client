//
//  HomeTimelineViewController.swift
//  TwitterClient
//
//  Created by Eve Denison on 3/20/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

//Setup your cells with Auto Layout
//Create a 2nd UIViewController that shows an individual tweet in detail
//omment out the tableView(_:, didSelectRowAt:) delegate method in your HomeTimelineViewController.
//Upon clicking a tweet, your interface should push to another UIViewController that displays the tweet's details, via a storyboard segue, using labels to present the tweet details to the user instead of print() statements. Also, a few other caveats:
//If the tweet that was selected is a retweet, you should let the user know in some way.
//This information is available in the JSON, so you have to go digging for it and add a property to your Tweet class. HINT: This information should be in the tweet.json testing file as well to inspect.
//Create a ProfileViewController that when presented, shows the logged in user's profile information. Utilize the NavigationBar to add a button to present this new viewController. This can be achieved using the getOAuthUser method we wrote yesterday to get the current user's information.

import UIKit

class HomeTimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataSource = [Tweet]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        updateTimeline()
        
    }
    
    func updateTimeline() {
        API.shared.getTweets { (tweets) in
            OperationQueue.main.addOperation {
                self.dataSource = tweets ?? []
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let tweet = dataSource[indexPath.row]
        
        cell.textLabel?.text = "\(tweet.text)"
        cell.detailTextLabel?.text = "\(tweet.user?.name)"
        
        return cell
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Selected:  \(indexPath.row)")
//    }
    
}
