//
//  LeagueDetailsViewModel.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 03/02/2024.
//

import Foundation

class LeagueDetailsViewModel{
    
    var cachingManager:CachingManager?
    
    init(cachingManager: CachingManager? = nil) {
        self.cachingManager = cachingManager
    }
    
    func insert(league:LeagueModel){
        cachingManager?.insert(league: league)
    }
    
    func fetch()->[LeagueModel]{
        
        cachingManager?.fetch() ?? []
    }
    
    func isExist(league:LeagueModel)-> Bool{
        
        return cachingManager?.isExist(league: league) ?? false
    }
    func delete(league:LeagueModel){
        
        cachingManager?.delete(league: league)
    }
    
}
