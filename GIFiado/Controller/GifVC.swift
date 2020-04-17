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
        
        gifRequest.getGifs(holidayName: safeHoliday) { (result) in
            
            
            player = AVPlayer(url: URL(fileReferenceLiteralResourceName: result, error))
            self.avPlayerLayer = AVPlayerLayer(player: self.player)
            self.avPlayerLayer.videoGravity = AVLayerVideoGravity.resize

            self.gifImageView.layer.addSublayer(self.avPlayerLayer)
            self.player.play()
            
            
            print(result)
        }
        
        guard let path = Bundle.main.path(forResource: "Logo-Animation4", ofType:"mp4") else {
            debugPrint("Logo-Animation4.mp4 not found")
            return
        }
        
//        gifImageView.loadGif(name: "test.mp4")
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        avPlayerLayer.frame = gifImageView.layer.bounds
    }
    
    @IBAction func shareGifButton(_ sender: Any) {
        
        let gif = gifImageView.image
        
        let activityViewController = UIActivityViewController(activityItems: [gif!], applicationActivities: nil)
        
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
}
