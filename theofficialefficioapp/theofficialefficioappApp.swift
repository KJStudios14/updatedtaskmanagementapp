//
//  theofficialefficioappApp.swift
//  theofficialefficioapp
//
//  Created by KJemide on 10/08/2024.
//
import FirebaseCore
import SwiftUI

@main
struct theofficialefficioappApp: App {
    
    @ObservedObject var router = Router()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath){
                SplashScreenView()
                    .environment(\.font, Font.custom("Mitr", size: UIFont.preferredFont(forTextStyle: .body).pointSize))
                                    .modifier(GlobalFontModifier())
                                    .navigationDestination(for: Router.Destination.self){ destination in
                                        switch destination {
                                        case .Login:
                                            LogInView()
                                        case .MainView:
                                            BottomNavBarView()
                                        case .ForgotPassword:
                                            EmptyView()
                                        case .CreateAccount:
                                            SignUpView()
                                        case .PreferedName(let model):
                                            PreferredNameView(dataModel: model)
                                        case .YearGroupSelection(let model):
                                            YearGroupSelectionView(dataModel: model)
                                        case .SubjectsSelection(let model):
                                            SubjectSelectionView(dataModel: model)
                                        case .OtherSubjectsSelection(let model):
                                            OtherSubjectsView(dataModel: model)
                                        case .GoalSelection(let model):
                                            GoalSelectionView(dataModel:model)
                                        case .DailyHours(let model):
                                            DailyHoursView(dataModel: model)
                                        case .SummaryView(let model):
                                            SummaryView(dataModel: model)
                                        case .StopWatch:
                                            StopWatchView()
                                        case .ChooseTimer:
                                            ChooseTimerView()
                                        case .timerView(selectHour: let selectHour, selectMinute: let selectMinute):
                                            TimerView(hours: selectHour, minutes: selectMinute)
                                        case .editProfile(let model):
                                            EditProfile(dataModel: model)
                                        case .editYearGoal(let model):
                                            EditYearGroupSelectionView(dataModel: model)
                                        case .EditSubjectsSelection(let dataModel):
                                            EditSubjectSelectionView(dataModel: dataModel)
                                        case .EditOtherSubjectsSelection(let dataModel):
                                            EditOtherSubjectsView(dataModel: dataModel)
                                        case .EditGoalSelection(let model):
                                            EditGoalSelectionView(dataModel: model)
                                        case .EditDailyHours(let model):
                                            EditDailyHoursView(dataModel: model)
                                        }
                                        
                                    }
            }
                .environmentObject(router)
            
        }
    }
}
