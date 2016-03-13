//
//  HomeTableViewTableViewController.swift
//  CareApp
//
//  Created by Martin L on 3/12/16.
//  Copyright © 2016 Martin L. All rights reserved.
//

import UIKit

class HomePageTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 2 {
            return 300
        }
        else {
            return tableView.rowHeight
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var practitionerName = [String]()
        var practitionerSpeciality = [String]()
        var practitionerImages = [UIImage]()
        
        var practitionerInfo = PractitionerInfo()
        
        practitionerName = practitionerInfo.getPractitionerName()   //gets practitioner information per patient
        practitionerSpeciality = practitionerInfo.getPractitionerSpecialty()
        practitionerImages = practitionerInfo.getPractitionerImages()
        
        
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("scheduleCell", forIndexPath: indexPath) as! HomePageScheduleTableViewCell
            
            cell.scheduleLabel.text = ""
            var events = [String]()
            events.append("8:00 AM: Blood Draw")
            events.append("10:00 AM: Head CT")
            events.append("12:00 PM: Lunch")
            events.append("4:00 PM: Child Life Event")
            events.append("6:30 PM: Movie Night")
            
            cell.scheduleLabel.text = events[0]
            cell.schedule2.text = events[1]
            cell.schedule3.text = events[2]
            cell.schedule4.text = events[3]
            cell.schedule5.text = events[4]
            
            
            
            
            //            if let path = NSBundle.mainBundle().pathForResource("countries", ofType: "json"),
            //                let dataFromJSON = NSData(contentsOfFile: path) {
            //                    let json = JSON(data: dataFromJSON)
            //                    print(json)
            //
            //                    for var i = 0; i < json["entries"].count; i++ {
            //                        events.append(json["entries"][i].string!)
            //                    }
            //            }
            
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("CareTeamMemberPrimary", forIndexPath: indexPath) as! CareTeamMemberCell
            //2 - doc, 8 - nurse, 3 - tech
            
            if indexPath.row == 0 { // doctor
                cell.teamMemberName.text! = practitionerName[2]
                cell.teamMemberEncounter.text = practitionerSpeciality[2]
                cell.teamMemberPhoto.image = practitionerImages[2]
                cell.teamMemberPhoto.contentMode = UIViewContentMode.ScaleAspectFill
                
            }
            else if indexPath.row == 1 { // nurse
                
                cell.teamMemberName.text! = practitionerName[8]
                cell.teamMemberEncounter.text = practitionerSpeciality[8]
                cell.teamMemberPhoto.image = practitionerImages[8]
                cell.teamMemberPhoto.contentMode = UIViewContentMode.ScaleAspectFill
                
            }
            
            return cell
        }
        
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
