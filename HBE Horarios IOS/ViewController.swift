//
//  ViewController.swift
//  HBE Horarios IOS
//
//  HEB Horarios fue desarrollado como proyecto final de la materia Proeycto de Desarrollo
//  para dispositivos móviles en el semestre Febrero Junio 2020.
//  Desarrolladores:
    //  Carlos Andrés Miranda Eguia A00817390 carlosa_miranda@outlook.com
    //  Gabriel Ortega Jacobo A01176807 a01176807@itesm.mx
    //  Paulina Cámara Vidales A01039839 a01039839@itesm.mx
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfID: UITextField!
    @IBOutlet weak var tfPass: UITextField!
    var retrievedData: Monolito!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Orientation
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    @IBAction func login(_ sender: Any) {
        let user = tfID.text!
        let password = tfPass.text! // aqui  v  no importa la fecha
        let body = APIRequestBody(user: user, password: password, fecha: "whatever")
        let request = APIRequest(endpoint: "login")
        request.send(body, completion: {response in
            switch response {
            case .success(let res):
                DispatchQueue.main.async {self.onLogged(res: res)}
            default:
                print("step 1")
                print(response)
            }
        })
    }
 
    func onLogged(res: APIResponse){
        if res.error == true {
            let alerta = UIAlertController(title: "Server", message: res.message, preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            present(alerta, animated: true, completion: nil)
        }else{
            let user = tfID.text! //aqui   v   no importa el password
            let body = APIRequestBody(user: user, password: "whatever", fecha: "8-6-2020")
            let request = APIRequest(endpoint: "calendar/all")
            request.bigsend(body, completion: { response in
                switch response {
                case .success(let res):
                    DispatchQueue.main.async {self.onRetrieveData(res: res)}
                default:
                    print("step 2")
                    print(response) // si algo sale mal namas imprime el error
                }
            })
        }
    }
    
    func onRetrieveData(res: APIResponseMonolito){
        if res.error == false{
            let alerta = UIAlertController(title: "Server", message: res.message, preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
                self.retrievedData = res.data
                self.performSegue(withIdentifier: "logged", sender: nil)
            }))
            present(alerta, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let horarioVC = segue.destination as! HorarioViewController
        horarioVC.monolito = retrievedData
    }
    

}

