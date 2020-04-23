//
//  ViewController.swift
//  HBE Horarios IOS
//
//  Created by Carlos Miranda on 21/03/20.
//  Copyright © 2020 Carlos Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfID: UITextField!
    @IBOutlet weak var tfPass: UITextField!
    
    var arrSocios = [Socios]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var socio = Socios(id: 1, idSocio: "123456789", password: "hola")
        arrSocios.append(socio)
        
        socio = Socios(id: 2, idSocio: "55555555", password: "cosa")
        arrSocios.append(socio)
        socio = Socios(id: 3,idSocio: "1111111", password: "hola")
        arrSocios.append(socio)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let idSos = tfID.text
        let pass = tfPass.text
        var id : Int = 0
        for Socios in arrSocios{
            if Socios.idSocio == idSos{
                id = Socios.id
            }
        }
        if idSos != "" && pass != ""{
            if id != 0 && arrSocios[id-1].password == pass{
                let destinationViewController = segue.destination as? HorarioViewController

            } else {
                let alerta = UIAlertController(title: "Error", message: "datos invalidos", preferredStyle: .alert)
                alerta.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                
                present(alerta, animated: true, completion: nil)

            }
            
        }else {
            let alerta = UIAlertController(title: "Error", message: "Debes llenar todos los campos", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            
            present(alerta, animated: true, completion: nil)
        }
    }
    

}

