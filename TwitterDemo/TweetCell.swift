//
//  TweetCell.swift
//  TwitterDemo
//
//  Created by Shreyas Tawre on 2/26/17.
//  Copyright © 2017 Shreyas Tawre. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    
    var tweet: Tweet! {
        didSet {
            tweetLabel.text = tweet.text as String
            profileImageView.setImageWith(URL(string: tweet.profileUrl)!)
            userNameLabel.text = tweet.name as String
            screennameLabel.text = "@\(tweet.screenname as String)"
            tweetLabel.sizeToFit()

        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImageView.layer.cornerRadius = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
