//
//  PopupResumenDia.swift
//  HBE Horarios IOS
//
//  Created by Paulina Camara on 5/13/20.
//  Copyright © 2020 Carlos Miranda. All rights reserved.
//  Clase para el Popup del Resumen del Dia

import UIKit

class PopupResumenDia: UIViewController {
    
    @IBOutlet weak var popup: UIView!
    @IBOutlet weak var lbTitulo: UILabel!
    @IBOutlet weak var lbExedente: UILabel!
    @IBOutlet weak var lbNormal: UILabel!
    //cariable de tipo semana
    var sem : Int!
    var dia : Int!
    //Variable de tipo monolito
    var monolito : Monolito!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (dia == 0){
            lbTitulo.text = "Resumen del Dia"
            lbExedente.text = "Tiempo Excedente: "
            lbNormal.text = "Tiempo Normal: "
        } else if (sem == 4){
            let currentDias = monolito.week4
            lbTitulo.text = "Resumen del Dia"
            lbExedente.text = "Tiempo Excedente: " + currentDias[dia-1].overtime
            lbNormal.text = "Tiempo Normal: " + currentDias[dia-1].total
            
        } else if (sem == 3){
            let currentDias = monolito.week3
            lbTitulo.text = "Resumen del Dia"
            lbExedente.text = "Tiempo Excedente: " + currentDias[dia-1].overtime
            lbNormal.text = "Tiempo Normal: " + currentDias[dia-1].total
        } else if (sem == 2){
            let currentDias = monolito.week2
            lbTitulo.text = "Resumen del Dia"
            lbExedente.text = "Tiempo Excedente: " + currentDias[dia-1].overtime
            lbNormal.text = "Tiempo Normal: " + currentDias[dia-1].total
        } else if (sem == 1){
            let currentDias = monolito.week1
            lbTitulo.text = "Resumen del Dia"
            lbExedente.text = "Tiempo Excedente: " + currentDias[dia-1].overtime
            lbNormal.text = "Tiempo Normal: " + currentDias[dia-1].total
        } else if (sem == 0){
            let currentDias = monolito.week0
            lbTitulo.text = "Resumen del Dia"
            lbExedente.text = "Tiempo Excedente: " + currentDias[dia-1].overtime
            lbNormal.text = "Tiempo Normal: " + currentDias[dia-1].total
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
