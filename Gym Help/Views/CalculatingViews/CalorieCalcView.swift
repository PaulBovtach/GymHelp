//
//  CalorieCalcView.swift
//  Gym Help
//
//  Created by Павло on 12.05.2023.
//

import SwiftUI


struct CalorieCalcView: View {
    @StateObject var calculating = Calculating()
    
    @State private var checkAmount = 0.0
    
    var body: some View {
        NavigationStack {
            Form{
                
                //MARK: Weight and Height and Age
                Section(content: {
                    HStack{
                        Text("Your weight(kg):")
                            .foregroundColor(CustomColor.textBrown)
                        TextField("Amount", value: $calculating.allMass, format: .number)
                            .keyboardType(.decimalPad)
                            .scrollDismissesKeyboard(.interactively)
                    }
                    HStack{
                        Text("Your height(cm):")
                            .foregroundColor(CustomColor.textBrown)
                        TextField("Amount", value: $calculating.height, format: .number)
                            .keyboardType(.decimalPad)
                            .scrollDismissesKeyboard(.interactively)
                    }
                    Picker("Select age:", selection: $calculating.age){
                        ForEach(10..<100, id: \.self){
                            Text("\($0)")                        }
                    }
                    .foregroundColor(CustomColor.textBrown)
                    
                }, header: {
                    Text("Basic")
                        .foregroundColor(CustomColor.textBrown)
                })
                
                //MARK: Body Fat
                
                Section {
                    
                    HStack{
                        Text("Orientation:")
                            .foregroundColor(CustomColor.textBrown)
                        Picker("Orientation:", selection: $calculating.orientation) {
                            ForEach(calculating.orientationsArray, id: \.self){or in
                                Text("\(or)")
                                    .foregroundColor(CustomColor.textBrown)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    
                    HStack{
                        Text("Body fat percentage %:")
                            .foregroundColor(CustomColor.textBrown)
                        
                        
                        TextField("Percentage", value: $calculating.fatPercent, format: .number)
                            .keyboardType(.numberPad)
                            .scrollDismissesKeyboard(.interactively)
                            .frame(width: 100)
                            .foregroundColor(CustomColor.textBrown)
                    }
                    
                    VStack(spacing: 10){
                        switch calculating.orientation{
                        case "Male": Image("BodyFatMan")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20)
                        case "Female":Image("BodyFatWoman")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20)
                        default:
                            Image("BodyFatMan")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20)
                        }
                    }
                    
                    
                } header: {
                    HStack(alignment: .center){
                        Text("Body Fat")
                            .foregroundColor(CustomColor.textBrown)
                        Button{
                            self.calculating.showBodyFatAlert = true
                        }label: {
                            Image(systemName: "info.circle")
                        }
                    }
                }
                
                //MARK: Total Daily Energy Expenditure
                
                Section{
                    Picker("Chose your activity", selection: $calculating.TDEE) {
                        ForEach(calculating.kindsOfActivity, id: \.self){kind in
                            Text("\(kind)")
                                .foregroundColor(CustomColor.textBrown)
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                    
                    VStack{
                        Text("Choose your goal")
                            .foregroundColor(CustomColor.textBrown)
                        
                        Picker("Choose your goal", selection: $calculating.goal){
                            ForEach(calculating.goals, id: \.self){goal in
                                Text("\(goal)")
                                    .foregroundColor(CustomColor.textBrown)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    
                }header: {
                    Text("Total Daily Energy Expenditure")
                        .foregroundColor(CustomColor.textBrown)
                }
                
            }
            
            .toolbar(content: {
                ToolbarItem(placement: .bottomBar) {
                    Button("Calculate"){
                        calculating.calculate()
                    }
                }
            })
            .sheet(isPresented: $calculating.showResultView, content: {
                CalorieResultView(calculating: calculating)
            })
            .alert(isPresented: $calculating.showBodyFatAlert) {
                Alert(title: Text("Info"), message: Text("Look at these pictures, define which is the most similar to you. Type the percentage."), dismissButton: .default(Text("Ok")))
            }
            .navigationTitle("Calories calculator")
        }
    }
}

struct CalorieCalcView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieCalcView()
    }
}
