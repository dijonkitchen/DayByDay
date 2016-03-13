//: Playground - noun: a place where people can play

import UIKit
if let requestURL: NSURL = NSURL(string: "https://www.hl7.org/fhir/patient-example.json")! {
    print("test1")
    if let dataFromJSON = NSData(contentsOfURL: requestURL) {
        print("test2")
        let json = JSON(data: dataFromJSON)
        print(json);
        if let name = json["name"]["given"][0].string {
            print("Using Swifty handling, the output is: \(name)")
        }
    }
}

