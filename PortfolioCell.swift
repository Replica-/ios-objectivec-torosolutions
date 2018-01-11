//
//  PortfolioCell.swift
//  Toro Solutions
//
//  Created by Replica on 2/07/2015.
//  Copyright (c) 2015 Toro Solutions. All rights reserved.
//

import UIKit

class PortfolioCell: UITableViewCell {

    @IBOutlet weak var viewImage: UIImageView!

    @IBOutlet weak var viewLabel: UILabel!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var viewText: UITextView!
    
    var data:PortfolioItem?
}
