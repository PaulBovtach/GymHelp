//
//  Exercise.swift
//  Gym Help
//
//  Created by Павло on 19.04.2023.
//

import Foundation

struct Exercises: Codable, Hashable {
    let name: String
    let force: Force?
    let level: Level
    let mechanic: Mechanic?
    let equipment: Equipment?
    let primaryMuscles, secondaryMuscles: [AryMuscle]
    let instructions: [String]
    let category: Category
}

enum Category: String, Codable {
    case cardio = "cardio"
    case olympicWeightlifting = "olympic weightlifting"
    case plyometrics = "plyometrics"
    case powerlifting = "powerlifting"
    case strength = "strength"
    case stretching = "stretching"
    case strongman = "strongman"
}

enum Equipment: String, Codable {
    case bands = "bands"
    case barbell = "barbell"
    case bodyOnly = "body only"
    case cable = "cable"
    case dumbbell = "dumbbell"
    case eZCurlBar = "e-z curl bar"
    case exerciseBall = "exercise ball"
    case foamRoll = "foam roll"
    case kettlebells = "kettlebells"
    case machine = "machine"
    case medicineBall = "medicine ball"
    case other = "other"
}

enum Force: String, Codable {
    case forceStatic = "static"
    case pull = "pull"
    case push = "push"
}

enum Level: String, Codable {
    case beginner = "beginner"
    case expert = "expert"
    case intermediate = "intermediate"
}

enum Mechanic: String, Codable {
    case compound = "compound"
    case isolation = "isolation"
}

enum AryMuscle: String, Codable {
    case abdominals = "abdominals"
    case abductors = "abductors"
    case adductors = "adductors"
    case biceps = "biceps"
    case calves = "calves"
    case chest = "chest"
    case forearms = "forearms"
    case glutes = "glutes"
    case hamstrings = "hamstrings"
    case lats = "lats"
    case lowerBack = "lower back"
    case middleBack = "middle back"
    case neck = "neck"
    case quadriceps = "quadriceps"
    case shoulders = "shoulders"
    case traps = "traps"
    case triceps = "triceps"
    case none = "none"
}

