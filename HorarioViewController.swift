//
//  HorarioViewController.swift
//  HBE Horarios IOS
//
//  Created by Carlos Miranda on 21/04/20.
//  Copyright © 2020 Carlos Miranda. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell{
    @IBOutlet weak var dia: UILabel!
    @IBOutlet weak var horario: UILabel!
    @IBOutlet weak var entrada: UILabel!
    @IBOutlet weak var salida_comida: UILabel!
    @IBOutlet weak var entrada_comida: UILabel!
    @IBOutlet weak var salida: UILabel!
}
class ResumeData {
    var dia: String
    var horario: String
    var entrada: String
    var salida_comida:String
    var entrada_comida: String
    var salida: String
    init(dia:String, horario:String, entrada:String, salida_comida:String, entrada_comida:String, salida:String) {
        self.dia = dia
        self.horario = horario
        self.entrada = entrada
        self.salida_comida = salida_comida
        self.entrada_comida = entrada_comida
        self.salida = salida
    }
}

class HorarioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var tableView: UITableView!
    var testData: [ResumeData] = [
        ResumeData(dia: "Dia", horario: "Horario", entrada: "Entrada", salida_comida: "Salida Comida", entrada_comida: "Entrada Comida", salida: "Salida"),
        ResumeData(dia: "Lunes", horario: "6:00am - 4:00pm", entrada: "6:12am", salida_comida: "12:40pm", entrada_comida: "2:00pm", salida: "4:10pm"),
        ResumeData(dia: "Martes", horario: "6:00am - 4:00pm", entrada: "6:12am", salida_comida: "12:40pm", entrada_comida: "2:00pm", salida: "4:10pm"),
        ResumeData(dia: "Miercoles", horario: "6:00am - 4:00pm", entrada: "6:12am", salida_comida: "12:40pm", entrada_comida: "2:00pm", salida: "4:10pm"),
        ResumeData(dia: "Jueves", horario: "6:00am - 4:00pm", entrada: "6:12am", salida_comida: "12:40pm", entrada_comida: "2:00pm", salida: "4:10pm"),
        ResumeData(dia: "Viernes", horario: "6:00am - 4:00pm", entrada: "6:12am", salida_comida: "12:40pm", entrada_comida: "2:00pm", salida: "4:10pm"),
        ResumeData(dia: "Sabado", horario: "6:00am - 4:00pm", entrada: "6:12am", salida_comida: "12:40pm", entrada_comida: "2:00pm", salida: "4:10pm"),
        ResumeData(dia: "Domingo", horario: "6:00am - 4:00pm", entrada: "6:12am", salida_comida: "12:40pm", entrada_comida: "2:00pm", salida: "4:10pm")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Table View Stuff
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath) as! CustomTableViewCell
        if indexPath.row != 7 {
            cell.dia.text = testData[indexPath.row].dia
            cell.horario.text = testData[indexPath.row].horario
            cell.entrada.text = testData[indexPath.row].entrada
            cell.salida_comida.text = testData[indexPath.row].salida_comida
            cell.entrada_comida.text = testData[indexPath.row].entrada_comida
            cell.salida.text = testData[indexPath.row].salida
        }else{
            cell.dia.text = testData[indexPath.row].dia
            
            cell.horario.text = ""
            cell.horario.backgroundColor = UIColor.green
            
            cell.entrada.text = ""
            cell.entrada.backgroundColor = UIColor.green
            
            cell.salida_comida.text = ""
            cell.salida_comida.backgroundColor = UIColor.green
            
            cell.entrada_comida.text = ""
            cell.entrada_comida.backgroundColor = UIColor.green
            
            cell.salida.text = ""
            cell.salida.backgroundColor = UIColor.green
        }
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
