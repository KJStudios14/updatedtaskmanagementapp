//
//  Extensions.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else{
            return[:]
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
func convertSetToString(_ set: Set<String>) -> String {
       return set.joined(separator: ",")
   }
func convertArrayToString(_ array: [String]) -> String {
       return array.joined(separator: ",")
   }
extension Date{
    func DateToString() -> String {
        return customFormatter.string(from: self)
    }
    var customFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd" // Example: "Wednesday, Oct 2, 2024 - 5:23 PM"
        return formatter
    }
}
extension String{
    func StringToDate() -> Date {
        let date = customFormatter.date(from: self)
        return date ?? Date()
    }
    var customFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd" // Example: "Wednesday, Oct 2, 2024 - 5:23 PM"
        return formatter
    }
}
extension Int{
    var hoursAndMinutes: String {
        
            let hours = Int(self) / 3600
            let minutes = (Int(self) % 3600) / 60

            return String(format: "%02dHrs %02dm", hours, minutes)
        
        
       }
}
