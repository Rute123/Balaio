//
//  ActivitieInfoViewController.swift
//  Balaio
//
//  Created by Camila Simões Marques Wanderley on 9/25/17.
//  Copyright © 2017 Camila Simões Marques Wanderley. All rights reserved.
//

import UIKit
import MapKit

class ActivitieInfoViewController: UIViewController, UITableViewDelegate, MKMapViewDelegate, CLLocationManagerDelegate, UITableViewDataSource {
  
  // var listaDeAtividades: [CulturalActivities] = bancoDeDados
  
  var locationNow: CLLocation?
  
  var screenLoadFirst: Bool = true
  
  var locationManagerAdd = CLLocationManager()
  
  var selectedPin = ActivityPin(activity: CulturalActivities())
    
  
  // constante pra usar na abertura do mapa
  
  
  //Outlets
  
  @IBOutlet weak var detalheEventoTableview: UITableView!
  @IBOutlet weak var mapkitActivitiesInfo: MKMapView!
  @IBOutlet weak var imageMapkit: UIImageView!
  

  //ACTIONS
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.detalheEventoTableview.delegate = self
    self.detalheEventoTableview.dataSource = self
    
    // Da zoom na localização do usuário
    
    if CLLocationManager.locationServicesEnabled() {
      locationManagerAdd.delegate = self
      locationManagerAdd.desiredAccuracy = kCLLocationAccuracyBest
      locationManagerAdd.startUpdatingLocation()
    }
  
    mapkitActivitiesInfo.delegate = self
    // desabilita perspectiva
    mapkitActivitiesInfo.isPitchEnabled = false
    
    
  }
  
  
    // MAPkit Location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      locationNow = locations[0]
      
      if screenLoadFirst == true {
        
        // Cria o pin do evento no mapa
       
        mapkitActivitiesInfo.addAnnotation(selectedPin)
        
        
        // da zoom no pin da atividade quando a tela é carregada
        let zoom: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let userLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(selectedPin.coordinate.latitude, selectedPin.coordinate.longitude)
        let mapVisualArea: MKCoordinateRegion = MKCoordinateRegionMake(userLocation, zoom)
        
        mapkitActivitiesInfo.setRegion(mapVisualArea, animated: true)
        self.mapkitActivitiesInfo.showsUserLocation = true
        
        screenLoadFirst = false
  
      }
      
  }
  
   //MARK: protocolo UITableViewDelegate
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID") as! ActivitiesTableviewCell
    
    cell.nameActivities.text = selectedPin.activity.activitieName
    // cell.nameActivities.textColor = selectedPin.activity.activitieTag.tagColor
    cell.hourActivities.text = selectedPin.activity.endsAt
    cell.tagImageActivities.image = selectedPin.activity.activitieTag.tagIconColor
    // cell.descriptionActivities.text = selectedPin.activity.commentLabel
    cell.textActivities.text = selectedPin.activity.shortComment
    
    return cell
  }
  //MARK: protocolo UITableViewDataSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  // Mostra a barra de navegação - volta pra primeira tela
  override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.isNavigationBarHidden = false
  }
  
  
  // função pra colocar as imagens nos pins (Castilho) - precisa nessa tela?
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    
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






  
/*

// Pra descomentar: command /
//
// // Descrição do Evento
// 
// func descricaoTableview (_ descricao:String) -> Any {
// return descriEvento
// }
// 
//
//
// }
// 
//  Criar func para comentarios (fora do MVP)
// 
// @IBOutlet weak var comentarios: UILabel!
// @IBOutlet weak var AddComentarios: UITextField!
// 
// @IBOutlet weak var scrollComentarios: UIScrollView!
// @IBOutlet weak var viewCaixacomentario: UIView!
// @IBOutlet weak var comentarioLabel: UILabel!
// 
// // TextField de Comentarios
// 
// func comentariosTexfield(_ textField : UITextField) -> Any {
//   AddComentarios.delegate = self
//   return AddComentarios
// }
// // Comentarios em view com scrollview
// 
// var comentariosEvento: [String] = []
// let comentario = "Um evento massa, venham todos"
// self.comentarioLabel.text = comentario
// 
// 
// //Retorna o teclado ao clicar em Return (Depois do MVP a gente testa)
// // Precisa colocar o UITextFieldDelegate na declaração da classe e depois dizer que o text field que você vai digitar (o dos comentários) é quem vai cuidar disso (comentariosTextField.delegate = self)
// 
// func textFieldShouldReturn(_ textField : UITextField) -> Bool {
// textField.resignFirstResponder()
// return true
// }
*/
