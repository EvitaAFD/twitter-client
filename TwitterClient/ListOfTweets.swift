//
//  ListOfTweets.swift
//  TwitterClient
//
//  Created by Eve Denison on 3/20/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import Foundation

class ListOfTweets {
    
    static let shared = ListOfTweets()
    
    var tweetContainer = [Tweet]()
    
    private init(){}
    
    func add(tweet: Tweet) {
        self.tweetContainer.append(tweet)
    }
    
    func remove(tweet: Tweet) {
        self.tweetContainer = self.tweetContainer.filter({ (item) -> Bool in
            return item.id != tweet.id
        })
        
        func removeAll(){
            return self.tweetContainer.removeAll()
        }
        
        func getTweetAt(index: Int) -> Tweet{
            return self.tweetContainer[index]
        }
        
        func count() -> Int {
            return self.tweetContainer.count
        }
    }
}
