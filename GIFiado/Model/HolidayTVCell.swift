//
//  HolidayTVC.swift
//  GIFiado
//
//  Created by Paula Leite on 16/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import UIKit

class HolidayTVCell: UITableViewCell {
    
    @IBOutlet weak var holidayName: UILabel!
    
    @IBOutlet weak var holidayDate: UILabel!
    
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.5764705882, blue: 0.3450980392, alpha: 1)
            containerView.layer.cornerRadius = 10
            containerView.layer.shadowOpacity = 6
            containerView.layer.shadowRadius = 4
            containerView.layer.shadowColor = UIColor.lightGray.cgColor
            containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
