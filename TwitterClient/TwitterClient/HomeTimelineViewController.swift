//
//  HomeTimelineViewController.swift
//  TwitterClient
//
//  Created by Eve Denison on 3/20/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class HomeTimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataSource = [Tweet]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        JSONParser.tweetsFrom(data: JSONParser.sampleJSONData) { (success, tweets) in
            
            if(success){
                guard let tweets = tweets else { fatalError("Tweets came back nil") }
                for tweet in tweets{
                    print(tweet.text)
                    ListOfTweets.shared.add(tweet: tweet)
                }
                dataSource = ListOfTweets.shared.tweetContainer
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected:  \(indexPath.row)")
    }
    
}
