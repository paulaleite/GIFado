//
//  GifVC.swift
//  GIFiado
//
//  Created by Paula Leite on 16/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import UIKit

class GifVC: UIViewController {
    
    var holiday: HolidayDetail?
    
    public var holidayTableView: HolidaysTVC?

    @IBOutlet weak var viewControllerTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let safeHoliday = holiday?.name else { return }
        
        viewControllerTitle.title = "\(safeHoliday)"
        
    }

}
