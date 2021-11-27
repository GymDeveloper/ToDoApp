//
//  TaskViewController.swift
//  ToDoApp2
//
//  Created by Linder Hassinger on 13/11/21.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let tasKViewModel = TaskViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        setUpData()
       
    }
    
    func setUpTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setUpData() {
        // Esto es arreglo de tareas
        tasKViewModel.getData()
        
        tasKViewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension TaskViewController:  UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Count \(tasKViewModel.tasks.count)")
        return tasKViewModel.tasks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let object = tasKViewModel.tasks[indexPath.row]
        
        cell.textLabel?.text = object.title
        cell.detailTextLabel?.text = object.date
        cell.imageView?.image = UIImage(named: object.image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = tasKViewModel.tasks[indexPath.row]

        // Es una alerta en iOS
        let alert = UIAlertController(title: object.title, message: object.detail, preferredStyle: .alert)

        let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)

        let actionCancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)

        alert.addAction(actionOk)
        alert.addAction(actionCancel)

        present(alert, animated: true, completion: nil)
    }
}
