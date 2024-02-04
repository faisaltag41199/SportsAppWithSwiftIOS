//
//  FavouriteLeaguesDependencyProvider.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 03/02/2024.
//

import Foundation
import UIKit

class FavouriteLeaguesDependencyProvider{
    
    static var cachingManager:CachingManager{
        return CachingManagerImplementation()
    }
    
    static var favouriteLeaguesViewModel:FavouriteLeaguesViewModel{
        return FavouriteLeaguesViewModel(cachingManager: FavouriteLeaguesDependencyProvider.cachingManager)
    }
    
    static var favouriteTableViewController:FavouriteTableViewController{
        
        let favouriteTableViewControllerInstance
         = UIStoryboard(name: "Main",bundle:nil).instantiateViewController(withIdentifier: "favouriteTableViewController") as! FavouriteTableViewController
        
        favouriteTableViewControllerInstance.favouriteLeaguesViewModel =
            FavouriteLeaguesDependencyProvider.favouriteLeaguesViewModel
        
        return favouriteTableViewControllerInstance
    }

}
