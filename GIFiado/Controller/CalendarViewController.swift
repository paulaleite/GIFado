//
//  ViewController.swift
//  GIFiado
//
//  Created by Paula Leite on 15/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

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
    
    var delegate = CalendarDelegate()
    var dataSource = CalendarDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarCV.delegate = delegate
        calendarCV.dataSource = dataSource
        
        
    }
    
    
    @IBAction func nextMonth(_ sender: Any) {
    }
    
    @IBAction func monthBefore(_ sender: Any) {
    }
    
}

