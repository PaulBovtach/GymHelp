//
//  ExerciseDetailView.swift
//  Gym Help
//
//  Created by Павло on 23.04.2023.
//

import SwiftUI
import UIKit
import SDWebImageSwiftUI

struct ExerciseDetailView: View {
    
    
    
    var exercise: Exercises
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading){
                    HStack{
                        WebImage(url: URL(string: "https://raw.githubusercontent.com/wrkout/exercises.json/master/exercises/\(exercise.name.replacingOccurrences(of: " ", with: "_").replacingOccurrences(of: "/", with: "_"))/images/0.jpg"))
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(5)
                        
                        WebImage(url: URL(string: "https://raw.githubusercontent.com/wrkout/exercises.json/master/exercises/\(exercise.name.replacingOccurrences(of: " ", with: "_").replacingOccurrences(of: "/", with: "_"))/images/1.jpg"))
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(5)
                    }
                    .padding(.horizontal, 10)
                    
                    Divider()
                        .background(CustomColor.textBrown)
                        .padding(.horizontal, 10)
                        .padding(.top)
                    
                    Text("Information")
                        .foregroundColor(CustomColor.textBrown)
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding(.leading, 10)
                    
                        VStack(alignment: .leading, spacing: 15){
                            Group{
                                Text("🪝 Force: \(exercise.force?.rawValue ?? "none")")
                                Text("🏅 Level: \(exercise.level.rawValue)")
                                Text("🔗 Mechanic: \(exercise.mechanic?.rawValue ?? "none")")
                                Text("🦾 Equipment: \(exercise.equipment?.rawValue ?? "none")")
                                Text("🏋️ Category: \(exercise.category.rawValue)")
                            }
                            .fontWeight(.semibold)
                            .foregroundColor(CustomColor.textBrown)
                            .font(.title3)
                            .padding(.leading, 10)
                            
                            VStack(alignment: .leading){
                                
                                HStack{
                                    Text("Primary muscles:")
                                        .fontWeight(.semibold)
                                        .foregroundColor(CustomColor.textBrown)
                                        .font(.system(size: 17))
                                    ForEach(exercise.primaryMuscles, id: \.self){muscle in
                                        Text("| " + muscle.rawValue + " |")
                                            .foregroundColor(CustomColor.textBrown)
                                            .font(.caption)
                                    }
                                }
                                
                                
                                HStack{
                                    Text("Secondary muscles:")
                                        .fontWeight(.semibold)
                                        .foregroundColor(CustomColor.textBrown)
                                        .font(.system(size: 17))
                                    ForEach(exercise.secondaryMuscles, id: \.self){muscle in
                                        Text("| " + muscle.rawValue + " |")
                                            .foregroundColor(CustomColor.textBrown)
                                            .font(.caption)
                                    }
                                }
                                
                                
                            }
                            .padding(.leading, 10)
                        }
                    
                    //HOW TO DO THE EXERCISE???
                    
                    Divider()
                        .background(CustomColor.textBrown)
                        .padding(.horizontal, 10)
                        .padding(.top)
                    
                    Text("How to do the exercise?")
                        .foregroundColor(CustomColor.textBrown)
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding(.leading, 10)
                    ForEach(exercise.instructions, id: \.self){option in
                        Text("•" + option)
                            .font(.footnote)
                            .foregroundColor(CustomColor.textBrown)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 3)
                    }
                    
                }
                    
            }
            .navigationTitle(exercise.name)
        }
    }
}

struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
