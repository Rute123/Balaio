//
//  ViewController.swift
//  SemNome
//
//  Created by Camila Simões Marques Wanderley on 9/25/17.
//  Copyright © 2017 Camila Simões Marques Wanderley. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController  {

  // Outlets
  
  @IBOutlet weak var selectIcons: UICollectionView!
  
  
  @IBOutlet weak var mapFirst: MKMapView!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  
  
  // Actions
  @IBAction func addActivitieButton(_ sender: Any) {
  }
  
  
  @IBAction func reloadButton(_ sender: Any) {
  }
  
  
 }

