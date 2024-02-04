//
//  LeagueModel.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 31/01/2024.
//

import Foundation

struct LeaguesModel : Codable{
    
    let leagues:[LeagueModel]?
    
    enum CodingKeys : String , CodingKey{

        case leagues = "result"
    }
}

struct LeagueModel : Codable {
    
    let leagueKey:Int?
    let leagueName:String?
    let leagueLogo:String?
    var sportName:String? = "noSport"
    
    enum CodingKeys : String , CodingKey{
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case leagueLogo = "league_logo"
    }
    
    init(leagueKey: Int?, leagueName: String?, leagueLogo: String?) {
        self.leagueKey = leagueKey
        self.leagueName = leagueName
        self.leagueLogo = leagueLogo
    }
    
    init(leagueKey: Int?, leagueName: String?, leagueLogo: String?,sportName:String?) {
        self.leagueKey = leagueKey
        self.leagueName = leagueName
        self.leagueLogo = leagueLogo
        self.sportName = sportName
    }
    
    
    
}
