//
//  ActivitieInfoViewController.swift
//  SemNome
//
//  Created by Camila Simões Marques Wanderley on 9/25/17.
//  Copyright © 2017 Camila Simões Marques Wanderley. All rights reserved.
//

import UIKit

class ActivitieInfoViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var img: UIImageView!
  @IBOutlet weak var dadosEvento: UIStackView!
  @IBOutlet weak var descriEvento: UITableView!
  @IBOutlet weak var comentarios: UILabel!
  @IBOutlet weak var AddComentarios: UITextField!
  
  //var listEventos: [eventos] = []
  
  // Criar func para uma stackview: que guarde nome e horário de termino
  // Table view com descrição do evento
  // Criar func para comentarios;
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      // Protocolo StackView de Dados do Evento
      func dadosEventoStackview (_ nomeEvento:String , horarioTermino: Int , descricao:String) -> Any {
        return dadosEvento
      }
      // Protocolo TableView de Descrição do Evento
      func descricaoTableview (_ descricao:String) -> Any {
        return descriEvento
      }
      
      // TextField de COmentarios
      AddComentarios.delegate = self
      func comentariosTexfield(_ textField : UITextField) -> Any {
        return comentarios
    }

    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
      
      // Mostra a barra de navegação - volta pra primeira tela
    func viewWillAppear(_ animated: Bool) {
      self.navigationController?.isNavigationBarHidden = false
    }
  }
}
