//
//  HolidaysTVC.swift
//  GIFiado
//
//  Created by Paula Leite on 16/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import UIKit

class HolidaysTVC: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    

}

extension HolidaysTVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
