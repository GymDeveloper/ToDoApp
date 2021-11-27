//
//  TaskViewModel.swift
//  ToDoApp2
//
//  Created by Linder Hassinger on 27/11/21.
//

import Foundation

class TaskViewModel {
    
    let url = "https://61a25060014e1900176de8e1.mockapi.io/api/v1/Task"
    
    var refreshData = {
        () -> () in
    }
    
    var tasks: [Task] = [] {
        didSet {
            refreshData()
        }
    }
    
    func getData() {
        guard let URL = URL(string: url) else {
            print("url invalid")
            return
        }
        
        // hago la logica para poder extraer la informacion y poder guardarla en task
        URLSession.shared.dataTask(with: URL) { (data, response, error) in
            if error != nil {
                print("Error \(String(describing: error?.localizedDescription))")
                return
            }
            
            guard let dataJSON = data else {
                print("Data invalid")
                return
            }
            
            // data. tengo que hacer un decode de la data
            let decoder = JSONDecoder()
            
            do {
                self.tasks = try decoder.decode([Task].self, from: dataJSON)
            } catch let error as NSError {
                print("Error \(error.localizedDescription)") 
            }
        }.resume()
    }
}


