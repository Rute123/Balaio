//
//  AddActivitieViewController.swift
//  SemNome
//
//  Created by Camila Simões Marques Wanderley on 9/25/17.
//  Copyright © 2017 Camila Simões Marques Wanderley. All rights reserved.
//

import UIKit

class AddActivitieViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      print("oi aqui")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var nomeEvento: UITextField!

    @IBOutlet weak var descricao: UITextField!
    
    @IBAction func tag(_ sender: UIButton) {
    }
    
    @IBOutlet weak var dataPicker: UIDatePicker!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
