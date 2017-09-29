//
//  AddActivitieViewController.swift
//  SemNome
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

class AddActivitieViewController: UIViewController, UITextFieldDelegate, MKMapViewDelegate {
  
    var activitiesDelegate: ActivitiesDelegate? = nil
    
  
  
  // Outlets e variáveis
  @IBOutlet weak var nomeEvento: UITextField!
  
  @IBOutlet weak var descricaoEvento: UITextField!
  
  @IBOutlet weak var popview: PopView!
  
  @IBOutlet weak var quandoAcabaLabel: UILabel!
  
  @IBOutlet weak var quandoAcabaDataPicker: UIDatePicker!
  
    @IBOutlet weak var mapaLocalizacao: MKMapView!
  
  
  // View Did Load ()
  override func viewDidLoad() {
    super.viewDidLoad()
    nomeEvento.delegate = self
    descricaoEvento.delegate = self
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

  // Actions
  
  @IBAction func escolhaDaTag(_ sender: UIButton) {
    popview.isHidden = false
  }
  
  //POPUP
  @IBAction func celebrar(_ sender: UIButton) {
    
  }
  @IBAction func contemplar(_ sender: UIButton) {
  }
  @IBAction func colaborar(_ sender: UIButton) {
  }
  @IBAction func praticar(_ sender: UIButton) {
  }
  
  
  
  // ENVIAR - append nova atividade no array
  @IBAction func enviarEventoProBancoDeDados(_ sender: UIButton) {
    
    let novoEvento = CulturalActivities()
    
    novoEvento.activitieName = nomeEvento.text!
    novoEvento.shortComment = descricaoEvento.text!
    novoEvento.tag = celebrarTag // precisa de uma lógica pra pegar a tag escolhida
    // novoEvento.endsAt = quandoAcabaDataPicker.????
    // novoEvento.location = ???? (pegar loc. do usuário)

    // o init que vai ser usado: (activitiesName: String, location: CLLocationCoordinate2D, endsAt: String, tag: Tag, shortComment: String)
    
    // bancoDeDados.append(novoEvento)
    
  }
  
  
  
  
  
}
