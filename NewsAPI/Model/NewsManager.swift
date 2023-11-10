//
//  NewsManager.swift
//  NewsAPI
//
//  Created by Dev on 21/09/2022.
//

import Foundation
import UIKit

class NewsManager{
    
    lazy var apiURL: String = {
       
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String{
          return
           "https://newsapi.org/v2/everything?q=apple&from=2023-10-31&to=2023-10-31&sortBy=popularity&apiKey=" + apiKey
        }
        else{
            fatalError("API could not be fetched.")
        }
        
    }()
    
    func fetchAPIData(_ completionHandler: @escaping (_ fetchedData: Any?, _ error: Error?) -> Void){
        performRequest(with: apiURL){ data, error in
            completionHandler(data,error)
        }
    }
    
    func performRequest(with urlString: String, _ completionHandler: @escaping (_ fetchedData: Any?, _ error: Error?) -> Void) {
        
        if let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!){

            let session = URLSession(configuration: .default)
    
            let task = session.dataTask(with: url) { [weak self] (data, urlresponse, error) in
                
                if error != nil{
                    print("error")
                    completionHandler(data,error)
                }
                guard let httpResponse = urlresponse as? HTTPURLResponse, httpResponse.statusCode == 200
                else{
                    fatalError("Error fetching endpoint data")
                }
  
                if let safeData = data {
                    if let dataReceived = self?.parseJSON(safeData){
                        completionHandler(dataReceived,error)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ newsData: Data) -> News? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(News.self, from: newsData)
            return decodedData
        }
        catch{
            print("error")
            return nil
        }
    }
    
}
