//
//  TeamTableViewCell.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 02/02/2024.
//

import UIKit

class TeamPlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var playerImage: UIImageView!
    
    @IBOutlet weak var playerName: UILabel!

    @IBOutlet weak var playerPositon: UILabel!
    
    @IBOutlet weak var playerNumber: UILabel!
    
    @IBOutlet weak var playerAge: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
