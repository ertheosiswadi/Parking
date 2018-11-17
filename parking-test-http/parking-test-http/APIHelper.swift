//
//  APIHelper.swift
//  parking-test-http
//
//  Created by Ertheo Siswadi on 11/17/18.
//  Copyright © 2018 Ertheo Siswadi. All rights reserved.
//

import Foundation

class APIHelper {
    init() {
        
    }
    
    func getRequest(completeHandler: @escaping (_ profile: [String:Array<Bool>]) -> ())
    {
        let endpoint:String = "https://parking-hoth.herokuapp.com/"
        print("debug - get - url \(endpoint)")
        let url = URL(string: endpoint)
        let urlRequest = URLRequest(url: url!)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        var toReturn:[String:Array<Bool>] = [:]
        
        let task = session.dataTask(with: urlRequest, completionHandler: {(data, response, error) -> Void in
            
            guard let responseData = data else {
                print("Error: did not receive data")
                //send emptystring to callback func completeHandler
                completeHandler([:])
                return
            }
            
            do
            {
                guard let park_info = try JSONSerialization.jsonObject(with: responseData, options: [])as? [String: Array<Bool>]
                    else{
                        completeHandler([:])
                        return
                }
                
                print("parkinfo is: " + (park_info.description))
                toReturn = park_info
                
                completeHandler(toReturn)
                DispatchQueue.main.async {
                }
            }
            catch
            {
                print("error jsonserial")
                completeHandler([:])
                return
            }
        })
        
        task.resume()
    }

}
