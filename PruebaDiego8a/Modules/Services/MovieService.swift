//
//  MovieService.swift
//  PruebaDiego8a
//
//  Created by Diego Ochoa on 11/04/21.
//

import Foundation

class MovieService {
    
func getMovies(page: String,_ completionHandler:  @escaping(ResponseMovies? , Error?) -> Void) {
    let urlBase = "\(Constants.URL.base)/discover/movie?api_key=\(Constants.NEWS_API_KEY)&page=\(page)"
    let url = URL(string: urlBase)
    guard let requestUrl = url else { fatalError() }
    // Create URL Request
    var request = URLRequest(url: requestUrl)
    // Specify HTTP Method to use
    request.httpMethod = "GET"
    // Send HTTP Request
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        
        // Check if Error took place
        if let error = error {
            print("Error took place \(error)")
            return
        }
        
        // Read HTTP Response Status code
        if let response = response as? HTTPURLResponse {
            print("Response HTTP Status code: \(response.statusCode)")
        }
        
        // Convert HTTP Response Data to a simple String
        if let data = data, let dataString = String(data: data, encoding: .utf8) {
//            print("Response data string:\n \(dataString)")
            let responseData = self.parseJSON(data: dataString)
            completionHandler(responseData!, nil)
        }
        
    }
    task.resume()
}

enum BackendError: Error {
    case parameters(reason: String)
    case connection
    case technicalProblem
    case timeOut
    case internalError(reason: String)
    case objectSerialization(reason: String)
}
    
func parseJSON(data: String) -> ResponseMovies? {
    
    var returnValue: ResponseMovies?
    let str = data
    let dataString = Data(str.utf8)

    do {
        
        if let json = try JSONSerialization.jsonObject(with: dataString, options: []) as? [String:Any]{
            returnValue = try JSONDecoder().decode(ResponseMovies.self, from: dataString)
        }
    } catch let error as NSError {
        print("Failed to load: \(error.localizedDescription)")
    }
    return returnValue
}
}
