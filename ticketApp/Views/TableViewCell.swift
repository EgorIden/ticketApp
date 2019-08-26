//
//  tableViewCell.swift
//  ticketApp
//
//  Created by Egor on 10.08.2019.
//  Copyright © 2019 Egor. All rights reserved.
//

import UIKit

class tableViewCell: UITableViewCell {
    
    @IBOutlet weak var tableViewCell: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var textLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
