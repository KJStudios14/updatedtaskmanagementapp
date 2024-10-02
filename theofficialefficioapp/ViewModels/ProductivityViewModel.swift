//
//  ProductivityViewModel.swift
//  theofficialefficioapp
//
//  Created by Monang Champaneri on 02/10/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProductivityViewModel: ObservableObject {
    
    @Published var dataModel:[ProductivityModel] = []
 
    
    init() {
        fatchData()
    }
    
    func addTask(date:String = Date().DateToString(),focusTime:Int = 0,isCompletedTask:Bool = false,isAddTask:Bool = false,sessionCount:Int = 0) {
   
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newId = Date().DateToString()
        var dataModelObj:ProductivityModel?
        
        if var dataObj = getTodayModel(){
            
            if isAddTask{
                dataObj.remaingTasks =  dataObj.remaingTasks + 1
            }
            
            if isCompletedTask{
                dataObj.completedTasks =  dataObj.completedTasks + 1
            }
            dataObj.sessionCount = dataObj.sessionCount + sessionCount
            dataObj.focusTime = dataObj.focusTime + focusTime
            
            
            dataModelObj = dataObj
        }else{
            dataModelObj = ProductivityModel(date: date,focusTime: focusTime, completedTasks: 0,remaingTasks: isAddTask ? 1 : 0,sessionCount: sessionCount)
        }
        
        
        // Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("productivity")
            .document(newId)
            .setData(dataModelObj.asDictionary()) { error in
                if let error = error {
                    print("Error writing document: \(error)")
                } else {
                    print("Document successfully written!")
                }
            }
    }
    
    func fatchData() {
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
            db.collection("users")
            .document(uId)
            .collection("productivity").getDocuments() { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                               print("No documents found.")
                               return
                           }
                           
                           // Map the documents to the User model
                self.dataModel = documents.compactMap { doc in
                       try? doc.data(as: ProductivityModel.self)
                   }
            }
    }
    func getTodayModel() -> ProductivityModel? {
        if dataModel.isEmpty {
            return nil
        }
        return dataModel.first { $0.date == Date().DateToString() }
    }
    
}

        
    
