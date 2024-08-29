//
//  CalendarView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import SwiftUI

struct CalendarView: View {
    
    @State private var currentDay: Date = .init()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            TimeLineView()
                .padding(15)
        }
        .safeAreaInset(edge: .top, spacing: 0){
            HeaderView()
        }
    }
    
    @ViewBuilder
    func TimeLineView()-> some View{
        VStack{
            let hours = Calendar.current.hours
            ForEach(hours, id: \.self){hour in
                TimeLineViewRow(hour)
            }
        }
    }
    
    @ViewBuilder
    func TimeLineViewRow(_ hour: Date)-> some View{
        HStack(alignment: .top){
            Text(hour.toString("h a"))
                .mitrFont(.subheadline, weight: .regular)
        }
        .hAlign(.leading)
        .padding(.vertical, 15)
    }
    
    @ViewBuilder
    func HeaderView()-> some View{
        VStack{
            HStack{
                VStack(alignment: .leading, spacing: 6) {
                    Text("Today")
                        .mitrFont(.largeTitle, weight: .regular)
                    
                }
                .hAlign(.leading)
                
                Button{
                    
                } label: {
                    HStack(spacing: 10){
                        Image(systemName: "plus")
                        Text("Add Task")
                            .mitrFont(.headline, weight: .regular)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background {
                        Capsule()
                            .fill(Color(.efficioblue))
                    }
                    .foregroundColor(.white)
                }
            }
            
            Text(Date().toString("MMM YYYY"))
                .mitrFont(.headline, weight: .regular)
                .hAlign(.leading)
                .padding(.bottom, 2)
            
            WeekRow()
        }
        .padding(15)
        .background {
            ZStack(alignment: .bottom){
                Color.white
            }
            .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    func WeekRow()->some View{
        HStack(spacing: 0){
            ForEach(Calendar.current.currentWeek){weekDay in
                let status = Calendar.current.isDate(weekDay.date, inSameDayAs: currentDay)
                VStack(spacing: 6){
                    Text(weekDay.string.prefix(3))
                        .mitrFont(.caption, weight: .regular)
                    Text(weekDay.date.toString("dd"))
                        .mitrFont(.subheadline, weight: status ? .medium :.regular)
                }
                .foregroundColor(status ? Color(.efficioblue) : .gray)
                .hAlign(.center)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.3)){
                        currentDay = weekDay.date
                    }
                }
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, -15)
    }
}

#Preview {
    CalendarView()
}

extension View {
    func hAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }

    func vAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
}


//extension for the date
extension Date{
    func toString(_ format: String)->String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

//etension for the calendar
extension Calendar{
    //24 hours
    var hours: [Date]{
        let startofDay = self.startOfDay(for: Date())
        var hours: [Date] = []
        for index in 0..<24{
            if let date = self.date(byAdding: .hour, value: index, to: startOfDay){
                hours.append(date)
            }
        }
        return hours
    }
    
    
    //Current Week
    var currentWeek: [WeekDay]{
        guard let firstWeekDay = self.dateInterval(of: .weekOfMonth, for: Date())?.start
            else{return []}
        var week: [WeekDay] = []
        for index in 0..<7{
            if let day = self.date(byAdding: .day, value: index, to: firstWeekDay){
                let weekDaySymbol: String = day.toString("EEEE")
                let isToday = self.isDateInToday(day)
                week.append(.init(string: weekDaySymbol, date: day, isToday: isToday))
            }
        }
        
        return week
    }
    
    struct WeekDay: Identifiable{
        var id: UUID = .init()
        var string: String
        var date: Date
        var isToday: Bool = false
    }
    
}
