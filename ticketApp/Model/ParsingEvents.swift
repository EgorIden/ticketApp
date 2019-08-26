//
//  Functions.swift
//  ticketApp
//
//  Created by Egor on 11.08.2019.
//  Copyright © 2019 Egor. All rights reserved.
//

import Foundation

//класс для парсинга JSON
//class ParsingEvents {
//    
//    private var parsedEvents:[Events] = []
//    
//    func parsingEvents(completion: @escaping (_ result: [Events]) -> (), url: URL) {
//        
//        let urlRequest = URLRequest(url: url)
//        
//        let session = URLSession(configuration: URLSessionConfiguration.default)
//        session.dataTask(with: urlRequest, completionHandler:{ (data, response, error) -> Void in
//            
//            DispatchQueue.main.async {
//                
//                // проверка что есть data
//                guard let data = data else {
//                    print("No data")
//                    return
//                }
//                
//                // Парсинг из JSON
//                do {
//                    let event = try JSONDecoder().decode(Event.self, from: data)
//                    self.parsedEvents = event.results
//                    completion(self.parsedEvents)
//                    
//                } catch {
//                    print(error)
//                }
//            }
//        }).resume()
//    }
//}
