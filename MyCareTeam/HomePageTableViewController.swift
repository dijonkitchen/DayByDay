//
//  HomeTableViewTableViewController.swift
//  CareApp
//
//  Created by Martin L on 3/12/16.
//  Copyright © 2016 Martin L. All rights reserved.
//

import UIKit

class HomePageTableViewController: UITableViewController {
    
    var practitionerName = [String]()
    var practitionerSpeciality = [String]()
    var practitionerImages = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var practitionerInfo = PractitionerInfo()
        
        practitionerName = practitionerInfo.getPractitionerName()   //gets practitioner information per patient
        practitionerSpeciality = practitionerInfo.getPractitionerSpecialty()
        practitionerImages = practitionerInfo.getPractitionerImages()
        
        
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
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 2 {
            return 350
        }
        else {
            return 100
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "My Primary Physician"
        case 1:
            return "My Nurse"
        case 2:
            return "What's Happening Today?"
        default: return ""
            
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("scheduleCell", forIndexPath: indexPath) as! HomePageScheduleTableViewCell
            
//            if let path = NSBundle.mainBundle().pathForResource("events", ofType: "json"),
//                let dataFromJSON = NSData(contentsOfFile: path) {
//                    let json = JSON(data: dataFromJSON)
//        
//            }
            
            
            var events = [String]()
            events.append("8:00 AM: Head CT - Neuroradiology")
            events.append("2:00 PM: Echocardiogram - Ultrasound Room")
            events.append("4:00 PM: Clown Care Rounds - Room 2T")
            events.append("6:30 PM: Arts & Crafts - Room 3T")

            
            print ("CELL HEIGHT IS: \(cell.frame.height)")

            
            cell.schedule1.text = events[0]
            cell.schedule2.text = events[1]
            cell.schedule3.text = events[2]
            cell.schedule4.text = events[3]
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("CareTeamMemberPrimary", forIndexPath: indexPath) as! CareTeamMemberCell
            //2 - doc, 8 - nurse, 3 - tech
            
            if indexPath.section == 0 { // doctor
                cell.teamMemberName.text! = practitionerName[2]
                cell.teamMemberEncounter.text = practitionerSpeciality[2]
                cell.teamMemberPhoto.image = practitionerImages[2]
                cell.teamMemberPhoto.contentMode = UIViewContentMode.ScaleAspectFill
                
            }
            else if indexPath.section == 1 { // nurse
                
                cell.teamMemberName.text! = practitionerName[8]
                cell.teamMemberEncounter.text = practitionerSpeciality[8]
                cell.teamMemberPhoto.image = practitionerImages[8]
                cell.teamMemberPhoto.contentMode = UIViewContentMode.ScaleAspectFill
                
            }
            
            return cell
        }
        
    }
    
    @IBAction func signOut(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("signOutSegue", sender: nil)
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
