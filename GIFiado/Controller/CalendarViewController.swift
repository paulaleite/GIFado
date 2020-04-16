//
//  ViewController.swift
//  GIFiado
//
//  Created by Paula Leite on 15/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var calendarCV: UICollectionView!
    
    @IBOutlet weak var monthLabel: UILabel!
    
    let months = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]
    
    let weekdays = ["Segunda-feira", "Terça-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira", "Sábado", "Domingo"]
    
    var daysInEachMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    var currentMonth = String()
    
    var numberOfEmptyBoxes = Int()
    
    var nextNumberOfEmptyBoxes = Int()
    
    var previousNumberOfEmptyBoxes = 0
    
    var direction = 0
    
    var positionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarCV.delegate = self
        calendarCV.dataSource = self
        
        currentMonth = months[month - 1]
        monthLabel.text = "\(currentMonth) \(year)"
    }
    
    
    @IBAction func nextMonth(_ sender: Any) {
        switch currentMonth {
        case "Dezembro":
            month = 1
            year += 1
            direction = 1
            getStartDateDayPosition()
            currentMonth = months[month - 1]
            monthLabel.text = "\(currentMonth) \(year)"
            calendarCV.reloadData()
            
        default:
            month += 1
            direction = 1
            getStartDateDayPosition()
            currentMonth = months[month - 1]
            monthLabel.text = "\(currentMonth) \(year)"
            calendarCV.reloadData()
        }
        
    }
    
    @IBAction func monthBefore(_ sender: Any) {
        
        switch currentMonth {
        case "Janeiro":
            month = 12
            year -= 1
            direction = -1
            getStartDateDayPosition()
            currentMonth = months[month - 1]
            monthLabel.text = "\(currentMonth) \(year)"
            calendarCV.reloadData()
            
        default:
            month -= 1
            direction = -1
            getStartDateDayPosition()
            currentMonth = months[month - 1]
            monthLabel.text = "\(currentMonth) \(year)"
            calendarCV.reloadData()
        }
    }
    
    func getStartDateDayPosition() {
        switch direction {
        case 0:
            switch day {
            case 1...7:
                numberOfEmptyBoxes = weekDay - day
            case 8...14:
                numberOfEmptyBoxes = weekDay - day - 7
            case 15...21:
                numberOfEmptyBoxes = weekDay - day - 14
            case 22...28:
                numberOfEmptyBoxes = weekDay - day - 21
            case 29...31:
                numberOfEmptyBoxes = weekDay - day - 28
            default:
                break
            }
            positionIndex = numberOfEmptyBoxes
        
        case 1...:
            nextNumberOfEmptyBoxes = (positionIndex + daysInEachMonth[month - 1])%7
            positionIndex = nextNumberOfEmptyBoxes
            
        case -1:
            previousNumberOfEmptyBoxes = (7 - (daysInEachMonth[month - 1] - positionIndex)%7)
            if previousNumberOfEmptyBoxes == 7 {
                previousNumberOfEmptyBoxes = 0
            }
            positionIndex = previousNumberOfEmptyBoxes
            
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if year%4 == 0 {
            daysInEachMonth[1] = 29
        } else {
            daysInEachMonth[1] = 28
        }
        
        switch direction {
        case 0:
            return daysInEachMonth[month - 1] + numberOfEmptyBoxes
        case 1...:
            return daysInEachMonth[month - 1] + nextNumberOfEmptyBoxes
        case -1:
            return daysInEachMonth[month - 1] + previousNumberOfEmptyBoxes
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
        
        switch direction {
        case 0:
            cell.dateLabel.text = "\(indexPath.row + 1 - numberOfEmptyBoxes)"
        case 1...:
            cell.dateLabel.text = "\(indexPath.row + 1 - nextNumberOfEmptyBoxes)"
        case -1:
            cell.dateLabel.text = "\(indexPath.row + 1 - previousNumberOfEmptyBoxes)"
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
        
        if currentMonth == months[calendar.component(.month, from: date) - 1] && year == calendar.component(.year, from: date) && indexPath.row + 1 == day {
            cell.backgroundColor = UIColor.red
        }
        
        return cell
    }
    
}

