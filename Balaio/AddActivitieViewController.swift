//
//  AddActivitieViewController.swift
//  SemNome
//
//  Created by Camila Simões Marques Wanderley on 9/25/17.
//  Copyright © 2017 Camila Simões Marques Wanderley. All rights reserved.
//

import UIKit
import MapKit

class AddActivitieViewController: UIViewController, UITextFieldDelegate, MKMapViewDelegate {

    @IBOutlet weak var popview: PopView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomeEvento.delegate = self
        descricao.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  
  // Mostra a barra de navegação - volta pra primeira tela
  override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.isNavigationBarHidden = false
    popview.isHidden = true
  }


    //Retorna o teclado ao clicar em Return
    func textFieldShouldReturn(_ textField : UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
        
    @IBOutlet weak var nomeEvento: UITextField!
    
    @IBOutlet weak var descricao: UITextField!
    
    @IBAction func tag(_ sender: UIButton) {
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
    
    
    @IBOutlet weak var dataPicker: UIDatePicker!
  
    
  
  
  
    @IBAction func enviar(_ sender: UIButton) {
    }
    
    @IBOutlet weak var mapaLocalizacao: MKMapView!
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
