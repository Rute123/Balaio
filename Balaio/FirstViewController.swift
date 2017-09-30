//
//  FirstViewController.swift
//  Balaio
//
//  Created by Camila Simões Marques Wanderley on 9/25/17.
//  Copyright © 2017 Camila Simões Marques Wanderley. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Foundation


class FirstViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CLLocationManagerDelegate, MKMapViewDelegate  {
  
  
  // Outlets
  @IBOutlet weak var selectIcons: UICollectionView!
  
  @IBOutlet weak var mapFirst: MKMapView!
  
  @IBOutlet weak var mapRadiusFilter: UIImageView!
  
  
  // vai receber os nomes dos aquivos png (ou svg) das tags
  let icones: [String] = ["red", "darkBlue", "orange", "darkGreen"]
  
  // constante pra usar na abertura do mapa
  var locationManager = CLLocationManager()
  
  // variável representando o primeiro carregamento quando o app é aberto
  var appFirstLoad: Bool = true
  
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
    
    mapFirst.isZoomEnabled = true
    mapFirst.isScrollEnabled = false
    mapFirst.isPitchEnabled = false // perspective
    
    refreshPins()
    
  }
  
  
  // Dá o zoom na localização do usuário
  // agora tem um if que só roda o zoom quando o app é iniciado
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
    if appFirstLoad == true {
      let locationNow = locations[0]
      
      let zoom: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
      
      let userLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(locationNow.coordinate.latitude, locationNow.coordinate.longitude)
      
      let mapVisualArea: MKCoordinateRegion = MKCoordinateRegionMake(userLocation, zoom)
      
      mapFirst.setRegion(mapVisualArea, animated: true)
      
      self.mapFirst.showsUserLocation = true
      
      appFirstLoad = false
    }
    
  }
  
  
  // Actions
  @IBAction func addActivitieButton(_ sender: Any) {
  }
  
  @IBAction func reloadButton(_ sender: Any) {
    refreshPins()
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
  
  // função pra fazer uma nova busca nos pins
  func refreshPins() {
    // Cria os pins de acordo com o bancoDeDados (local)
    
    for activitie in bancoDeDados {
      let activitiePin = ActivityPin(activity: activitie)
      activitiePin.title = activitie.activitieName
      activitiePin.coordinate = CLLocationCoordinate2D(latitude: activitie.location.latitude, longitude: activitie.location.longitude)
      mapFirst.addAnnotation(activitiePin)
      
      // pra depois comparar a hora de termino com a hora do telefone e retirar o evento do banco de dados
      //       let componentesDaHoraAtual: DateComponents = Calendar.current.dateComponents([.hour,.minute], from: Date())
      //       let totalMinutos = horaQueAcaba! * 60 + minutoQueAcaba! // pra comparar!
    }
  }
  
  func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    
  }
  
  
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    if let annotation = annotation as? ActivityPin {
      let pinView = MKAnnotationView(
        annotation: annotation,
        reuseIdentifier: "AN_PIN_" + annotation.title!
      )
      pinView.image = annotation.activity.activitieTag.tagIconColor
      return pinView
    }
    return nil
  }

}

//public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//  var annotationView: MKAnnotationView!
//
//  if annotation is MKUserLocation{
//    annotationView = nil
//  }
//  else {
//    
//    if let annotation = annotation as? LugarAnnotation {
//      let identifier = "viewLugar"
//      // Reuse the annotation if possible
//      annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//        as? MKPinAnnotationView
//      if annotationView == nil
//      {
//        let detailButton: UIButton = UIButton(type: UIButtonType.detailDisclosure)
//        let pinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//        pinAnnotationView.canShowCallout = true
//        pinAnnotationView.animatesDrop = true
//        pinAnnotationView.pinTintColor = UIColor.blue
//        pinAnnotationView.rightCalloutAccessoryView = detailButton
//        
//        annotationView = pinAnnotationView
//      }
//      
//    } else  {
//      let identifier = "viewGenerica"
//      // Reuse the annotation if possible
//      annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//      
//      if annotationView == nil
//      {
//        annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//        
//        annotationView!.image = UIImage(named: "pino.png")
//        annotationView!.canShowCallout = true
//      }
//    }
//    
//    annotationView!.annotation = annotation
//  }
//  return  annotationView
//  
//}




//let id = "viewLocation"
//let pinView = mapView.dequeueReusableAnnotationView(withIdentifier: id) as? MKPinAnnotationView
//if pinView == nil {
//  pinView!.image = UIImage(named: "red") // pinView!.activitieTag.tagIconColor(named: IndexPath[row])
//}
//return pinView
