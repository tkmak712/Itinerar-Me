//
//  LocationViewController.swift
//  Itinerar-Me
//
//  Created by Timothy Mak on 4/17/17.
//  Copyright © 2017 ItinerarMe. All rights reserved.
//

import UIKit
import GooglePlaces

class LocationViewController: UIViewController  {
    
    
    @IBOutlet weak var textField: UITextField!
    var pickedLocation: GMSPlace?
    
    var locationPicked = false
    
    //Instance of autocomplete view controller for the class.
    let autoCompleteCtllr = GMSAutocompleteViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //textField.fram
        textField.textColor = UIColor.lightGray
        autoCompleteCtllr.delegate = self
        
    }
   
    @IBAction func userTouchedTxtField(_ sender: AnyObject) {
        
        self.present(autoCompleteCtllr, animated: true) { 
            if let pickedLocation = self.pickedLocation {
                self.textField.textColor = UIColor.darkGray
                self.textField.text = pickedLocation.name
            }
        }
    }
}

extension LocationViewController: GMSAutocompleteViewControllerDelegate {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        print("Place name: \(place.name)")
        self.pickedLocation = place
        locationPicked = true
        textField.text = place.name
        
        dismiss(animated: true, completion: nil)
    }
    
    //If error occured in autocomplete
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

}

