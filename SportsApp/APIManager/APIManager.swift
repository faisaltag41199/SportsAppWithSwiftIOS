//
//  APIManager.swift
//  SportsApp
//
//  Created by Faisal TagEldeen on 30/01/2024.
//

import Foundation
import Alamofire

protocol APIManager{
    
    associatedtype T
    func fetchData(handler: @escaping (_ result:T?,_ errorStatus:ErrorManager?)->Void, url:String)
}

class APIManagerImplementation <T:Codable>: APIManager{
    
    func fetchData(handler: @escaping (_ result:T?,_ errorStatus:ErrorManager?) -> Void, url: String) {
        
        AF.request(url).responseDecodable(of: T.self) { response in
            
                switch response.result {
                    case let .success(data):

                        print("succsses/////////////////////")
                        print("succsses")
                        //print(data)
                        handler(data,nil)
                    
                    case let .failure(error):
                        handler(nil,ErrorManager(errorDescription:error.errorDescription))
                        print("error")
               
                }
            }
    }
}
