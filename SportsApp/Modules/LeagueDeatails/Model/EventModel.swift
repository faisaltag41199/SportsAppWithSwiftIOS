//
//  EventModel.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 31/01/2024.
//

import Foundation

class EventsModel : Codable{
    
    var events:[EventModel]?
    enum CodingKeys: String,CodingKey {
        case events = "result"
    }
}

class EventModel : Codable{
    
    var eventKey:Int?
    var eventDate:String?
    var eventTime:String?
    var firstTeamName:String?
    var firstTeamImage:String?
    var secondTeamName:String?
    var secondTeamImage:String?
    var eventFinalResult:String?
    var eventStatus:String?
    
    enum CodingKeys : String,CodingKey{
        
        case eventKey = "event_key"
        case eventDate = "event_date"
        case eventTime = "event_time"
        case firstTeamName = "event_home_team"
        case firstTeamImage = "home_team_logo"
        case secondTeamName = "event_away_team"
        case secondTeamImage = "away_team_logo"
        case eventFinalResult = "event_final_result"
        case eventStatus = "event_status"
        
    }
}



