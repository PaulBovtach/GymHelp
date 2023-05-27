//
//  ContentView.swift
//  Gym Help
//
//  Created by Павло on 19.04.2023.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct ContentView: View {

    var body: some View {
        
        TabView{
            CalorieCalcView()
                .tabItem {
                    Label("Calc", systemImage: "plus.forwardslash.minus")
                }
            
            CompoundExercisesListView()
                .tabItem {
                    Label("Compound ex.", systemImage: "figure.cooldown")
                        
                }
            IsolationExercisesListView()
                .tabItem {
                    Label("Isolation ex.", systemImage: "dumbbell")
                }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
