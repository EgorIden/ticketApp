//
//  ImageProvider.swift
//  ticketApp
//
//  Created by Student on 22/08/2019.
//  Copyright © 2019 Egor. All rights reserved.
//

import Foundation
import UIKit

class ImageProvider {
    
    //загрузка картинок по соответствующим ссылкам
    func getImageData(completion: @escaping (_ result: Data) -> (), event: Events){
        let imgURL = event.images[0].image
        if let imgURL = imgURL{
            guard let url = URL(string: imgURL) else{return}
            let queue = DispatchQueue.global(qos: .userInitiated)
            queue.async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        completion(data)
                    }
                }else{
                    print("Wrong with data")
                }
            }
        }
    }
}
