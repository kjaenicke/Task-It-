//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by Keenan Jaenicke on 1/13/15.
//  Copyright (c) 2015 Keenan Jaenicke. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    var mainVC: MainViewController!
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addTaskButtonTapped(sender: UIButton) {
        var task = TaskModel(task: taskTextField.text, subtask: subtaskTextField.text, date: dueDatePicker.date, completed: false)
        mainVC.baseArray[0].append(task)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
