//
//  LeaguesDependencyProvider.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 01/02/2024.
//

import Foundation
import UIKit

class LeaguesDependencyProvider{
    
    
    static var sportName:String?
    static var leaguesURL = "/"
    
    static var apiManager:any APIManager{
        
        return APIManagerImplementation<LeaguesModel>()
    }
    
    static var leaguesViewModel:LeaguesViewModel{
        
        return LeaguesViewModel(apiManager:LeaguesDependencyProvider.apiManager, url: LeaguesDependencyProvider.leaguesURL)
        
    }

    static var leaguesTableViewController:LeaguesTableViewController{
        
        let leaguesTableViewControllerInstance =
        UIStoryboard(name: "Main",bundle:nil).instantiateViewController(withIdentifier: "leaguesTableViewController") as! LeaguesTableViewController
        
        leaguesTableViewControllerInstance.leaguesViewModel = LeaguesDependencyProvider.leaguesViewModel
        
        leaguesTableViewControllerInstance.sportName = LeaguesDependencyProvider.sportName ?? "football"
        
        return leaguesTableViewControllerInstance
    }
    
}
