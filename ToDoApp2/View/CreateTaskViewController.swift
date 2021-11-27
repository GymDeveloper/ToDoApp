//
//  CreateTaskViewController.swift
//  ToDoApp2
//
//  Created by Linder Hassinger on 13/11/21.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var btnCreate: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        datePicker.preferredDatePickerStyle = .wheels
        btnCreate.layer.cornerRadius = 8
        btnCreate.layer.masksToBounds = true
    }

    @IBAction func onClickCreateTask(_ sender: Any) {
        // CAPTURAR EL TEXT Y LA FECHA
        let title = txtTitle.text
        let description = txtDescription.text
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        let date = dateFormatter.string(from: datePicker.date)
        print(date)
        print(title!)
        print(description!)
    }
    
}
