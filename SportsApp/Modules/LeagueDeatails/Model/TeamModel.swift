//
//  TeamModel.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 31/01/2024.
//

import Foundation

class TeamsModel: Codable{
    
    var teams:[TeamModel]?
    
    enum CodingKeys: String,CodingKey {
        case teams = "result"
    }
}

class TeamModel:Codable{
    
    var teamKey: Int?
    var teamName: String?
    var teamLogo: String?
    var players:[PlayerModel]?
    
    
    enum CodingKeys: String, CodingKey {
        
            case teamKey = "team_key"
            case teamName = "team_name"
            case teamLogo = "team_logo"
            case players = "players"
    }
}

class PlayerModel:Codable{
    
    var playerKey: Int?
    var playerName: String?
    var playerNumber: String?
    var playerType: String?
    var playerAge: String?
    let playerImage: String?

    enum CodingKeys: String, CodingKey {
        case playerKey = "player_key"
            case playerName = "player_name"
            case playerNumber = "player_number"
            case playerType = "player_type"
            case playerAge = "player_age"
            case playerImage = "player_image"
    }
}
