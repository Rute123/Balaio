//
//  FirstViewController.swift
//  SemNome
//
//  Created by Camila Simões Marques Wanderley on 9/25/17.
//  Copyright © 2017 Camila Simões Marques Wanderley. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class FirstViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CLLocationManagerDelegate  {

  
  // Outlets
  @IBOutlet weak var selectIcons: UICollectionView!
  
  @IBOutlet weak var mapFirst: MKMapView!
  
  // vai receber os nomes dos aquivos png (ou svg) das tags
  let icones: [String] = ["red", "darkBlue", "orange", "darkGreen"]
  
  // constante pra usar na abertura do mapa
  var locationManager = CLLocationManager()

  
  // View Did Load ()
  override func viewDidLoad() {
    super.viewDidLoad()
    
    selectIcons.delegate = self
    selectIcons.dataSource = self

    // Pede pra saber a localização do usuário no foreground e background
    locationManager.requestAlwaysAuthorization()
    
    if CLLocationManager.locationServicesEnabled() {
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.startUpdatingLocation()
    }
    
    // Cria os pins de acordo com o bancoDeDados (local)
    for geoplace in bancoDeDados {
      let activitiePin = MKPointAnnotation()
      activitiePin.title = geoplace.activitieName
      activitiePin.coordinate = CLLocationCoordinate2D(latitude: geoplace.location.latitude, longitude: geoplace.location.longitude)
      mapFirst.addAnnotation(activitiePin)
    }
    
  }
  
  
  
  // Dá o zoom na localização do usuário
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let locationNow = locations[0]
    
    let zoom: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
    
    let userLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(locationNow.coordinate.latitude, locationNow.coordinate.longitude)
    
    let mapVisualArea: MKCoordinateRegion = MKCoordinateRegionMake(userLocation, zoom)
    
    mapFirst.setRegion(mapVisualArea, animated: true)

    self.mapFirst.showsUserLocation = true
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
    cell.iconImageFilter.image = UIImage(named: icones[indexPath.row])
    return cell
  }
  
  
  
 }

