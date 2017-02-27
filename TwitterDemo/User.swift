//
//  User.swift
//  TwitterDemo
//
//  Created by Shreyas Tawre on 2/26/17.
//  Copyright © 2017 Shreyas Tawre. All rights reserved.
//

import UIKit

class User: NSObject, NSCoding {
    var name: NSString?
    var screenname: NSString?
    var profileUrl: URL?
    var tagLine: NSString?
    
    var dictionary: NSDictionary?
    
    init(dictionary: NSDictionary) {
        
        self.dictionary = dictionary
        
        name = dictionary["name"] as? String as NSString?
        screenname = dictionary["screen_name"] as? String as NSString?
        tagLine = dictionary["description"] as? String as NSString?
        
        let profileURLString = dictionary["profile_image_url_https"] as? String
        if let profileURLString = profileURLString {
            profileUrl = URL(string: profileURLString)
        }
    }
    
    required init?(coder tweetDecoder: NSCoder) {
        self.name = tweetDecoder.decodeObject(forKey: "name") as? String as NSString? ?? ""
        self.screenname = tweetDecoder.decodeObject(forKey: "screenname") as? String as NSString? ?? ""
        self.tagLine = tweetDecoder.decodeObject(forKey: "description") as? String as NSString? ?? ""
        self.profileUrl = tweetDecoder.decodeObject(forKey: "profileURL") as? URL
    }
    
    func encode(with tweetCoder: NSCoder) {
        tweetCoder.encode(name, forKey: "name")
        tweetCoder.encode(screenname, forKey: "screenname")
        tweetCoder.encode(tagLine, forKey: "tagLine")
        tweetCoder.encode(profileUrl, forKey: "profileUrl")
    }
    
    static let UserDidLogoutNotification = "UserDidLogout"
    
    /*
    static var _currentUser: User?
    
    class var currentUser: User? {
        get {
            
            if _currentUser == nil {
            
                let defaults = UserDefaults.standard
                
                let userData = defaults.object(forKey: "currentUser") as? Data
                
                if let userData = userData {
                    let dictionary =  try! JSONSerialization.jsonObject(with: userData, options: []) as! NSDictionary
                    
                    _currentUser = User(dictionary: dictionary)
                }
                
            }
            
            return _currentUser
        }
        
        set(user) {
            _currentUser = user
            
            let defaults = UserDefaults.standard
            
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                
                defaults.set(data, forKey: "currentUser")
            } else {
                defaults.set(nil, forKey: "currentUser")
            }
            
            defaults.set(user, forKey: "currentUser")
            
            defaults.synchronize()
        }
        
    }
 */
}
