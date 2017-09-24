//
//  DetailVC.swift
//  Med Talk
//
//  Created by Sandy Zhang on 6/21/17.
//  Copyright © 2017 Sandy Zhang. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet var indicationsField: UILabel!
    @IBOutlet var administrationField: UILabel!
    @IBOutlet var interactionsField: UILabel!
    @IBOutlet var specialPopulationField: UILabel!
    @IBOutlet var blackBoxWarningField: UILabel!
    
    var drug: Drugs! {
        didSet {
            navigationItem.title = "\(drug.genericName!) (\(drug.tradeName!))"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (drug.therapeuticClass) != nil {
            indicationsField.text = drug.therapeuticClass
        } else {
            indicationsField.text = ""
        }
        
        if (drug.administrationTechnique) != nil {
            administrationField.text = drug.administrationTechnique
        } else {
            administrationField.text = ""
        }
        
        if (drug.majorFoodInteractions) != nil {
            interactionsField.text = drug.majorFoodInteractions
        } else {
            interactionsField.text = ""
        }
        
        if (drug.specialPopulationAge) != nil {
            specialPopulationField.text = drug.specialPopulationAge
        } else {
            specialPopulationField.text = ""
        }
        
        if (drug.notableSideEffectsGI) != nil {
            blackBoxWarningField.text = drug.notableSideEffectsGI
        } else {
            blackBoxWarningField.text = ""
        }
        
        /*
        indicationsField.text = drug.therapeuticClass
        administrationField.text = drug.administrationTechnique
        interactionsField.text = drug.majorFoodInteractions
        specialPopulationField.text = drug.specialPopulationAge
        blackBoxWarningField.text = drug.notableSideEffectsGI
        */
    }
}
