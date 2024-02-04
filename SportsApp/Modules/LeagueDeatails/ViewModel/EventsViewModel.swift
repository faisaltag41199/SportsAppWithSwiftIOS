//
//  EventsViewModel.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 01/02/2024.
//

import Foundation

class EventsViewModel{

    var apiManager:(any APIManager)?
    var eventsURL:String?
    
    var bindUpcomingEventsResultToViewController :()->Void = {}
    var bindLatestEventsResultToViewController :()->Void = {}
    
    var events:[EventModel]? {

        didSet{
            
            upcomingEvents = events?.filter({ $0.eventFinalResult == "-"})
            latestEvents = events?.filter({$0.eventStatus == "Finished"})
            
        }
    }
    
    var upcomingEvents:[EventModel]? {
        
        didSet{
            bindUpcomingEventsResultToViewController()
        }
    }
    
    var latestEvents:[EventModel]? {
        
        didSet{
            bindLatestEventsResultToViewController()
        }
    }
    
    init(apiManager: (any APIManager)? = nil, eventsURL: String? = nil) {
        
        self.apiManager = apiManager
        self.eventsURL = eventsURL
    }
    
    func loadData(){
        
        apiManager?.fetchData(handler: { result, errorStatus in
            
            guard let resultEvents = (result as? EventsModel)?.events
            else{
                print(errorStatus?.errorDescription ?? "no data")
                return
            }
            
            self.events = resultEvents

        }, url: eventsURL ?? "")
        
    }
    
    func getUpcomingEvents()->[EventModel]{
       
        return upcomingEvents ?? []
    }
    
    func getLatestEvents()->[EventModel]{
       
        return latestEvents ?? []
    }
    
}

