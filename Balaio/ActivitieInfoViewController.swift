//
//  ActivitieInfoViewController.swift
//  SemNome
//
//  Created by Camila Simões Marques Wanderley on 9/25/17.
//  Copyright © 2017 Camila Simões Marques Wanderley. All rights reserved.
//

import UIKit
import MapKit

class ActivitieInfoViewController: UIViewController, UITableViewDataSource, ActivitiesDelegate, UITableViewDelegate, MKMapViewDelegate {
  
  var listOfActivities: [CulturalActivities] = []
  
  //Outlets
  
  @IBOutlet weak var mapkitActivitiesInfo: MKMapView!
  @IBOutlet weak var detalheEventoTableview: UITableView!
  
  
  //ACTIONS
  
  @IBAction func likes(_ sender: Any) {
    // ???.likes += 1
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.detalheEventoTableview.delegate = self as UITableViewDelegate
  }
  
  //MARK: protocolo UITableViewDelegate
  internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = detalheEventoTableview.dequeueReusableCell(withIdentifier: "tableViewCellID") as! ActivitiesTableviewCell
    
    cell.nameActivities.text = bancoDeDados[indexPath.row].activitieName
    cell.hourActivities.text = bancoDeDados[indexPath.row].endsAt
    //cell.tagImageActivities.image = bancoDeDados[indexPath.row].tagIconColor
    
    cell.descriptionActivities.text = bancoDeDados[indexPath.row].commentLabel
    
    cell.textActivities.text = bancoDeDados[indexPath.row].shortComment
    
    //cell.img.layer.cornerRadius = 30
    //cell.img.layer.masksToBounds = true
    
    return cell
  }
  
  // Mostra a barra de navegação - volta pra primeira tela
  override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.isNavigationBarHidden = false
  }
  //MARK: protocolo UITableViewDataSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return listOfActivities.count
  }
  
  //MARK: protocolo ActivitiesDelegate
  func addActivities(Activities activities : CulturalActivities) {
    self.listOfActivities.append(activities)
    self.detalheEventoTableview.reloadData()
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
