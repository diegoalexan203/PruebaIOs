//
//  MovieService.swift
//  PruebaDiego8a
//
//  Created by Diego Ochoa on 11/04/21.
//

import Foundation

class MovieService {
    
func getMovies(page: String,_ completionHandler:  @escaping(ResponseMovies? , Error?) -> Void) {
//func getMovies(){
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
            completionHandler(nil,BackendError.internalError(reason: "Parsing error"))
        }
        
        // Convert HTTP Response Data to a simple String
        if let data = data, let dataString = String(data: data, encoding: .utf8) {
//            print("Response data string:\n \(dataString)")
            let responseData = self.parseJSON(data: data)
            completionHandler(responseData!, nil)
        }
        
    }
    task.resume()
}
//       //func getMovies(page: String) -> ResponseMovies? {
//           let url = "\(Constants.URL.base)/discover/movie?api_key=\(Constants.NEWS_API_KEY)&page=\(page)"
//           AF.request(url, method: .get, encoding: JSONEncoding.default)
//                   .responseJSON { response in
//                    switch response.result {
//                    case .success(let value):
//                        if let json = value as? [String: Any] {
//                            let response = Mapper<ResponseMovies>().map(JSON: json)
//                            completionHandler(response, nil)
//                        }
//                    case .failure(let error):
//                        print(error)
//                        completionHandler(nil,BackendError.internalError(reason: "Parsing error"))
//                    }
//            }
//    }

enum BackendError: Error {
    case parameters(reason: String)
    case connection
    case technicalProblem
    case timeOut
    case internalError(reason: String)
    case objectSerialization(reason: String)
}
    
func parseJSON(data: Data) -> ResponseMovies? {
    
    var returnValue: ResponseMovies?
    do {
        returnValue = try JSONDecoder().decode(ResponseMovies.self, from: data)
    } catch {
        print("Error took place\(error.localizedDescription).")
    }
    
    return returnValue
}
}
