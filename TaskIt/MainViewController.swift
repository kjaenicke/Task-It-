//
//  MainViewController.swift
//  TaskIt
//
//  Created by Keenan Jaenicke on 1/11/15.
//  Copyright (c) 2015 Keenan Jaenicke. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var taskArray:[TaskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let task1 = TaskModel(task: "Study French", subtask: "Verbs", date: "01/14/2014")
        let task2 = TaskModel(task: "Eat Dinner", subtask: "Burgers", date: "01/14/2014")
        let task3 = TaskModel(task: "Gym", subtask: "Leg Day", date: "01/14/2014")
        taskArray = [task1, task2, task3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let thisTask = taskArray[indexPath.row]
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subtask
        cell.dateLabel.text = thisTask.date
        return cell
    }
    
    //UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
    }
}
