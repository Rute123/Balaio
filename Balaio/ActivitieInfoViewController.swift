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

  @IBOutlet weak var detalheEventoTableview: UITableView!
  
      var listOfActivities: [CulturalActivities] = []
  
  //ACTIONS
  
  @IBAction func likes(_ sender: Any) {
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  //MARK: protocolo UITableViewDelegate
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID") as! ActivitiesTableviewCell
    
    cell.nameActivities.text = listOfActivities[indexPath.row].activitieName
    cell.hourActivities.text = listOfActivities[indexPath.row].endsAt
    //cell.tagImageActivities.image = listOfActivities[indexPath.row].tagIconColor
    
    cell.descriptionActivities.text = listOfActivities[indexPath.row].commentLabel
    
    cell.textActivities.text = listOfActivities[indexPath.row].shortComment
    
    //cell.img.layer.cornerRadius = 30
    //cell.img.layer.masksToBounds = true
    
    return cell
  }
}

    /*
    // Descrição do Evento
    
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
 */*/
