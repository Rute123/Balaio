//
//  ActivitieInfoViewController.swift
//  Balaio
//
//  Created by Camila Simões Marques Wanderley on 9/25/17.
//  Copyright © 2017 Camila Simões Marques Wanderley. All rights reserved.
//

import UIKit
import MapKit

class ActivitieInfoViewController: UIViewController, ActivitiesDelegate, UITableViewDelegate, MKMapViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
  
  var listaDeAtividades: [CulturalActivities] = bancoDeDados
  
  // constante pra usar na abertura do mapa
  var locationManager = CLLocationManager()
  
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
    
    mapkitActivitiesInfo.isUserInteractionEnabled = false
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
  // MAPkit Location
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
      let locationNow = locations[0]
      
      let zoom: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
      
      let userLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(locationNow.coordinate.latitude, locationNow.coordinate.longitude)
      
      let mapVisualArea: MKCoordinateRegion = MKCoordinateRegionMake(userLocation, zoom)
      
      mapkitActivitiesInfo.setRegion(mapVisualArea, animated: true)
      
      self.mapkitActivitiesInfo.showsUserLocation = true
  }

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
