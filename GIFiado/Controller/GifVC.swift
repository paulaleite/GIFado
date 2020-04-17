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
    
    @IBOutlet weak var gifImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let safeHoliday = holiday?.name else { return }
        viewControllerTitle.title = "\(safeHoliday)"
        
        let gifRequest = GIFRequest()
//        gifRequest { weak self result in
//            switch result {
//                case .failure(let error):
//                    print (error)
//                case .success(let holidays):
//                    self?.listOfHolidays = holidays
//            }
//        }
        
//        gifRequest.getGifs { (result) in
//            print(result)
//        }
        
//        gifImageView.loadGif(name: "test.mp4")
        
    }
    
    
    @IBAction func shareGifButton(_ sender: Any) {
        
        let gif = gifImageView.image
        
        let activityViewController = UIActivityViewController(activityItems: [gif!], applicationActivities: nil)
        
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
}
