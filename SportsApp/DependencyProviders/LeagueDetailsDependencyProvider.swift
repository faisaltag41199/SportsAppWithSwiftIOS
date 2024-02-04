//
//  LeagueDetailsDependencyProvider.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 01/02/2024.
//

import Foundation
import UIKit

class LeagueDetailsDependencyProvider{
    
    static var teamsUrl:String?
    static var eventsUrl:String?
    static var league:LeagueModel?
    
    
    static var teamsAPIManager:any APIManager{
        
        return APIManagerImplementation<TeamsModel>()
    }
    
    static var eventsAPIManager:any APIManager{
        
        return APIManagerImplementation<EventsModel>()
    }
    
    static var cachingManager:CachingManager{
        return CachingManagerImplementation()
    }
    
    static var leagueDetailsViewModel:LeagueDetailsViewModel{
        
        return LeagueDetailsViewModel(cachingManager: LeagueDetailsDependencyProvider.cachingManager)
    }
    
    static var teamsViewModel:TeamsViewModel{
        
        return TeamsViewModel(apiManager:LeagueDetailsDependencyProvider.teamsAPIManager,url:LeagueDetailsDependencyProvider.teamsUrl ?? "/")
        
    }
    
    static var eventsViewModel:EventsViewModel{
        
        return EventsViewModel(apiManager:LeagueDetailsDependencyProvider.eventsAPIManager, eventsURL: LeagueDetailsDependencyProvider.eventsUrl ?? "/")
        
    }
    
    static var leagueDetailsCollectionViewController:LeagueDetailsCollectionViewController{
        
        let leagueDetailsCollectionViewControllerInstance =
        UIStoryboard(name: "Main",bundle:nil).instantiateViewController(withIdentifier: "leagueDetailsCollectionViewController") as! LeagueDetailsCollectionViewController
        
        leagueDetailsCollectionViewControllerInstance.leagueDetailsViewModel =
        LeagueDetailsDependencyProvider.leagueDetailsViewModel
        
        leagueDetailsCollectionViewControllerInstance.teamsViewModel =
        LeagueDetailsDependencyProvider.teamsViewModel
        
        leagueDetailsCollectionViewControllerInstance.eventsViewModel =
        LeagueDetailsDependencyProvider.eventsViewModel
        
        leagueDetailsCollectionViewControllerInstance.league =
        LeagueDetailsDependencyProvider.league
        
        
        return leagueDetailsCollectionViewControllerInstance
    }
    
}
