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
