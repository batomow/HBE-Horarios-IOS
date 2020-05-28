//
//  PopupMarcaje.swift
//  HBE Horarios IOS
//
//  Created by Paulina Camara on 5/13/20.
//  Copyright © 2020 Carlos Miranda. All rights reserved.
// Clase de Popup de Marcajes

import UIKit

class PopupMarcaje: UIViewController {

    @IBOutlet weak var lbTitulo: UILabel!
    @IBOutlet weak var popup: UIView!
    
    var tipo : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbTitulo.numberOfLines = 2
        if tipo == "ent" {
            lbTitulo.text = "Entrada Tardia"
        }
        else if tipo == "sal" {
            lbTitulo.text = "Salida Temprana"
        }
        else if tipo == "falta" {
            lbTitulo.text = "Falta Injustificada"
        }
        popup.layer.cornerRadius = 10
        popup.layer.masksToBounds = true
    }
        // MARK: - Boton close popup
       @IBAction func closePopup(_ sender: RoundButton) {
           dismiss(animated: true, completion: nil)
       }
       
    
       // MARK: - Orientation
           override func viewWillAppear(_ animated: Bool) {
               AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.landscapeRight, andRotateTo: UIInterfaceOrientation.landscapeRight)
           }

}
