//
//  TeamViewController.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 02/02/2024.
//

import UIKit
import Kingfisher

class TeamViewController: UIViewController , UITableViewDelegate,UITableViewDataSource {

    var team:TeamModel?
    @IBOutlet weak var playersTableView:UITableView!
    
    @IBOutlet weak var teamImage: UIImageView!
    
    @IBOutlet weak var teamName:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playersTableView.delegate=self
        playersTableView.dataSource = self
        
        if(team?.teamLogo == nil){
            
            teamImage.image = UIImage(named: AppSportsStrings.defaultAppImage)
        }else{
            
            let url = URL(string:team?.teamLogo ?? "/")
            teamImage.kf.setImage(with:url)
        }
        
       teamName.text = team?.teamName

        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return team?.players?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let playerCell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! TeamPlayerTableViewCell
        
//        playerCell.contentView.layer.cornerRadius =  10.0
//        playerCell.contentView.clipsToBounds = true
        
        playerCell.container.layer.cornerRadius =  10.0
        playerCell.container.clipsToBounds = true
        
        playerCell.playerImage.layer.cornerRadius =  10.0
        playerCell.playerImage.clipsToBounds = true
        
        if(team?.players?[indexPath.item].playerImage == nil){
            
            playerCell.playerImage.image = UIImage(named: AppSportsStrings.defaultAppImage)
        }else{
            let url = URL(string:team?.players?[indexPath.item].playerImage! ?? "/")
            playerCell.playerImage.kf.setImage(with:url)
        }
        
        playerCell.playerName.text = team?.players?[indexPath.item].playerName
        playerCell.playerPositon.text = team?.players?[indexPath.item].playerType
        playerCell.playerNumber.text = team?.players?[indexPath.item].playerNumber
        playerCell.playerAge.text = team?.players?[indexPath.item].playerAge
        

        return playerCell
    }
    
    
}
