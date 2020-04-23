//
//  HorarioViewController.swift
//  HBE Horarios IOS
//
//  Created by Carlos Miranda on 21/04/20.
//  Copyright © 2020 Carlos Miranda. All rights reserved.
//

import UIKit

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

    @IBOutlet weak var tableDia: UITableView!
    @IBOutlet weak var tableHorario: UITableView!
    @IBOutlet weak var tableEntrada: UITableView!
    @IBOutlet weak var tableComidaSalida: UITableView!
    @IBOutlet weak var tableComidaEntrada: UITableView!
    @IBOutlet weak var tableSalida: UITableView!
    
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
        tableDia.delegate = self
        tableDia.dataSource = self
        
        tableHorario.delegate = self
        tableHorario.dataSource = self
        
        tableEntrada.delegate = self
        tableEntrada.dataSource = self
        
        tableComidaSalida.delegate = self
        tableComidaSalida.dataSource = self
        
        tableComidaEntrada.delegate = self
        tableComidaEntrada.dataSource = self
        
        tableSalida.delegate = self
        tableSalida.dataSource = self
    }
    
    // MARK: - Table View Stuff
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
        if tableView.isEqual(tableDia) {
            cell.textLabel?.text = testData[indexPath.row].dia
        }else if tableView.isEqual(tableHorario) {
            cell.textLabel?.text = testData[indexPath.row].horario
        }else if tableView.isEqual(tableEntrada){
            cell.textLabel?.text = testData[indexPath.row].entrada
        }else if tableView.isEqual(tableComidaSalida){
            cell.textLabel?.text = testData[indexPath.row].salida_comida
        }else if tableView.isEqual(tableComidaEntrada){
            cell.textLabel?.text = testData[indexPath.row].entrada_comida
        }else { // salida
            cell.textLabel?.text = testData[indexPath.row].salida
        }
        return cell
    }
    
    // MARK: - Orientation

    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.landscapeRight, andRotateTo: UIInterfaceOrientation.landscapeRight)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
