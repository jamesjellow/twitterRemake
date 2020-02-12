//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Gabe De Mesa on 2/4/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var tweetContent: UILabel!
    @IBOutlet var retweetButton: UIButton!
    @IBOutlet var favButton: UIButton!
    
    var favorited:Bool = false
    var tweetId:Int = -1
     
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetId, success:{ self.setFavorite(true)}, failure:{ (error) in print("Favorite did not succeed: \(error)")})
        }else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetId, success: {self.setFavorite(false)}, failure: {
                (error) in print("Unfavorite did not succeed \(error)")
            })
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
    }
    
 
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }else {
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
