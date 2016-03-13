//
//  CareTeamTableViewController.swift
//  MyCareTeam
//
//  Created by Govin Vatsan on 3/12/16.
//  Copyright © 2016 Govin Vatsan. All rights reserved.
//

import UIKit

class CareTeamTableViewController: UITableViewController {
    
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
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return practitionerName.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CareTeamMember", forIndexPath: indexPath) as! CareTeamMemberCell
    
        cell.teamMemberName.text! = practitionerName[indexPath.row]
        print(cell.teamMemberName.text)
        cell.teamMemberEncounter.text = practitionerSpeciality[indexPath.row]
        cell.teamMemberPhoto.image = practitionerImages[indexPath.row]
        cell.teamMemberPhoto.contentMode = UIViewContentMode.ScaleAspectFill

        return cell
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

public class PractitionerInfo {

    func getPractitionerName() -> [String] {
        var practitionerName = [String]()
        if let requestURL: NSURL = NSURL(string: "http://fhirtest.uhn.ca/baseDstu2/Practitioner?_count=10")! {
            if let dataFromJSON = NSData(contentsOfURL: requestURL) {
                let json = JSON(data: dataFromJSON)
                
                for var i = 0; i < json["entry"].count; i++ {
                    var fullName = ""
                    var firstName = json["entry"][i]["resource"]["name"]["given"][0].string!
                    firstName = firstName.lowercaseString
                    firstName.replaceRange(firstName.startIndex...firstName.startIndex, with: String(firstName[firstName.startIndex]).capitalizedString)
                    
                    var lastName = json["entry"][i]["resource"]["name"]["family"][0].string!
                    lastName = lastName.lowercaseString
                    lastName.replaceRange(lastName.startIndex...lastName.startIndex, with: String(lastName[lastName.startIndex]).capitalizedString)
                    
                    if var prefix = json["entry"][i]["resource"]["name"]["prefix"][0].string {
                        
                        prefix = prefix.lowercaseString
                        prefix.replaceRange(prefix.startIndex...prefix.startIndex, with: String(prefix[prefix.startIndex]).capitalizedString)
                        
                        fullName = prefix + ". " + firstName + " " + lastName;
                    }
                    else {
                        fullName = firstName + " " + lastName;
                    }
                    practitionerName.append(fullName)
                }
            }
        }
        return practitionerName
    }
    
    func getPractitionerSpecialty() -> [String]{
        var practitionerSpeciality = [String]()

        if let requestURL: NSURL = NSURL(string: "http://fhirtest.uhn.ca/baseDstu2/Practitioner?_count=10")! {
            if let dataFromJSON = NSData(contentsOfURL: requestURL) {
                let json = JSON(data: dataFromJSON)
                
                for var i = 0; i < json["entry"].count; i++ {
                    if var specialty1 = json["entry"][i]["resource"]["practitionerRole"][0]["specialty"][0]["coding"][0]["display"].string {
                        specialty1.replaceRange(specialty1.startIndex...specialty1.startIndex, with: String(specialty1[specialty1.startIndex]).capitalizedString)
                        
                        practitionerSpeciality.append(specialty1)
                    }
                    else if var specialty2 = json["entry"][i]["resource"]["practitionerRole"][0]["role"]["coding"][0]["display"].string {
                        specialty2.replaceRange(specialty2.startIndex...specialty2.startIndex, with: String(specialty2[specialty2.startIndex]).capitalizedString)
                        
                        practitionerSpeciality.append(specialty2)
                    }
                    else if var specialty3 = json["entry"][i]["resource"]["practitionerRole"][0]["role"]["coding"][0]["code"].string {
                        specialty3.replaceRange(specialty3.startIndex...specialty3.startIndex, with: String(specialty3[specialty3.startIndex]).capitalizedString)
                        
                        practitionerSpeciality.append(specialty3)
                    }
                    else {
                        practitionerSpeciality.append("")
                    }
                }
            }
        }
        return practitionerSpeciality
    }
    
    func getPractitionerImages() -> [UIImage] {
        var practitionerImages = [UIImage]()

        let imageNames = ["bmf9001", "cabush", "cblong", "dproye", "edwaldman", "faculty_flomen", "jkfrancis", "ksoren", "lfimundo", "mrm9006"]
        
        for var i = 0; i < imageNames.count; i++ {
            practitionerImages.append(UIImage(named: imageNames[i])!)
        }
        
        return practitionerImages
    }
}



