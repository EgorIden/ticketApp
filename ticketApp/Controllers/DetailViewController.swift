//
//  SecondViewController.swift
//  ticketApp
//
//  Created by Egor on 15.08.2019.
//  Copyright © 2019 Egor. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var heading: UILabel!
    
    @IBAction func buyTheTicket(_ sender: Any) {
        switchToNextScreen()
    }
    
    var detailImage: UIImage?
    var descriptionText: String?
    var headingText: String?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if let descriptionText = self.descriptionText{
            text.text = descriptionText
        }
        if let detailImage = self.detailImage{
            self.imageView.image = detailImage
        }
        if let headingText = self.headingText{
            self.heading.text = headingText
        }
    }
    
    func switchToNextScreen() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let finalViewController = mainStoryboard.instantiateViewController(withIdentifier: "FinalTicketVC") as? FinalTicketViewController {
            finalViewController.bgImage = self.detailImage
            self.navigationController?.pushViewController(finalViewController, animated: true)
        }
    }
    
}
