//
//  DateAppMethods.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 02/02/2024.
//

import Foundation

extension Date {
    
    var onlyDate: Date {
        
        get {
            let calender = Calendar.current
            var dateComponents = calender.dateComponents([.year, .month, .day], from: self)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = calender.date(from: dateComponents)
            let stringDate = dateFormatter.string(from: date!)
            print(stringDate)
            print(dateFormatter.date(from: stringDate)!)
            return dateFormatter.date(from: stringDate)!
        }
        
    }
    
}

class EndPointURLDateHelper{
    
    func fromDate(todayDate:Date)->String{
        
        let modifiedDate = Calendar.current.date(byAdding: .day, value: -5, to: todayDate)!
        
        return self.getStringDate(date: modifiedDate)
    }
    
    func toDate(todayDate:Date)-> String {
        
        let modifiedDate = Calendar.current.date(byAdding: .day, value: 5, to: todayDate)!
        return self.getStringDate(date: modifiedDate)
    }
    
    func getStringDate(date:Date)-> String{
        
        let calender = Calendar.current
        let dateComponents = calender.dateComponents([.year, .month, .day], from: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = calender.date(from: dateComponents)
        let stringDate = dateFormatter.string(from: date!)
        
        return stringDate
    }
    
}





