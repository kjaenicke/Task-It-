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
    
    var baseArray:[[TaskModel]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let date1 = Date.from(year: 2014, month: 05, day: 20)
        let date2 = Date.from(year: 2014, month: 03, day: 3)
        let date3 = Date.from(year: 2014, month: 12, day: 13)
        
        let task1 = TaskModel(task: "Study French", subtask: "Verbs", date: date1, completed: false)
        let task2 = TaskModel(task: "Eat Dinner", subtask: "Burgers", date: date2, completed: false)
        let task3 = TaskModel(task: "Gym", subtask: "Leg Day", date: date3, completed: false)
        let taskArray = [task1, task2, task3]
        
        var completedArrary = [TaskModel(task: "Code", subtask: "Task Project", date: date2, completed: true)]
        
        baseArray = [taskArray, completedArrary]
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        baseArray[0] = baseArray[0].sorted {
            (taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
            // comparison logic here
            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
        }
        
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailVC:TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = baseArray[indexPath!.section][indexPath!.row]
            detailVC.mainVC = self
            detailVC.detailTaskModel = thisTask
        }
        else if segue.identifier == "showTaskAdd" {
            let addTaskVC:AddTaskViewController = segue.destinationViewController as AddTaskViewController
            addTaskVC.mainVC = self
        }
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("showTaskAdd", sender: self)
    }
    
    
    
    //UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return baseArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseArray[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let thisTask = baseArray[indexPath.section][indexPath.row]
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subtask
        cell.dateLabel.text = Date.toString(date:thisTask.date)
        return cell
    }
    
    //UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 25
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "To Do"
        }
        else {
            return "Completed"
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let thisTask = baseArray[indexPath.section][indexPath.row]
        
        if indexPath.section == 0 {
            var newTask = TaskModel(task: thisTask.task, subtask: thisTask.subtask, date: thisTask.date, completed: true)
            baseArray[1].append(newTask)
        }
        else {
            var newTask = TaskModel(task: thisTask.task, subtask: thisTask.subtask, date: thisTask.date, completed: false)
            baseArray[0].append(newTask)
        }
        
        baseArray[indexPath.section].removeAtIndex(indexPath.row)
        tableView.reloadData()
    }
    
    
}
