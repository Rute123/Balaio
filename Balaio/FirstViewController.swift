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
  
  
  // contém os nomes das imagens das tags
  var selectedTags: [String] = ["celebrarTag", "contemplarTag", "colaborarTag", "praticarTag"]
  var deselectedTags: [String] = ["celebrarTagPb", "contemplarTagPb", "colaborarTagPb", "praticarTagPb"]
  
  // vai receber os nomes das imagens das tags
  var filtroDosPins: [String] = []
  
  // constante pra usar na abertura do mapa
  var locationManager = CLLocationManager()
  
  // variável representando o primeiro carregamento da tela
  var viewFirstLoad: Bool = true

  
  // View Did Load ()
  override func viewDidLoad() {
    super.viewDidLoad()
    
    selectIcons.delegate = self
    selectIcons.dataSource = self
    mapFirst.delegate = self
    
    // Pede pra saber a localização do usuário no foreground e background
    locationManager.requestAlwaysAuthorization()
    
    if CLLocationManager.locationServicesEnabled() {
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.startUpdatingLocation()
    }
    
    // Map User Interaction
    mapFirst.isZoomEnabled = true
    mapFirst.isScrollEnabled = false
    mapFirst.isPitchEnabled = false // perspective
    
    // o app abre com todas as tags ativadas
    filtroDosPins = selectedTags
    
    refreshPins()
    
  }
  
  
  // é chamada toda vez que a localização do usuário muda
  // influenciada por varições na leitura do GPS
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
    // trava a posição do usuário no centro
    mapFirst.userTrackingMode = .follow
    
    // Dá o zoom na localização do usuário
    // só roda o zoom quando a tela é iniciada
    if viewFirstLoad == true {
      let locationNow = locations[0]
      let zoom: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
      let userLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(locationNow.coordinate.latitude, locationNow.coordinate.longitude)

      let mapVisualArea: MKCoordinateRegion = MKCoordinateRegionMake(userLocation, zoom)
      
      mapFirst.setRegion(mapVisualArea, animated: true)
      self.mapFirst.showsUserLocation = true
      
      viewFirstLoad = false
    }
    
  }
  
  
  // Actions
  @IBAction func addActivitieButton(_ sender: Any) {
    // envia pra a tela AddActivitiesViewControler
  }
  
  
  @IBAction func reloadButton(_ sender: Any) {
    removePins()
    refreshPins()
  }
  
  
  // Esconde a barra de navegação - primeira tela
  override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.isNavigationBarHidden = true
  }
  
  
  // COLLECTION VIEW (tags)
  
  // Define o número de cells no collection view (ícones)
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return selectedTags.count
  }
  
  // Duplica as cells do collection View pra mostrar os ícones
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "iconCell", for: indexPath) as! SelectIconsCollectionViewCell
    cell.iconImageFilter.image = UIImage(named: filtroDosPins[indexPath.row])
    return cell
  }
  
  // Troca as imagens das tags (coloridas // preto e branco)
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  
    if filtroDosPins[indexPath.row] == selectedTags[indexPath.row] {
      // Se tag selecionada {desseleciona}
      filtroDosPins.remove(at: indexPath.row)
      filtroDosPins.insert(deselectedTags[indexPath.row], at: indexPath.row)
      selectIcons.reloadData()
      removePins()
      refreshPins()
      print ("deselecionou")
      
    } else {
      // Se tag desselecionada {seleciona}
      filtroDosPins.remove(at: indexPath.row)
      filtroDosPins.insert(selectedTags[indexPath.row], at: indexPath.row)
      selectIcons.reloadData()
      removePins()
      refreshPins()
      print ("selecionou")
    }
  }
  
  
  
  // função pra fazer uma nova busca nos pins
  func refreshPins() {
    
    // Cria os pins de acordo com o bancoDeDados (local)
    for atividade in bancoDeDados {
      
      // fltra os pins pelas tags ativadas
      if filtroDosPins.contains(atividade.activitieTag.tagIconColorName) {
      
        let actPin = ActivityPin(activity: atividade)
        actPin.title = atividade.activitieName
        actPin.coordinate = CLLocationCoordinate2D(latitude: atividade.location.latitude, longitude: atividade.location.longitude)
      
        mapFirst.addAnnotation(actPin)
      }
    }
  }
  
  
  // função pra evitar sobescrever os pins no botão reload e pra eliminar eventos acabados
  func removePins() {
    if let pins = self.mapFirst?.annotations {
      for everyPin in pins {
          mapFirst.removeAnnotation(everyPin)
      }
    }
  }
  
  
  
  
  
  // Função que chama a tela de informação quando um pin é tocado
  func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    let viewController = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "openActivitieInfoPage") as! ActivitieInfoViewController
    
    viewController.selectedPin = view.annotation as! ActivityPin
    self.navigationController?.pushViewController(viewController, animated:true)
  }
  
  
  // função pra colocar as imagens das tags nos pins (Castilho)
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    
//    // User Pin
//    if annotation is MKUserLocation {
//      let userPin = mapView.view(for: annotation) as! MKPinAnnotationView!
//      userPin?.image = UIImage(named: "userPin")!
//      return userPin
//    }
    
    // Activities Pins
    if let annotation = annotation as? ActivityPin {
      let pinView = MKAnnotationView(annotation: annotation,reuseIdentifier: "AN_PIN_" + annotation.title!)
      pinView.image = annotation.activity.activitieTag.tagPin
      pinView.canShowCallout = false

      return pinView
    }
    return nil
  }

}






// pra depois comparar a hora de termino com a hora do telefone e retirar o evento do banco de dados
//       let componentesDaHoraAtual: DateComponents = Calendar.current.dateComponents([.hour,.minute], from: Date())
//       let totalMinutos = horaQueAcaba! * 60 + minutoQueAcaba! // pra comparar!

