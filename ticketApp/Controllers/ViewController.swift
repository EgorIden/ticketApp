//
//  ViewController.swift
//  ticketApp
//
//  Created by Egor on 10.08.2019.
//  Copyright © 2019 Egor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var eventsProvider = EventsProvider()
    private var events: [Events] = []
    private var imageProvider = ImageProvider()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        //получение списка мероприятий и картинок
        eventsProvider.getListOfEvents(completion: { (parsedEvents) in
            
            self.events = parsedEvents
            self.tableView.reloadData()
            let eventsCount = self.events.count
            for i in 0 ..< eventsCount {
                self.imageProvider.getImageData(completion: { data in
                    self.events[i].mainImage = data
                    let index = IndexPath(row: i, section: 0)
                    self.tableView.reloadRows(at: [index], with: .automatic)
                }, event: self.events[i])
            }
            
        }, url: kudagoURL)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:
            indexPath) as! tableViewCell
        
        cell.indicator.startAnimating()
        cell.textLbl.text = self.events[indexPath.row].short_title
        
        if let imageData = self.events[indexPath.row].mainImage,
            let image = UIImage(data: imageData) {
            cell.imgView.image = image
        }
        
        cell.indicator.stopAnimating()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        //передача данных на второй экран
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        detailVC.navigationController?.title = "Details"
        
        if let imageData = self.events[indexPath.row].mainImage,
            let image = UIImage(data: imageData) {
            detailVC.detailImage = image
        }
        if let description = self.events[indexPath.row].description?.withoutHtmlTags{
            detailVC.descriptionText = description
        }
        if let heading = self.events[indexPath.row].short_title{
            detailVC.headingText = heading
        }
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
}

//удаление html тегов
extension String {
    var withoutHtmlTags: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}


