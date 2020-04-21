//
//  GifVC.swift
//  GIFiado
//
//  Created by Paula Leite on 16/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import UIKit
import AVKit

class GifVC: UIViewController {
    
    var holiday: HolidayDetail?
    
    public var holidayTableView: HolidaysTVC?

    @IBOutlet weak var viewControllerTitle: UINavigationItem!
    
    @IBOutlet weak var gifImageView: UIImageView!
    
    var player: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    
    var spinnerView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let safeHoliday = holiday?.name else { return }
        let holidayNameFull = safeHoliday.replacingOccurrences(of: " ", with: "%20")
        viewControllerTitle.title = "\(safeHoliday)"
        
        showLoadingAlert()
        
        let gifRequest = GIFRequest()
        gifRequest.getGifs(holidayName: holidayNameFull) { (result) in
            switch result {
                case .failure(let error):
                    print(error)
                case .success(let gifImage):
                    guard let url = URL(string: gifImage) else { return }
                    if let data = try? Data(contentsOf: url) {
                        
                        DispatchQueue.main.async() {
                            self.gifImageView.loadGif(data: data)
                            self.removeLoadingAlert()
                        }
                    }
            }
        }
        
        
    }

    @IBAction func shareGifButton(_ sender: Any) {
        
        
        guard let gif = gifImageView.image else { return }
        
        let activityViewController = UIActivityViewController(activityItems: [gif], applicationActivities: nil)
        
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
}
