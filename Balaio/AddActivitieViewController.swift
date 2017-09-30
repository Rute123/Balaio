//
//  AddActivitieViewController.swift
//  Balaio
//
//  Created by Camila Simões Marques Wanderley on 9/25/17.
//  Copyright © 2017 Camila Simões Marques Wanderley. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation


protocol ActivitiesDelegate {
    func addActivities(Activities activities: CulturalActivities)
}

class AddActivitieViewController: UIViewController, UITextFieldDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
  
    var activitiesDelegate: ActivitiesDelegate? = nil
    
  
  
  // Outlets e variáveis
  @IBOutlet weak var nomeEvento: UITextField!
  
  @IBOutlet weak var descricaoEvento: UITextField!
  
  @IBOutlet weak var popview: PopView!
  
  @IBOutlet weak var escolhaDaTag: UIImageView!
  
  @IBOutlet weak var quandoAcabaLabel: UILabel!
  
  @IBOutlet weak var quandoAcabaDataPicker: UIDatePicker!
  
  @IBOutlet weak var mapaLocalizacao: MKMapView!
  
  // constante pra usar na abertura do mapa
  var locationManagerAdd = CLLocationManager()
  
  var locationNow: CLLocation?
  
  var screenLoadFirst: Bool = true
 
  
  
  // View Did Load ()
  override func viewDidLoad() {
    super.viewDidLoad()
    nomeEvento.delegate = self
    descricaoEvento.delegate = self
    mapaLocalizacao.delegate = self
    
    // Da zoom na localização do usuário
    if CLLocationManager.locationServicesEnabled() {
      locationManagerAdd.delegate = self
      locationManagerAdd.desiredAccuracy = kCLLocationAccuracyBest
      locationManagerAdd.startUpdatingLocation()
    }
  
    // mapaLocalizacao.isUserLocationVisible = false // error isUserLocationVisible is a get only property
    mapaLocalizacao.isPitchEnabled = false // perspectiva
    
  }
  
  
  // Mostra a barra de navegação 
  override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.isNavigationBarHidden = false
    popview.isHidden = true
  }

  
  //Esconde o teclado ao clicar em Return
  func textFieldShouldReturn(_ textField : UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  
  // Dá o zoom na localização do evento (a mesma do usuário, por enquanto)
  // tem um if que só roda o zoom quando a tela é carregado
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    locationNow = locations[0]
    
    if screenLoadFirst == true {
      
      // Cria o pin do evento no mapa
      let newPin = MKPointAnnotation()
      newPin.coordinate = CLLocationCoordinate2D(latitude: locationNow!.coordinate.latitude, longitude: locationNow!.coordinate.longitude)
      mapaLocalizacao.addAnnotation(newPin)
      
      let zoom: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
      let userLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(locationNow!.coordinate.latitude, locationNow!.coordinate.longitude)
      let mapVisualArea: MKCoordinateRegion = MKCoordinateRegionMake(userLocation, zoom)
      
      mapaLocalizacao.setRegion(mapVisualArea, animated: true)
      self.mapaLocalizacao.showsUserLocation = true
      
      screenLoadFirst = false
    }
    
  }


    // Actions
    
    @IBAction func escolhaDaTag(_ sender: UIButton) {
        popview.isHidden = false
    }
    
    //POPUP
    @IBAction func celebrar(_ sender: UIButton) {
        escolhaDaTag.image = UIImage(named: "red")
        popview.isHidden = true
    }
    @IBAction func contemplar(_ sender: UIButton) {
        escolhaDaTag.image = UIImage(named: "darkBlue")
        popview.isHidden = true
    }
    @IBAction func colaborar(_ sender: UIButton) {
        escolhaDaTag.image = UIImage(named: "orange")
        popview.isHidden = true
    }
    @IBAction func praticar(_ sender: UIButton) {
        escolhaDaTag.image = UIImage(named: "darkGreen")
        popview.isHidden = true
    }
    
    
    
    
  }
