//
//  CalculatingKinds.swift
//  Gym Help
//
//  Created by Павло on 12.05.2023.
//

import Foundation
import SwiftUI

class Calculating: ObservableObject{
    
    //MARK: Weight and Height and Age
    @Published var allMass: Double = 50.5
    @Published var height: Double = 160
    @Published var age: Int = 10
    
    
    
    //MARK: Body Fat
    
    @Published var orientation = "Male"
    var orientationsArray = ["Male", "Female"]
    @Published var fatPercent: Double = 15
    @Published var showBodyFatAlert = false
    
    
    //MARK: Activity Factor
    
    var kindsOfActivity = ["Passive lifestyle", "Moderate activity (light physical activity or exercise 1-3 times a week", "Medium activity (classes 3-5 times a week)", "Active people (intensive exercise, classes 6-7 times a week)"]
    
    @Published var TDEE = "Moderate activity (light physical activity or exercise 1-3 times a week"
    
    
    
    //MARK: Goal
    
    var goals = ["Deficit", "Balance", "Surplus"]
    @Published var goal: String = "Deficit"
    
    func defineFactor() -> Double{
        switch TDEE{
        case "Passive lifestyle": return 1.2
        case "Moderate activity (light physical activity or exercise 1-3 times a week": return 1.375
        case "Medium activity (classes 3-5 times a week)": return 1.55
        case "Active people (intensive exercise, classes 6-7 times a week)": return 1.725
        default:
            return 1.375
        }
    }
    
    
    
    
    
    
    
    //MARK: Calculating
    
    
    
    @Published var result: Dictionary<String, String> = [:]
    @Published var showResultView = false
    
    
    func calculate(){
        
        var dryMass: Double {
            let dry = allMass - allMass * fatPercent/100
            return round(dry * 100) / 100.0
        }
        
        var BMR: Double {
            switch orientation{
            case "Male": return 88.362 + (13.397 * dryMass) + (4.799 * height) - (5.677 * Double(age))
            case "Female": return 447.593 + (9.247 * dryMass) + (3.098 * height) - (4.330 * Double(age))
            default:
                return 88.362 + (13.397 * dryMass) + (4.799 * height) - (5.677 * Double(age))
            }
        }
        
        let TEF: Double = BMR * 0.10
        
        
        
        var calorieAmount: Double {
            switch goal{
            case "Deficit": return (BMR * defineFactor() + TEF) -  (BMR * defineFactor() + TEF) * 0.15
            case "Balance": return (BMR * defineFactor() + TEF)
            case "Surplus": return (BMR * defineFactor() + TEF) + (BMR * defineFactor() + TEF) * 0.15
            default:
                return (BMR * defineFactor() + TEF)
            }
        }
        
        var proteins: Double {
            switch goal{
            case "Deficit": return round(dryMass * 2.5)
            case "Balance": return round(dryMass * 1.5)
            case "Surplus": return round(dryMass * 1.5)
            default: return round(dryMass * 1.5)
            }
        }
        
        var fats: Double {
            switch goal{
            case "Deficit": return round(dryMass * 1)
            case "Balance": return round(dryMass * 1)
            case "Surplus": return round(dryMass * 1)
            default: return round(dryMass * 1)
            }
        }
        
        var carbs: Double {
            switch goal{
            case "Deficit": return round((calorieAmount - ((dryMass * 2.5) * 4 + (dryMass * 1) * 9)) / 4)
            case "Balance": return round((calorieAmount - ((dryMass * 1.5) * 4 + (dryMass * 1) * 9)) / 4)
            case "Surplus": return round((calorieAmount - ((dryMass * 1.5) * 4 + (dryMass * 1) * 9)) / 4)
            default: return round((calorieAmount - ((dryMass * 1.5) * 4 + (dryMass * 1) * 9)) / 4)
            }
        }
        
        //updating values
        
        result.updateValue(String(round(calorieAmount)), forKey: "calories")
        result.updateValue(String(round(BMR)), forKey: "BMR")
        result.updateValue(String(round(dryMass)), forKey: "dryMass")
        result.updateValue(String(round(proteins)), forKey: "proteins")
        result.updateValue(String(round(fats)), forKey: "fats")
        result.updateValue(String(round(carbs)), forKey: "carbs")
        
        //ending the calculating
        
        if result.isEmpty != true{
            self.showResultView = true
        }
        
        
        
    }
    
    
    //MARK: Copy to clipboard
    @Published var copyResult: String = ""
    
    func copy(){
        
        UIPasteboard.general.strings = ["Your basic consume: \(result["BMR"]!)", "Your dry weight: \(result["dryMass"]!)", "Calories intake for \(goal): \(result["calories"]!)", "Proteins: \(result["proteins"]!)", "Fats: \(result["fats"]!)", "Carbs: \(result["carbs"]!)"]
        
    }
    
    
    
    
    

    
    
}
