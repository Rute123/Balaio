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
  
  var listaDeAtividades: [CulturalActivities] = bancoDeDados
  
  var locationNow: CLLocation?
  
  var screenLoadFirst: Bool = true
  
  var locationManagerAdd = CLLocationManager()
  
  // constante pra usar na abertura do mapa
  
  
  //Outlets
  
  @IBOutlet weak var detalheEventoTableview: UITableView!
  @IBOutlet weak var mapkitActivitiesInfo: MKMapView!
  @IBOutlet weak var imageMapkit: UIImageView!
  
  
  //ACTIONS
  
  @IBAction func likes(_ sender: UIButton) {
    
    // ???.likes += 1
  }
  
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
  }
    // MAPkit Location
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      locationNow = locations[0]
      
      if screenLoadFirst == true {
        
        // Cria o pin do evento no mapa
        let newPin = MKPointAnnotation()
        newPin.coordinate = CLLocationCoordinate2D(latitude: locationNow!.coordinate.latitude, longitude: locationNow!.coordinate.longitude)
        mapkitActivitiesInfo.addAnnotation(newPin)
        
        let zoom: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let userLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(locationNow!.coordinate.latitude, locationNow!.coordinate.longitude)
        let mapVisualArea: MKCoordinateRegion = MKCoordinateRegionMake(userLocation, zoom)
        
        mapkitActivitiesInfo.setRegion(mapVisualArea, animated: true)
        self.mapkitActivitiesInfo.showsUserLocation = true
        
        screenLoadFirst = false
      }
      
  }
  
   //MARK: protocolo UITableViewDelegate
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID") as! ActivitiesTableviewCell
    
    cell.nameActivities.text = listaDeAtividades[indexPath.row].activitieName
    cell.hourActivities.text = listaDeAtividades[indexPath.row].endsAt
    cell.tagImageActivities.image = listaDeAtividades[indexPath.row].activitieTag.tagIconColor
    cell.descriptionActivities.text = listaDeAtividades[indexPath.row].commentLabel
    cell.textActivities.text = listaDeAtividades[indexPath.row].shortComment
    
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
  
  //MARK: protocolo ActivitiesDelegate
  func addActivities(Activities activities : CulturalActivities) {
    self.listaDeAtividades.append(activities)
    self.detalheEventoTableview.reloadData()
  }
}
  
  
/*
 EXEMPLO DE COLOCAR IMAGEM NO PIN - INCOMPLETO
 func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
    
    if control is UIButton{
      var alert = UIAlertController(title:"Bom Restaurante",message:"Bem-vindo", preferredStyle: UIAlertControllerStyle.Alert)
      var action = UIAlertAction(title: "Obrigado", style: UIAlertActionStyle.Cancel, handler: nil)
      
      alert.addAction(action)
      self.presentViewController(alert, animated: true, completion: nil)
    }
  }
  var pin = mapkitActivitiesInfo.dequeueReusableAnnotationViewWithIdentifier("PinFeirinha") as!  MKPinAnnotationView!
  pin.pinColor = .Green //Configuramos aqui a cor do Pin
  pin.animatesDrop = true //E sua animacao
  pin.image = UIImage(named: "red_pin") //Adicionando imagem ao Pin
  pin.centerOffset = CGPointMake(0, -10) //Modificando um pouco o centro em relação ao tamanho da imagem
}


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
/**/*/
