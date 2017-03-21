//
//  API.swift
//  TwitterClient
//
//  Created by Eve Denison on 3/21/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import Foundation
import Accounts
import Social

//may need to change to accouts and an accounts array
typealias AccountCallback = (ACAccount?) -> ()
typealias UserCallback = (User?) -> ()
typealias TweeetsCallback = ([Tweet]?) -> ()

class API {

    static let shared = API()
    
    var account : ACAccount?
    
    private func loign(callback: @escaping AccountCallback) {
        
        let accountStore = ACAccountStore()
        
        let accountType = accountStore.accountType(withAccountTypeIdentifier:
            ACAccountTypeIdentifierTwitter)
    
        accountStore.requestAccessToAccounts(with: accountType, options: nil) { (success, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                callback(nil)
                return
            }
            
            if success {
                if let account = accountStore.accounts(with: accountType).first as? ACAccount {
                    callback(account)
                }
                
            } else {
                print("The user did not allow access to their account")
                callback(nil)
            }
        }
    }
    
    private func getOAuthUser(callback: @escaping UserCallback) {
    
        let url = URL(string: "https://api.twitter.com/1.1/account/verify_credentials.json")
        
        if let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: .GET, url: url, parameters: nil) {
        
            request.account = self.account
            
            request.perform(handler: { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                    callback(nil)
                    return
                }
                
                guard let response = response else { callback(nil); return }
                guard let data = data else { callback(nil); return }
                
                switch response.statusCode {
                    
                case 200...299:
                    //refactor into do, try, catch and abstract into JSONParser
                    if let userJSON = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        let user = User(json: userJSON)
                        callback(user)
                    }
                default:
                    print("Error: response came back with status code: \(response.statusCode)")
                    callback(nil)
                }
                
            })
        }
    }
    
    private func updateTimeLine(callback: TweeetsCallback) {
        
        let url = URL(string: "https://api.twitter.com/1.1/statuses/home_timeline.json")
        
        if let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: .GET, url: url, parameters: nil)
    
    }
    
    func getTweets(callback: TweeetsCallback) {
    
    }

}