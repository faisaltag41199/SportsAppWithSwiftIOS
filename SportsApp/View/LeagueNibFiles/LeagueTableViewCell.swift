//
//  LeagueTableViewCell.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 24/01/2024.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    @IBOutlet weak var leaguebackgroundView: UIView!
    
    @IBOutlet weak var imageContainerView: UIView!
    
    @IBOutlet weak var leagueTitle: UILabel!
//
   @IBOutlet weak var leagueImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // let screenSize: CGRect = UIScreen.main.bounds

        leaguebackgroundView.layer.cornerRadius = 10.0
        leaguebackgroundView.clipsToBounds = true
        leaguebackgroundView.bounds = CGRectInset(leaguebackgroundView.frame,-12.0,-8);
        
        imageContainerView.layer.cornerRadius = 25
        imageContainerView.clipsToBounds = true
        imageContainerView.frame = CGRect(x: 0, y: 0, width: 50, height:50)
        
        leagueImageView.center = CGPointMake(
            imageContainerView.frame.size.width/2
            ,imageContainerView.frame.size.height / 2);

        print("leaguebackgroundView.layer.cornerRadius")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
