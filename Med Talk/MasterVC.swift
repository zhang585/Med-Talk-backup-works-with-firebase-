//
//  MasterVC.swift
//  Med Talk
//
//  Created by Sandy Zhang on 6/20/17.
//  Copyright © 2017 Sandy Zhang. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MasterVC: UITableViewController {

    
    var drugs = [Drugs]()
    let searchController = UISearchController(searchResultsController: nil)
    
    // added for searching
    var filteredDrugs = [Drugs]()
    
    // firebase empty array to store firebase objects
    var ref:FIRDatabaseReference?
    var databaseHandle:FIRDatabaseHandle?
    //var firebaseDrugData = [String]()
    var allDrugs = [Drugs]()


    
// *************************************** Do upon loading ****************************************//
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
//        searchController.searchResultsUpdater = self
//        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        
        
        // set the firebase reference
        ref = FIRDatabase.database().reference()
        
        // this is our firebase listener
        ref?.observe(.value, with: { (snapshot) in
            
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                
                // for every item in snapshot, do the following below
                for item in snapshot {
                    
                    // continue if the values of the items exist and can be casted in the format [String: AnyObject]
                    if let drugValues = item.value as? [String: AnyObject] {
                        
                        // for every item in snapshot, we'll create an object using class 'Drug' and store it by appending it to an array
                        let localDrugObj = Drugs(drugNodeNameLocal: item.key, drugData: drugValues)
                        
                        // appends each of the drug object instances into an array
                        self.allDrugs.append(localDrugObj)
                        print(localDrugObj.genericName)
                    }
                } // end of for loop
                print(self.allDrugs.count)
            } // end of storing all items from snapshot
            
            self.tableView.reloadData()
            
        }) // end of .observe listener
 
        
        
 /*
        drugs = [
            
            Drugs(genericName: "Tamsulosin", brandName: "Flomax", indication: "Enlarged Prostate", drugClass: "Blocker", administration: "Best absorbed with food", interactions: "None", specialPopulation: "Pregnancy Category X", blackBoxWarning: "None"),
            Drugs(genericName: "Amlodipine", brandName: "Norvasc", indication: "Blood Pressure", drugClass: "Calcium Channel Blocker", administration: "Best absorbed on empty stomach", interactions: "Beware of other blood pressure lowering agents", specialPopulation: "Pregnancy Category C", blackBoxWarning: "None"),
            Drugs(genericName: "Felodipine", brandName: "Cabren", indication: "High Blood Pressure", drugClass: "Calcium Channel Blocker", administration: "Best Absorbed w/o food", interactions: "Do not consume with fatty meal", specialPopulation: "Avoid in children < 5 years old", blackBoxWarning: "None"),
            Drugs(genericName: "Simvastatin", brandName: "Zocor", indication: "Hyperlipidemia", drugClass: "HMC-CoA Reductase Inhibitor", administration: "Best taken at night", interactions: "Avoid Grapfruit Juice", specialPopulation: "Avoid in Asians taking Niacin. Avoid in patients with severe renal impairment", blackBoxWarning: "None"),
            Drugs(genericName: "Metoprolol", brandName: "Lopressor", indication: "High Blood Pressure", drugClass: "Beta Blocker", administration: "Avoid when operating heavy machinery", interactions: "Avoid in patients with hepatic impairment", specialPopulation: "Dosage adjustment not necessary in patients with renal impairment", blackBoxWarning: "Ischemic heart disease may be exacerbated after aburpt withdrawal"),
            Drugs(genericName: "Loperamide", brandName: "Imodium", indication: "Acute Diarrhea", drugClass: "Antidiarrheal", administration: "Avoid food during administration", interactions: "Food rich in fiber as this med slows intestinal motility", specialPopulation: "Avoid in patients on opoids as this may cause additive effects from GI slowing", blackBoxWarning: "Torsades de Pointes and sudden death, cardiac arrest were reported with use of higher than recommended dosages"),
            Drugs(genericName: "Ranitidine", brandName: "Zantac", indication: "Gastroesophageal Reflux Disease", drugClass: "Histamine H2 Antagonists", administration: "Can be taken with or without food", interactions: "Avoid alcohol", specialPopulation: "Avoid in renal impaired patients", blackBoxWarning: "None"),
            Drugs(genericName: "Gabapentin", brandName: "Neurontin", indication: "Partial Seizures, Postherpetic Neuralgia, Restless Leg Syndrome", drugClass: "Anticonvulsants", administration: "Best absorbed with evening meal", interactions: "Avoid Pineapples", specialPopulation: "Avoid in lactating patients", blackBoxWarning: "None"),
            Drugs(genericName: "Atorvastatin", brandName: "Lipitor", indication: "High Cholesterol", drugClass: "HMG-CoA Reductase Inhibitor", administration: "Best taken at bedtime as most cholesterol is produced in sleep", interactions: "Avoid grapefruit and grapefruit juice", specialPopulation: "Muscle pains in elderly", blackBoxWarning: "None"),
            Drugs(genericName: "Abacavir", brandName: "Ziagen", indication: "HIV Infection", drugClass: "NRTIs", administration: "with or without food, noncompliance can lead to HIV virus mutation and resistance to Abacavir", interactions: "None", specialPopulation: "Avoid in hepatic impaired patients", blackBoxWarning: "Hypersensitivity Reactions"),
            Drugs(genericName: "Oxycodone/Acetaminophen", brandName: "Percocet", indication: "Moderate to Severe pain", drugClass: "Opioid Analgesic", administration: "Best taken at night to avoid daytime sedation", interactions: "Avoid food rich in fiber", specialPopulation: "Careful in elderly due to sedating properties", blackBoxWarning: "Risk of addiction and serious, life-threatening, or fatal respiratory depression"),
            Drugs(genericName: "Hydrocodone/Acetaminophen", brandName: "Norco", indication: "Moderate to Severe pain", drugClass: "Opioid Analgesic", administration: "Best taken at night to avoid daytime sedation", interactions: "Avoid food rich in fiber", specialPopulation: "Careful in elderly due to sedating properties", blackBoxWarning: "Risk of addiction and serious, life-threatening, or fatal respiratory depression")
                    ]

            Drugs(genericName: "Tamsulosin", brandName: "Flomax", indication: "Enlarged Prostate", drugClass: "blocker", indication: ),
            Drugs(genericName: "Amlodipine", brandName: "Norvasc", indication: "Blood Pressure", drugClass: "calcium channel blocker")
 */

            

        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 55
        
    }
    
    
    
// **************************** setting up our table view to conform *********************************//
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        // let candy: Candy
        /*
        if searchController.active && searchController.searchBar.text != "" {
            candy = filteredCandies[indexPath.row]
        } else {
            candy = candies[indexPath.row]
        }
        */
        // cell.textLabel?.text = candy.name
        // cell.detailTextLabel?.text = candy.category
        // return cell
        
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "drugCell", for: indexPath) as! drugCell
 
/*
        let drugsLocal: Drugs
        if searchController.isActive && searchController.searchBar.text != "" {
            drugsLocal = filteredDrugs[indexPath.row]
        } else {
            drugsLocal = drugs[indexPath.row]
        }
*/
        
        // let drug = drugs[indexPath.row]
        
        // configure the cell with the drug data
        cell.genericLabel.text = allDrugs[indexPath.row].genericName
        cell.brandLabel.text = allDrugs[indexPath.row].tradeName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // if user is searching, then return rows equivalent to matching search text
/*        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredDrugs.count
        }
    
*/
        return allDrugs.count
        
        
    }
    
    
// **************************** segue *********************************//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // If the triggered segue is the "showDrug" segue
        switch segue.identifier {
        case "showDrug"?:
                // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                // Get the item associated with this row and pass it aong
                // let drug = drugs[row]
/*                let drugsLocal2: Drugs
                if searchController.isActive && searchController.searchBar.text != "" {
                    drugsLocal2 = filteredDrugs[row]
                } else {
                    drugsLocal2 = drugs[row]
                }
*/
                 
/*
                let secondNav = segue.destination as! UINavigationController
                let detailViewController = secondNav.topViewController as! DetailVC
                detailViewController.drug = drugsLocal2
*/
                let drugLoc = allDrugs[row]
                
                let detailViewController = segue.destination as! DetailVC
                detailViewController.drug = drugLoc
            
            
            }
            
        default: preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    
// **************************** search bar stuff *********************************//
    // This filters the drugs array based on searchText and will put the results in the filteredDrugs array you just added.
/*    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredDrugs = drugs.filter { drug in
            return drug.genericName.localizedLowercase.localizedStandardContains(searchText.localizedLowercase)
        }
        
        tableView.reloadData()
    }
  */
    
}

/*
// allows MasterVC to respond to the search bar
extension MasterVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}
*/

