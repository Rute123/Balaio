//
//  ActivitieInfoViewController.swift
//  SemNome
//
//  Created by Camila Simões Marques Wanderley on 9/25/17.
//  Copyright © 2017 Camila Simões Marques Wanderley. All rights reserved.
//

import UIKit

class ActivitieInfoViewController: UIViewController {
  
  //Outlets
  
  @IBOutlet weak var img: UIImageView!
  @IBOutlet weak var dadosEvento: UIStackView!
  @IBOutlet weak var descriEvento: UITableView!
  
  //ACTIONS
  
  @IBAction func likes(_ sender: Any) {
    
  }
  
  
  // Criar func para uma stackview: que guarde nome e horário de termino
  // Table view com descrição do evento

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
    // StackView de Dados do Evento
    
    func dadosEventoStackview (_ nomeEvento:String , horarioTermino: Int) -> Any {
      return dadosEvento
    }
    
    // TableView de Descrição do Evento
    
    func descricaoTableview (_ descricao:String) -> Any {
      return descriEvento
    }
    
    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }
    
    // Mostra a barra de navegação - volta pra primeira tela
    override func viewWillAppear(_ animated: Bool) {
      self.navigationController?.isNavigationBarHidden = false
    }
  
}

/*   Criar func para comentarios;
 
 @IBOutlet weak var comentarios: UILabel!
 @IBOutlet weak var AddComentarios: UITextField!
 
 @IBOutlet weak var scrollComentarios: UIScrollView!
 @IBOutlet weak var viewCaixacomentario: UIView!
 @IBOutlet weak var comentarioLabel: UILabel!
 
 // TextField de COmentarios
 
 func comentariosTexfield(_ textField : UITextField) -> Any {
 AddComentarios.delegate = self
 return AddComentarios
 }
 // Comentarios em view com scrollview
 
 var comentariosEvento: [String] = []
 let comentario = "Um evento massa, venham todos"
 self.comentarioLabel.text = comentario
 
 
 //Retorna o teclado ao clicar em Return Obs:Não está dando certo
 
 func textFieldShouldReturn(_ textField : UITextField) -> Bool {
 textField.resignFirstResponder()
 return true
 }
 */


