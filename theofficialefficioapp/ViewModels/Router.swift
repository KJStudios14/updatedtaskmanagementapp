//
//  Router.swift
//  theofficialefficioapp
//
//  Created by Monang Champaneri on 30/09/24.
//

import SwiftUI

final class Router: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case MainView
        case Login
        case ForgotPassword
        case CreateAccount
        case PreferedName(dataModel:SignUpModel)
        case YearGroupSelection(dataModel:SignUpModel)
        case SubjectsSelection(dataModel:SignUpModel)
        case OtherSubjectsSelection(dataModel:SignUpModel)
        case GoalSelection(dataModel:SignUpModel)
        case DailyHours(dataModel:SignUpModel)
        case SummaryView(dataModel:SignUpModel)
        case StopWatch
        case ChooseTimer
        case timerView(selectHour:Int,selectMinute:Int)
        case editProfile(dataModel:SignUpModel)
        case editYearGoal(dataModel:SignUpModel)
        case EditSubjectsSelection(dataModel:SignUpModel)
        case EditOtherSubjectsSelection(dataModel:SignUpModel)
        case EditGoalSelection(dataModel:SignUpModel)
        case EditDailyHours(dataModel:SignUpModel)
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
