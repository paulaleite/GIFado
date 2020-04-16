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
    
    let months = ["Janeiro","Fevereiro","Março","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro"]
    
    let weekDays = ["Segunda-feira","Terça-feira","Quarta-feira","Quinta-feira","Sexta-feira","Sábado","Domingo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func nextMonth(_ sender: Any) {
    }
    
    @IBAction func monthBefore(_ sender: Any) {
    }
    
}

