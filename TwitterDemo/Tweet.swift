//
//  Tweet.swift
//  TwitterDemo
//
//  Created by Shreyas Tawre on 2/26/17.
//  Copyright © 2017 Shreyas Tawre. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var text: NSString
    var timestamp: Date? = nil
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    var name: String
    var profileUrl: String
    var screenname: String
    
    init(dictionary: NSDictionary) {
        text = (dictionary["text"] as? String as NSString?)!
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoritesCount = (dictionary["favourites_count"] as? Int) ?? 0
        
        let user = dictionary["user"] as? [String: Any]
        name = user?["name"] as! String
        profileUrl = user?["profile_image_url_https"] as! String
        screenname = user?["screen_name"] as! String
        
        let timestampString = dictionary["created_at"] as? String
        
        if let timestampString = timestampString {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timestamp = formatter.date(from: timestampString)!
        }
    }
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            
            tweets.append(tweet)
        }
        
        return tweets
    }
}
