//
//  ViewController.swift
//  geolocation-test
//
//  Created by Todd Fields on 2016-03-13.
//  Copyright © 2016 Skullgate Studios. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {

    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!

    var coordinates: GetCoords!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchButtonClicked(sender: AnyObject) {
       
        if searchText.text != "" {
            
            cityLabel.text = searchText.text
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(searchText.text!, completionHandler: {(placemarks, error)->Void in
                
                if let placemark = placemarks![0] as? CLPlacemark {
                    
                    self.latitudeLabel.text = "Latitude : \(placemark.location!.coordinate.latitude)"
                    self.longitudeLabel.text = "Longitude : \(placemark.location!.coordinate.longitude)"
                    self.searchText.text = ""
                }
            })
        }
    }
}

