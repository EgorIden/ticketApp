//
//  EventsProvider.swift
//  ticketApp
//
//  Created by Student on 24/08/2019.
//  Copyright © 2019 Egor. All rights reserved.
//

import Foundation
import UIKit

class EventsProvider {
    
    private var events:[Events] = []
    
    private func handleClientError(_ error: Error){
        let error = error
        print(error)
    }
    
    private func handleServerError(_ response: URLResponse?){
        let response = response
        print(response)
    }
    
    //парсинг данных JSON
    func getListOfEvents(completion: @escaping (_ result: [Events]) -> (), url: URL?) {
        
        guard let url = url else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                self.handleClientError(error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    self.handleServerError(response)
                    return
            }
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                do {
                    let  eventsFromJSON = try JSONDecoder().decode(Json.self, from: data)
                    self.events = eventsFromJSON.results
                    completion(self.events)
                } catch {
                    print(error)
                }
            }
            
        }.resume()
    }
}
