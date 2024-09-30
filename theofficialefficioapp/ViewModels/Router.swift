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
