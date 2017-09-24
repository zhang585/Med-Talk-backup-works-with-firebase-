//
//  Drugs.swift
//  Med Talk
//
//  Created by Sandy Zhang on 6/20/17.
//  Copyright © 2017 Sandy Zhang. All rights reserved.
//

import Foundation
import UIKit

class Drugs {
    
    // total of 32 variables below
    var drugNodeName: String!
    var administrationEmptyStomach: String!
    var administrationOptimalTimeOfDay: String!
    var administrationTechnique: String!
    var comments: String!
    var diseaseSpecific2: String!
    var diseaseSpecific3: String!
    var dosageForm: String!
    var genericName: String!
    var drugID: Int!
    var majorDrugInteractions: String!
    var majorFoodInteractions: String!
    var majorAlcoholInteractions: String!
    var notableSideEffectsGI: String!
    var notableSideEffectsOther: String!
    var notableSideEffectsSleepy: String!
    var notableSideEffectsSunlight: String!
    var notableSideEffectsWeight: String!
    var pharmacologicClass: String!
    var pharmacologicClass2: String!
    var REFadditionalInformation: String!
    var REFdiseaseSpecific: String!
    var REFmonitoringParameters: String!
    var REFnotableSideEffects: String!
    var REFstorageStability: String!
    var drugRoute: String!
    var specialPopulationAge: String!
    var specialPopulationPregnancyLactation: String!
    var therapeuticClass: String!
    var top200: String!
    var tradeName: String!
    var isPublished: Int!
    
    
    init(drugNodeNameLocal: String, drugData: [String: AnyObject]) {
        
        self.drugNodeName = drugNodeNameLocal
        
        if let administrationEmptyStomachLocal = drugData["AdministrationEmptyStomach"] as? String {
            self.administrationEmptyStomach = administrationEmptyStomachLocal
        }
        
        if let administrationOptimalTimeOfDayLocal = drugData["AdministrationOptimaltimeofday"] as? String {
            self.administrationOptimalTimeOfDay = administrationOptimalTimeOfDayLocal
        }
        
        if let administrationTechniqueLocal = drugData["AdministrationTechnique"] as? String {
            self.administrationTechnique = administrationTechniqueLocal
        }
        
        if let commentsLocal = drugData["Comments"] as? String {
            self.comments = commentsLocal
        }
        
        if let diseaseSpecific2Local = drugData["DiseaseSpecific2"] as? String {
            self.diseaseSpecific2 = diseaseSpecific2Local
        }
        
        if let diseaseSpecific3Local = drugData["DiseaseSpecific3"] as? String {
            self.diseaseSpecific3 = diseaseSpecific3Local
        }
        
        if let drugDosageFormLocal = drugData["DosageForm"] as? String {
            self.dosageForm = drugDosageFormLocal
        }

        if let genericNameLocal = drugData["GenericName"] as? String {
            self.genericName = genericNameLocal
        }
        
        if let drugIDLocal = drugData["ID"] as? Int {
            self.drugID = drugIDLocal
        }
        
        if let majorDrugInteractionsLocal = drugData["MajorDrugInteractions"] as? String {
            self.majorDrugInteractions = majorDrugInteractionsLocal
        }
        
        if let majorFoodInteractionsLocal = drugData["MajorFoodInteractionsFood"] as? String {
            self.majorFoodInteractions = majorFoodInteractionsLocal
        }
        
        if let majorAlcoholInteractionsLocal = drugData["MajorFoodInteractionsAlcohol"] as? String {
            self.majorAlcoholInteractions = majorAlcoholInteractionsLocal
        }
        
        if let notableSideEffectsGILocal = drugData["NotableSideEffectsGI"] as? String {
            self.notableSideEffectsGI = notableSideEffectsGILocal
        }
        
        if let notableSideEffectsOtherLocal = drugData["NotableSideEffectsOther"] as? String {
            self.notableSideEffectsOther = notableSideEffectsOtherLocal
        }
        
        if let notableSideEffectsSleepyLocal = drugData["NotableSideEffectsSleepy"] as? String {
            self.notableSideEffectsSleepy = notableSideEffectsSleepyLocal
        }
        
        if let notableSideEffectsSunlightLocal = drugData["NotableSideEffectsSunlight"] as? String {
            self.notableSideEffectsSunlight = notableSideEffectsSunlightLocal
        }
        
        if let notableSideEffectsWeightLocal = drugData["NotableSideEffectsWeight"] as? String {
            self.notableSideEffectsWeight = notableSideEffectsWeightLocal
        }
        
        if let pharmacologicClassLocal = drugData["PharmacologicClass"] as? String {
            self.pharmacologicClass = pharmacologicClassLocal
        }
        
        if let pharmacologicClass2Local = drugData["PharmacologicClass2"] as? String {
            self.pharmacologicClass2 = pharmacologicClass2Local
        }
        
        if let REFadditionalInformationLocal = drugData["REFAdditionalInformation"] as? String {
            self.REFadditionalInformation = REFadditionalInformationLocal
        }
        
        if let REFdiseaseSpecificLocal = drugData["REFDiseaseSpecific"] as? String {
            self.REFdiseaseSpecific = REFdiseaseSpecificLocal
        }
        
        if let REFmonitoringParametersLocal = drugData["REFMonitoringParameters"] as? String {
            self.REFmonitoringParameters = REFmonitoringParametersLocal
        }
        
        if let REFnotableSideEffectsLocal = drugData["REFNotableSideEffects"] as? String {
            self.REFnotableSideEffects = REFnotableSideEffectsLocal
        }
        
        if let REFstorageStabilityLocal = drugData["REFStorageStability"] as? String {
            self.REFstorageStability = REFstorageStabilityLocal
        }
        
        if let drugRouteLocal = drugData["Route"] as? String {
            self.drugRoute = drugRouteLocal
        }
        
        if let specialPopulationAgeLocal = drugData["SpecialPopulationsAge"] as? String {
            self.specialPopulationAge = specialPopulationAgeLocal
        }
        
        if let specialPopulationPregnancyLactationLocal = drugData["SpecialPopulationsPregnancyLactation"] as? String {
            self.specialPopulationPregnancyLactation = specialPopulationPregnancyLactationLocal
        }
        
        if let therapeuticClassLocal = drugData["TherapeuticClass"] as? String {
            self.therapeuticClass = therapeuticClassLocal
        }
        
        if let top200Local = drugData["Top200"] as? String {
            self.top200 = top200Local
        }
        
        
        if let tradeNameLocal = drugData["Tradename"] as? String {
            self.tradeName = tradeNameLocal
        }
        
        if let isPublishedLocal = drugData["isPublished"] as? Int {
            self.isPublished = isPublishedLocal
        }
        
    
    }
}
