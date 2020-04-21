//
//  HolidaysTVC.swift
//  GIFiado
//
//  Created by Paula Leite on 16/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import UIKit

class HolidaysTVC: UITableViewController {
    
    var listOfHolidays = [HolidayDetail]() {
        didSet {
            // Because it's going to happen in UI
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.removeLoadingAlert()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLoadingAlert()
        let holidayRequest = HolidayRequest()
        holidayRequest.getHolidays { [weak self] result in
            switch result {
                case .failure(let error):
                    print (error)
                case .success(let holidays):
                    self?.listOfHolidays = holidays
            }
        }
        
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfHolidays.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HolidayCell") as! HolidayTVCell
        
        let holiday = listOfHolidays[indexPath.row]
        
        cell.holidayName.text = holiday.name
        cell.holidayDate.text = holiday.date.iso
        
        return cell
    }

//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 140
//    }
//    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GifVC {
            guard let selectedRow = tableView.indexPathForSelectedRow?.row else { return }
            
            destination.holiday = listOfHolidays[selectedRow]
        }
    }
    

}
