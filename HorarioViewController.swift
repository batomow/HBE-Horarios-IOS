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

class CustomCell: UITableViewCell {
    @IBOutlet weak var lbtitulo: UILabel!
    @IBOutlet weak var buton: UIButton!
}

class HorarioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableDia: UITableView!
    @IBOutlet weak var tableHorario: UITableView!
    @IBOutlet weak var tableEntrada: UITableView!
    @IBOutlet weak var tableComidaSalida: UITableView!
    @IBOutlet weak var tableComidaEntrada: UITableView!
    @IBOutlet weak var tableSalida: UITableView!
    var monolito: Monolito!
    
    var testData: [ResumeData] = [
        ResumeData(dia: "Dia", horario: "Horario", entrada: "Entrada", salida_comida: "Salida Comida", entrada_comida: "Entrada Comida", salida: "Salida"),
        ResumeData(dia: "Lunes", horario: "--", entrada: "--", salida_comida: "--", entrada_comida: "--", salida: "--"),
        ResumeData(dia: "Martes", horario: "--", entrada: "--", salida_comida: "--", entrada_comida: "--", salida: "--"),
        ResumeData(dia: "Miercoles", horario: "--", entrada: "--", salida_comida: "--", entrada_comida: "--", salida: "--"),
        ResumeData(dia: "Jueves", horario: "--", entrada: "--", salida_comida: "--", entrada_comida: "--", salida: "--"),
        ResumeData(dia: "Viernes", horario: "--", entrada: "--", salida_comida: "--", entrada_comida: "--", salida: "--"),
        ResumeData(dia: "Sabado", horario: "--", entrada: "--", salida_comida: "--", entrada_comida: "--", salida: "--"),
        ResumeData(dia: "Domingo", horario: "--", entrada: "--", salida_comida: "--", entrada_comida: "--", salida: "--")]
    
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
        
        let currentdias = monolito.current
        for (index, data) in testData.enumerated(){
            if index == 0 {
                continue
            }
            data.entrada = currentdias[index-1].entry
            data.salida = currentdias[index-1].exit
            data.horario = currentdias[index-1].schedule
            data.salida_comida = currentdias[index-1].breakLeave
            data.entrada_comida = currentdias[index-1].breakReturn
        }
        
    }
    
    
    @IBAction func tapMEntrada(_ sender: UIButton) {
        let cell = sender.superview?.superview as! UITableViewCell
        let indexPath = self.tableEntrada.indexPath(for: cell)
    }
    
    @IBAction func tapMSalida(_ sender: UIButton) {
        let cell = sender.superview?.superview as! UITableViewCell
        let indexPath = self.tableEntrada.indexPath(for: cell)
    }
    
    // MARK: - Table View Stuff
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.isEqual(tableEntrada){
            let cell = tableView.dequeueReusableCell(withIdentifier: "idCustomCell", for: indexPath) as! CustomCell
            cell.lbtitulo.text = testData[indexPath.row].entrada
            if indexPath.row == 1 || indexPath.row == 4 {
                cell.buton.isHidden = false
            }
            else {
                cell.buton.isHidden = true
            }
            return cell
        }
        else if tableView.isEqual(tableSalida){
            let cell = tableView.dequeueReusableCell(withIdentifier: "idCustomCell", for: indexPath) as! CustomCell
            cell.lbtitulo.text = testData[indexPath.row].salida
            if indexPath.row == 3 || indexPath.row == 6 {
                cell.buton.isHidden = false
            }
            else {
                cell.buton.isHidden = true
            }
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
            if tableView.isEqual(tableDia) {
                cell.textLabel?.text = testData[indexPath.row].dia
            }else if tableView.isEqual(tableHorario) {
                cell.textLabel?.text = testData[indexPath.row].horario
            }else if tableView.isEqual(tableComidaSalida){
                cell.textLabel?.text = testData[indexPath.row].salida_comida
            }else { // entrada comida
                cell.textLabel?.text = testData[indexPath.row].entrada_comida
            }
            return cell
        }
    }
    
    
    
    
    // MARK: - Orientation

    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.landscapeRight, andRotateTo: UIInterfaceOrientation.landscapeRight)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application,l you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "entrada" {
            let viewEnt = segue.destination as! PopupMarcaje
            viewEnt.entrada = true
        }
        else if segue.identifier == "salida"{
            let viewSal = segue.destination as! PopupMarcaje
            viewSal.entrada = false
        }
    }
}
