//
//  endPointUrl.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 30/01/2024.
//

import Foundation

struct EndPointUrlStrings{
    
    
    static func getLeaguesURL(sportName:String) -> String{
        
        return "https://apiv2.allsportsapi.com/\(sportName)/?met=Leagues&APIkey=\(ConfidentialStrings.allSportsAPIKey)"
    }
    
    static func getTeamsURL(sportName:String,leagueKey:String) -> String{
        
        return "https://apiv2.allsportsapi.com/\(sportName)/?&met=Teams&leagueId=\(leagueKey)&APIkey=\(ConfidentialStrings.allSportsAPIKey)"
    }

    static func getEventsURL(sportName:String,leagueKey:String) -> String{
        
        let fromDate = EndPointURLDateHelper().fromDate(todayDate: Date())
        let toDate = EndPointURLDateHelper().toDate(todayDate: Date())
        
        let url = "https://apiv2.allsportsapi.com/\(sportName)/?met=Fixtures&leagueId=\(leagueKey)&APIkey=\(ConfidentialStrings.allSportsAPIKey)&from=\(fromDate)&to=\(toDate)"
        
        print("/////////from constants url is \(url)")
        return url
    }
    
}


