//
//  CalorieResultView.swift
//  Gym Help
//
//  Created by Павло on 24.05.2023.
//

import SwiftUI

struct CalorieResultView: View {
    @ObservedObject var calculating: Calculating
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    HStack{
                        Text("Your basic consume:")
                            .foregroundColor(CustomColor.textBrown)
                        Text("\(calculating.result["BMR"] ?? "none") kcal")
                            .foregroundColor(CustomColor.textBrown)
                            .fontWeight(.semibold)
                    }
                    HStack{
                        Text("Your dry weight:")
                            .foregroundColor(CustomColor.textBrown)
                        Text("\(calculating.result["dryMass"] ?? "none") kg")
                            .foregroundColor(CustomColor.textBrown)
                            .fontWeight(.semibold)
                    }
                }
                Section{
                    HStack{
                        Text("Calories intake for \(calculating.goal):")
                            .foregroundColor(CustomColor.textBrown)
                        Text("\(calculating.result["calories"] ?? "none") kcal")
                            .foregroundColor(CustomColor.textBrown)
                            .fontWeight(.semibold)
                    }
                    
                    HStack{
                        Text("Proteins:")
                            .foregroundColor(CustomColor.textBrown)
                        Text("\(calculating.result["proteins"] ?? "none") g")
                            .foregroundColor(CustomColor.textBrown)
                            .fontWeight(.semibold)
                    }
                    
                    HStack{
                        Text("Fats:")
                            .foregroundColor(CustomColor.textBrown)
                        Text("\(calculating.result["fats"] ?? "none") g")
                            .foregroundColor(CustomColor.textBrown)
                            .fontWeight(.semibold)
                    }
                    
                    HStack{
                        Text("Carbs:")
                            .foregroundColor(CustomColor.textBrown)
                        Text("\(calculating.result["carbs"] ?? "none") g")
                            .foregroundColor(CustomColor.textBrown)
                            .fontWeight(.semibold)
                    }
                    
                }header: {
                    Text("Consume for your goal") 
                }
                Button{
                    calculating.copy()
                }label: {
                    HStack{
                        Spacer()
                        Text("Copy to clipboard")
                            .foregroundColor(.accentColor)
                            .fontWeight(.semibold)
                            .padding(8)
                        Spacer()
                    }
                }
            }
            
            
            .navigationTitle("Result")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CalorieResultView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
