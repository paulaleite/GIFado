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
        let holidayNameFull = safeHoliday.replacingOccurrences(of: " ", with: "")
        viewControllerTitle.title = "\(safeHoliday)"
        
        
        let gifRequest = GIFRequest()
        gifRequest.getGifs(holidayName: holidayNameFull) { (result) in
            switch result {
                case .failure(let error):
                    print(error)
                case .success(let gifImage):
                    self.downloadImage(from: URL(string: gifImage)!)
            }
        }
        
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.gifImageView.loadGif(data: data)
            }
        }
    }
    
    @IBAction func shareGifButton(_ sender: Any) {
        
        let gif = gifImageView.image
        
        let activityViewController = UIActivityViewController(activityItems: [gif!], applicationActivities: nil)
        
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
}
