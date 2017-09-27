//
//  FirstViewController.swift
//  SemNome
//
//  Created by Camila Simões Marques Wanderley on 9/25/17.
//  Copyright © 2017 Camila Simões Marques Wanderley. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {

  // Outlets
  
  @IBOutlet weak var selectIcons: UICollectionView!
  
  @IBOutlet weak var mapFirst: MKMapView!
  
  let icones: [String] = ["red", "lightBlue", "yellow", "lightGreen"]
  
  
  // View Did Load ()
  override func viewDidLoad() {
    super.viewDidLoad()
    
    selectIcons.delegate = self
    selectIcons.dataSource = self
    
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
  
  
  // Define o número de cells no collection view (ícones)
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  // Esconde a barra de navegação - primeira tela
  override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.isNavigationBarHidden = true
  }
  
  // Duplica as cells do collection View pra mostrar os ícones
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "iconCell", for: indexPath) as! SelectIconsCollectionViewCell
    print(indexPath)
    cell.iconImageFilter.image = UIImage(named: icones[indexPath.row])
    return cell
  }
  
  
 }

