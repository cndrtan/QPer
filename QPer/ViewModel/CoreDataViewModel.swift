//
//  CoreDataViewModel.swift
//  QPer
//
//  Created by Candra Winardi on 27/09/22.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [PasswordListEntity] = []
    
    init(){
        container = NSPersistentContainer(name: "PasswordListContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            }
        }
        fetchPasswordLists()
    }
    
    func fetchPasswordLists(){
        let request = NSFetchRequest<PasswordListEntity>(entityName: "PasswordListEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
        
    }
    
    func addPasswordList(title: String, userName: String, password: String){
        let newPasswordList = PasswordListEntity(context: container.viewContext)
        newPasswordList.title = title
        newPasswordList.userName = userName
        newPasswordList.password = password
        newPasswordList.dtmUpd = Date()
        newPasswordList.id = UUID()
        saveData()
    }
    
    func deletePasswordList(indexSet: IndexSet){
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func updatePasswordList(entity: PasswordListEntity){
        let currentTitle = entity.title ?? ""
        let newTitle = currentTitle + "!"
        entity.title = newTitle
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchPasswordLists()
        } catch let error {
            print("Error saving. \(error)")
        }
    }
    
}
