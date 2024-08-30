//
//  CalendarView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import SwiftUI

struct CalendarView: View {
    
    @State private var currentDay: Date = .init()
    @State private var events: [Event] = sampleEvents
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
        ScrollViewReader { proxy in
            let hours = Calendar.current.hours
            let midHour = hours[hours.count / 2]
            VStack{
                ForEach(hours, id: \.self){hour in
                    TimeLineViewRow(hour)
                        .id(hour)
                }
            }
            .onAppear {
                proxy.scrollTo(midHour)
            }
        }
    }
    
    @ViewBuilder
    func TimeLineViewRow(_ date: Date)-> some View{
        HStack(alignment: .top){
            Text(date.toString("h a"))
                .mitrFont(.subheadline, weight: .regular)
                .frame(width: 45, alignment: .leading)
            
            //filtering events based on hour and veifying whether the date is the same as the selected week day
            let calendar = Calendar.current
            let filteredEvents = events.filter{
                if let hour = calendar.dateComponents([.hour], from: date).hour,
                   let eventHour = calendar.dateComponents([.hour], from: date).hour,
                   hour == eventHour && calendar.isDate($0.dateAdded, inSameDayAs: date){
                    return true
                }
                return false
            }
            
            if filteredEvents.isEmpty{
                Rectangle()
                    .stroke(.gray.opacity(0.5), style: StrokeStyle(lineWidth: 0.5, lineCap:
                            .butt, lineJoin: .bevel, dash: [5], dashPhase: 5))
                    .frame(height: 0.5)
                    .offset(y: 10)
            } else{
                VStack{
                    
                }
            }
        }
        .hAlign(.leading)
        .padding(.vertical, 15)
    }
    
    @ViewBuilder
    func EventRow(_ events: Event)->some View{
        VStack(alignment: .leading, spacing: 8){
            Text(events.eventName.uppercased())
                .mitrFont(.subheadline, weight: .light)
                .foregroundColor(events.eventCategory.color)
        }
        
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
            VStack(spacing: 0) {
                Color.white
                
                Rectangle()
                    .fill(.linearGradient(colors: [
                        .white,
                        .clear
                    ], startPoint: .top, endPoint: .bottom))
                    .frame(height: 20)
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
extension Calendar {
    // 24 hours
    var hours: [Date] {
        let startOfDay = self.startOfDay(for: Date())
        var hours: [Date] = []
        for index in 0..<24 {
            if let date = self.date(byAdding: .hour, value: index, to: startOfDay) {
                hours.append(date)
            }
        }
        return hours
    }

    // Current Week
    var currentWeek: [WeekDay] {
        guard let firstWeekDay = self.dateInterval(of: .weekOfMonth, for: Date())?.start else { return [] }
        var week: [WeekDay] = []
        for index in 0..<7 {
            if let day = self.date(byAdding: .day, value: index, to: firstWeekDay) {
                let weekDaySymbol: String = day.toString("EEEE")
                let isToday = self.isDateInToday(day)
                week.append(.init(string: weekDaySymbol, date: day, isToday: isToday))
            }
        }
        return week
    }

    struct WeekDay: Identifiable {
        var id: UUID = .init()
        var string: String
        var date: Date
        var isToday: Bool = false
    }
}
