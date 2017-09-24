//
//  FavoritesVC.swift
//  Med Talk
//
//  Created by Sandy Zhang on 6/24/17.
//  Copyright © 2017 Sandy Zhang. All rights reserved.
//

import UIKit

class FavoritesVC: UITableViewController {
    
    
    var drugs = [Drugs]()
    let searchController = UISearchController(searchResultsController: nil)
    var filterFavoriteDrugs = [Drugs]()

    
    override func viewDidLoad() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
 /*
        drugs = [
            
            Drugs(genericName: "Tamsulosin", brandName: "Flomax", indication: "Enlarged Prostate", drugClass: "Blocker", administration: "Best absorbed with food", interactions: "None", specialPopulation: "Pregnancy Category X", blackBoxWarning: "None")
        ]
 */
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filterFavoriteDrugs = drugs.filter { drug in
            return drug.genericName.localizedLowercase.localizedStandardContains(searchText.localizedLowercase)
        }
        
        tableView.reloadData()
    }

    
}


// allows MasterVC to respond to the search bar
extension FavoritesVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}
