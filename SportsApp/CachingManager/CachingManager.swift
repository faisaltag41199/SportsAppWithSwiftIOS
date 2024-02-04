//
//  CachingManager.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 02/02/2024.
//

import Foundation
import CoreData
import UIKit


protocol CachingManager {
    
    func insert(league:LeagueModel)
    func fetch()->[LeagueModel]
    func isExist(league:LeagueModel)->Bool
    func delete(league:LeagueModel)
}

class CachingManagerImplementation:CachingManager{
    
    private var context : NSManagedObjectContext!
 
    init() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        context = delegate.persistentContainer.viewContext

    }

    
    func insert(league: LeagueModel){
        
        let favouriteLeagueEntity = NSEntityDescription.entity(forEntityName: "FavouriteLeague", in: context)
        
        let favouriteLeague = NSManagedObject(entity:favouriteLeagueEntity!,insertInto:context)

        favouriteLeague.setValue(String(league.leagueKey ?? 0), forKey: "leagueKey")
        favouriteLeague.setValue(league.leagueName, forKey: "leagueName")
        favouriteLeague.setValue(league.leagueLogo ?? "/", forKey: "leagueImage")
        favouriteLeague.setValue(league.sportName, forKey: "sportName")
        
        do{
            try context.save()
            print("Data Saved Successfuly")
        }
        catch let error{
            fatalError(error.localizedDescription)
        }
    }
    
    
    func fetch() -> [LeagueModel] {
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavouriteLeague")

        do{
            
            let FavouriteLeagues = try context.fetch(fetchRequest)
            if FavouriteLeagues.count == 0 {
                print("Not data to present")
                return []
            }
            
            var leagues: [LeagueModel] = []
            
            for item in FavouriteLeagues{
               
                let leagueKey:Int? = Int(item.value(forKey: "leagueKey") as? String ?? "0")
                let leagueName:String? =  item.value(forKey: "leagueName") as? String
                let imageStringURL = item.value(forKey: "leagueImage") as? String
                let sportName = item.value(forKey: "sportName") as? String
                
                var  leagueImage:String?
            
                if imageStringURL == "/"{
                     leagueImage = nil
                }else {
                    leagueImage = imageStringURL
                }
                
                let storedLeague = LeagueModel(leagueKey: leagueKey, leagueName: leagueName, leagueLogo: leagueImage,sportName: sportName)
                
                leagues.append(storedLeague)
            }
        
            return leagues
            
        }catch let error{
            
            print("Can't Fetch")
            print(error.localizedDescription)
        }
        
        return []
        
    }
    
    func isExist(league: LeagueModel) -> Bool {
        
        var managedObjects:[NSManagedObject] = []
        let leagueKey = String(league.leagueKey ?? 0)
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:"FavouriteLeague")
        let predicite = NSPredicate(format:"leagueKey == %@",leagueKey)
        fetchRequest.predicate = predicite
        
        do{
            managedObjects = try context.fetch(fetchRequest)
            
            if managedObjects.count == 0 {
                
                print("Not data to delete")
                return false
            }
        
        }catch let error{
        
            print("Can't Fetch to delete")
            print(error.localizedDescription)
            
            return false
            
        }
        
        return true
    }
    
    func delete(league: LeagueModel) {
        
        var managedObjects:[NSManagedObject] = []
        let leagueKey = String(league.leagueKey ?? 0)
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:"FavouriteLeague")
        let predicite = NSPredicate(format:"leagueKey == %@",leagueKey)
        fetchRequest.predicate = predicite
        
        do{
            managedObjects = try context.fetch(fetchRequest)
            
            if managedObjects.count == 0 {
                print("Not data to delete")
                return
            }
        
        }catch let error{
        
            print("Can't Fetch to delete")
            print(error.localizedDescription)
        }
        
        for item in managedObjects{
            
            print("////////////////////////////// delete item \(item.value(forKey: "leagueKey"))")
            
            print("////////////////////////////// delete item \(item.value(forKey: "leagueKey"))")
            
            print("////////////////////////////// delete item \(item.value(forKey: "leagueKey"))")
            
            context.delete(item)
        }
        
        do{
            try context.save()
            print("Data Saved Successfuly")
        }
        catch let error{
            fatalError(error.localizedDescription)
        }
        
        
    }
}


