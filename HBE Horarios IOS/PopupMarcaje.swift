//
//  PopupMarcaje.swift
//  HBE Horarios IOS
//
//  Created by user162505 on 5/13/20.
//  Copyright © 2020 Carlos Miranda. All rights reserved.
//

import UIKit

class PopupMarcaje: UIViewController {

    @IBOutlet weak var lbTitulo: UILabel!
    @IBOutlet weak var popup: UIView!
    
    var entrada : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if entrada {
            lbTitulo.text = "Entrada Tardia"
        }
        else {
            lbTitulo.text = "Salida Temprana"
        }
        popup.layer.cornerRadius = 10
        popup.layer.masksToBounds = true
    }
           
       @IBAction func closePopup(_ sender: RoundButton) {
           dismiss(animated: true, completion: nil)
       }
       
    
           
       // MARK: - Orientation

           override func viewWillAppear(_ animated: Bool) {
               AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.landscapeRight, andRotateTo: UIInterfaceOrientation.landscapeRight)
           }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
