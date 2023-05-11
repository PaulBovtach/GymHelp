//
//  CompoundExercisesListView.swift
//  Gym Help
//
//  Created by Павло on 21.04.2023.
//

import SwiftUI
import UIKit

struct CompoundExercisesListView: View {
    
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.tintColor]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.tintColor]
    }
    
    
    
    @State var chosenMuscle: AryMuscle = .none
    
    let musclesGroups: [AryMuscle] = [.none, .abdominals, .abductors, .adductors, .biceps, .calves, .chest, .forearms, .glutes, .hamstrings, .lats, .lowerBack, .middleBack, .neck, .quadriceps, .shoulders, .traps, .triceps]
    
    
    var oneMuscleGroupFiltered: [Exercises] {
        if searchText.isEmpty{
            if chosenMuscle == .none {
                return exercises.filter { exercise in
                    return exercise.mechanic == .compound
                }
            }else{
                return exercises.filter { exercise in
                    return exercise.primaryMuscles.first == chosenMuscle && exercise.mechanic == .compound
                }
            }
        }else{
            return exercises.filter { exercise in
               return exercise.name.contains(searchText) && exercise.mechanic == .compound
            }
        }
    }
    
    @State private var searchText = ""
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(oneMuscleGroupFiltered, id: \.self){ exercise in
                    NavigationLink(destination: ExerciseDetailView(exercise: exercise)){
                        VStack(){
                            HStack(){
                                Text(exercise.name)
                                    .font(.footnote)
                                    .fontWeight(.heavy)
                                    .foregroundColor(CustomColor.textBrown)
                                
                                Spacer()
                                
                                VStack{
                                    ForEach(exercise.primaryMuscles, id: \.self){muscle in
                                        Text(muscle.rawValue)
                                            .foregroundColor(CustomColor.textBrown)
                                            .font(.caption2)
                                    }
                                }
                            }
                            .padding()
                            .background(Color.accentColor)
                            .cornerRadius(10)
                        }
                        .padding(.horizontal, 5)
                    }
                    
                    
                    
                }
                .navigationTitle("Compound Exercises")
                .navigationBarTitleDisplayMode(.inline)
                
                
            }
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.secondaryAction) {
                    Picker("Choose muscle group", selection: $chosenMuscle) {
                        ForEach(musclesGroups, id: \.self){ muscle in
                            Text(muscle.rawValue)
                        }
                    }
                }
            }
        }.searchable(text: $searchText, prompt: "Search an exercise by it's name")
    }
}

struct CompoundExercisesListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
