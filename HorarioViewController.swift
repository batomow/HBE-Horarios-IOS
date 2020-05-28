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
    
    @IBOutlet weak var lbSemAnt: UILabel!
    @IBOutlet weak var btnSemAnt: UIButton!
    @IBOutlet weak var btnSigSem: UIButton!
    @IBOutlet weak var lbSigSem: UILabel!
    @IBOutlet weak var tableDia: UITableView!
    @IBOutlet weak var tableHorario: UITableView!
    @IBOutlet weak var tableEntrada: UITableView!
    @IBOutlet weak var tableComidaSalida: UITableView!
    @IBOutlet weak var tableComidaEntrada: UITableView!
    @IBOutlet weak var tableSalida: UITableView!
    //Variable de tipo monolito
    var monolito: Monolito!
    //contador globar que indicara la semana actual
    var sem: Int!
    
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
        //se marca que la semana inicial sea la 1
        sem = 1
        //se cargan los datos de la semana uno del monolito
        let currentdias = monolito.week1
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
            if entraTarde(index: indexPath.row)  {
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
            if salidaTemprano(index: indexPath.row) {
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
    
    // MARK: - Botones semanas
    //Accion del boton siguiente semana
    @IBAction func sigSemAct(_ sender: UIButton) {
        //Se resta 1 al valor de semana
        sem -= 1
        //DEpendiendo del numero de sem, se mandara a cargar su semana correspondiente
        if (sem == 0){
            carga(currentdias: monolito.week0)
            //Al llegar a la ultima semana(Semana futura), se ocultan los botones de siguiente semana
            btnSigSem.isHidden = true
            lbSigSem.isHidden = true
        } else if (sem == 1){
            carga(currentdias: monolito.week1)
        } else if (sem == 2){
            carga(currentdias: monolito.week2)
        } else if (sem == 3){
            carga(currentdias: monolito.week3)
            //Al llegar a la segunda semana pasada, aparecen los botones de semana anterior
            btnSemAnt.isHidden = false
            lbSemAnt.isHidden = false
        }
        
    }
    
    @IBAction func SemAntAct(_ sender: UIButton) {
        //Se suma 1 al valor de semana
        sem += 1
        //DEpendiendo del numero de sem, se mandara a cargar su semana correspondiente
        if (sem == 1){
            carga(currentdias: monolito.week1)
            //Al llegar a la semana actual, aparecen los botones de siguiente semana
            btnSigSem.isHidden = false
            lbSigSem.isHidden = false
        } else if (sem == 2){
            carga(currentdias: monolito.week2)
        } else if (sem == 3){
            carga(currentdias: monolito.week3)
        } else if (sem == 4){
            carga(currentdias: monolito.week4)
            //Al llegar a la ultima semana, desapareceran los botones de semana anterior
            btnSemAnt.isHidden = true
            lbSemAnt.isHidden = true
        }
    }
    
    
    //Funcion que carga la semana indicada y recarga las tablas para ensenar la info correspondiente
    func carga(currentdias : [Day]){
        for (index, data) in testData.enumerated(){
            if index == 0 {
                continue
            }
            //Se carga la informacion
            data.entrada = currentdias[index-1].entry
            data.salida = currentdias[index-1].exit
            data.horario = currentdias[index-1].schedule
            data.salida_comida = currentdias[index-1].breakLeave
            data.entrada_comida = currentdias[index-1].breakReturn
        }
        //Se recargan las tablas
        tableDia.reloadData()
        tableHorario.reloadData()
        tableEntrada.reloadData()
        tableComidaSalida.reloadData()
        tableComidaEntrada.reloadData()
        tableSalida.reloadData()
    }
    
    // MARK: - Logica Marcajes
    //Funcion que comprueba si el usuario entro despues de su hora marcada de entrada
    func entraTarde(index : Int) -> Bool{
        //Si la entrada tiene datos y el index no es 0, se hacen los calculos
        if (testData[index].entrada != "--" && index != 0){
            //Se parte el string de horario para tener las dos horas de manera separada
            let horario = testData[index].horario.split(separator: "-")
            //Se crea un date formatter para poder convertir de string a date
            let dataFormatter = DateFormatter()
            dataFormatter.dateFormat = "HH':'mm"
            //Se convierte la primera hora del horario al tipo date
            let date1 = dataFormatter.date(from: String(horario[0]))!
            //Se convierte la hora de entrada al tipo date
            let date2 = dataFormatter.date(from: testData[index].entrada)!
            //Si la primera hora de entradar es mayo a la agendada, se regresa false
            if (date1 < date2){
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    //Funcion que comprueba si el usuario salio antes de su hora marcada de salida
    func salidaTemprano(index : Int) -> Bool{
        //Si la salida tiene datos y el index no es 0, se hacen los calculos
        if (testData[index].salida != "--" && index != 0){
            //Se parte el string de horario para tener las dos horas de manera separada
            let horario = testData[index].horario.split(separator: "-")
            //Se crea un date formatter para poder convertir de string a date
            let dataFormatter = DateFormatter()
            dataFormatter.dateFormat = "HH':'mm"
            //Se convierte la segunda hora del horario al tipo date
            let date1 = dataFormatter.date(from: String(horario[1]))!
            //Se convierte la hora de salida al tipo date
            let date2 = dataFormatter.date(from: testData[index].salida)!
            //Si la hora de salida agendada es mayor a la hora de salida del usuario
            if (date1 > date2){
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
}
