//
//  CalendarDataSource.swift
//  GIFiado
//
//  Created by Paula Leite on 16/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import UIKit

class CalendarDataSource: NSObject, UICollectionViewDataSource {
    
    var calendarCV = CalendarViewController()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if year % 4 == 0 {
            calendarCV.daysInEachMonth[1] = 29
        } else {
            calendarCV.daysInEachMonth[1] = 28
        }
        
        switch calendarCV.direction {
        case 0:
            return calendarCV.daysInEachMonth[month - 1] + calendarCV.numberOfEmptyBoxes
        case 1...:
            return calendarCV.daysInEachMonth[month - 1] + calendarCV.nextNumberOfEmptyBoxes
        case -1:
            return calendarCV.daysInEachMonth[month - 1] + calendarCV.previousNumberOfEmptyBoxes
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
            cell.backgroundColor = UIColor.clear
            cell.dateLabel.textColor = UIColor.black
            
            if cell.isHidden {
                cell.isHidden = false
            }
            
        switch calendarCV.direction {
            case 0:
                cell.dateLabel.text = "\(indexPath.row + 1 - calendarCV.numberOfEmptyBoxes)"
            case 1...:
                cell.dateLabel.text = "\(indexPath.row + 1 - calendarCV.nextNumberOfEmptyBoxes)"
            case -1:
                cell.dateLabel.text = "\(indexPath.row + 1 - calendarCV.previousNumberOfEmptyBoxes)"
            default:
                fatalError()
            }
            
            if Int(cell.dateLabel.text!)! < 1 {
                cell.isHidden = true
            }
            
            switch indexPath.row {
            case 5,6,12,13,19,20,26,27,33,34:
                if Int(cell.dateLabel.text!)! > 0 {
                    cell.dateLabel.textColor = UIColor.lightGray
                }
            default:
                break
            }
            
        if calendarCV.currentMonth == calendarCV.months[calendar.component(.month, from: date) - 1] && year == calendar.component(.year, from: date) && indexPath.row + 1 == day {
                cell.backgroundColor = UIColor.red
            }
            
        return cell
    }
}
    
    

