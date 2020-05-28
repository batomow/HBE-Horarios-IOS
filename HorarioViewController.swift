//
//  HorarioViewController.swift
//  HBE Horarios IOS
//
//  Created by Carlos Miranda on 21/04/20.
//  Copyright © 2020 Carlos Miranda. All rights reserved.
//

import UIKit
// Clase de estructura de datos de la semana
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

// Clase de la celda customeable con label y boton
class CustomCell: UITableViewCell {
    @IBOutlet weak var lbtitulo: UILabel!
    @IBOutlet weak var buton: UIButton!
}
// Clase del ViewController de Horarios
class HorarioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    //Inicializacion de variables de botones
    @IBOutlet weak var lbSemAnt: UILabel!
    @IBOutlet weak var btnSemAnt: UIButton!
    @IBOutlet weak var btnSigSem: UIButton!
    @IBOutlet weak var lbSigSem: UILabel!
    //Inicializacion de etiquetas
    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var lbSemana: UILabel!
    @IBOutlet weak var lbTotalHoras: UILabel!
    @IBOutlet weak var lbTotalEx: UILabel!
    
    //Inicializacion de variables de TableViews
    @IBOutlet weak var tableDia: UITableView!
    @IBOutlet weak var tableHorario: UITableView!
    @IBOutlet weak var tableEntrada: UITableView!
    @IBOutlet weak var tableComidaSalida: UITableView!
    @IBOutlet weak var tableComidaEntrada: UITableView!
    @IBOutlet weak var tableSalida: UITableView!
    
    //Inicializacion de variables de Resumen de la Semana
    
    @IBOutlet weak var lbTotalNormal: UILabel!
    @IBOutlet weak var lbTotalExcedente: UILabel!
    
    //Colores de background
    let colorDescanso = UIColor(red: (187/255.0), green: (187/255.0), blue: (187/255.0), alpha: 0.5)
    let colorFalta = UIColor(red: (238/255.0), green: (87/255.0), blue: (74/255.0), alpha: 0.5)
    
    //Variable de tipo monolito
    var monolito: Monolito!
    //contador globar que indicara la semana actual
    var sem: Int!
    //Inicializacion de arreglo de la varieble tipo ResumeData
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
        
        //Se cargan las etiquetas con la informacion correspondiente
        lbNombre.text = monolito.user.firstName + " " + monolito.user.lastName
        lbSemana.text = "Semana actual"
        lbTotalHoras.text = "Total horas: " + monolito.resume1.total
        lbTotalEx.text = "Total horas excedentes: " + monolito.resume1.overtime
        
        
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
    
    //MARK: - Funciones de Tap de botones
    //Bonton en Tabla Entrada
    @IBAction func tapMEntrada(_ sender: UIButton) {
        let cell = sender.superview?.superview as! UITableViewCell
        let indexPath = self.tableEntrada.indexPath(for: cell)
    }
    //Bonton en Tabla Salida
    @IBAction func tapMSalida(_ sender: UIButton) {
        let cell = sender.superview?.superview as! UITableViewCell
        let indexPath = self.tableSalida.indexPath(for: cell)
    }
    
    //Boton en Tabla Horario
    @IBAction func tapMHorario(_ sender: UIButton) {
        let cell = sender.superview?.superview as! UITableViewCell
        let indexPath = self.tableHorario.indexPath(for: cell)
    }
    
    // MARK: - Table View Stuff
    //Numero de secciones de las TableViews
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //Numero de filas de las TableViews
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testData.count
    }
    
    // Contenido de las celdas de las TableViews
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Tabla de Entrada****
        if tableView.isEqual(tableEntrada){
            let cell = tableView.dequeueReusableCell(withIdentifier: "idCustomCell", for: indexPath) as! CustomCell
            if descanso(index: indexPath.row) {
                cell.backgroundColor = colorDescanso
                cell.lbtitulo.isHidden = true
                cell.buton.isHidden = true
            }
            else if sem == 0 && indexPath.row != 0{
                cell.lbtitulo.isHidden = true
                cell.buton.isHidden = true
                cell.backgroundColor = UIColor.white
            }
            else{
                if testData[indexPath.row].entrada == "--"  && testData[indexPath.row].horario != "--"  {
                    cell.backgroundColor = colorFalta
                    cell.lbtitulo.isHidden = true
                    cell.buton.isHidden = true
                } else {
                    cell.lbtitulo.text = testData[indexPath.row].entrada
                    cell.backgroundColor = UIColor.white
                    cell.lbtitulo.isHidden = false
                    if entraTarde(index: indexPath.row)  {
                        cell.buton.isHidden = false
                    }
                    else {
                        cell.buton.isHidden = true
                    }
                }
            }
            return cell
        }
        //Tabla de Salida****
        else if tableView.isEqual(tableSalida){
            let cell = tableView.dequeueReusableCell(withIdentifier: "idCustomCell", for: indexPath) as! CustomCell
            if descanso(index: indexPath.row) {
                cell.backgroundColor = colorDescanso
                cell.lbtitulo.isHidden = true
                cell.buton.isHidden = true
            }
            else if sem == 0 && indexPath.row != 0 {
                cell.lbtitulo.isHidden = true
                cell.buton.isHidden = true
                cell.backgroundColor = UIColor.white
            }
            else{
                if testData[indexPath.row].salida == "--"  && testData[indexPath.row].horario != "--"  {
                    cell.backgroundColor = colorFalta
                    cell.lbtitulo.isHidden = true
                    cell.buton.isHidden = true
                } else {
                    cell.lbtitulo.text = testData[indexPath.row].salida
                    cell.backgroundColor = UIColor.white
                    cell.lbtitulo.isHidden = false
                    if salidaTemprano(index: indexPath.row) {
                        cell.buton.isHidden = false
                    }
                    else {
                        cell.buton.isHidden = true
                    }
                }
            }
            return cell
        }
        //Tabla de Horario
        else if tableView.isEqual(tableHorario){
            let cell = tableView.dequeueReusableCell(withIdentifier: "idCustomCell", for: indexPath) as! CustomCell
            // revisa si es dia de descanso
            if testData[indexPath.row].horario == "--" {
                cell.backgroundColor = colorDescanso
                cell.lbtitulo.isHidden = true
                cell.buton.isHidden = true
            }
            else {
                cell.lbtitulo.text = testData[indexPath.row].horario
                cell.lbtitulo.isHidden = false
                cell.backgroundColor = UIColor.white
                if falto(index: indexPath.row) {
                    cell.buton.isHidden = false
                }
                else {
                    cell.buton.isHidden = true
                }
            }
            return cell
        }
        //Tablas restantes con idCell
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
            //Tabla de Dias de la Semana
            if tableView.isEqual(tableDia) {
                cell.textLabel?.text = testData[indexPath.row].dia
            }
            //Tabla de Salida de Comida****
            else if tableView.isEqual(tableComidaSalida){
                if descanso(index: indexPath.row) {
                    cell.backgroundColor = colorDescanso
                    cell.textLabel?.isHidden = true
                }
                else if sem == 0 && indexPath.row != 0{
                    cell.textLabel?.isHidden = true
                    cell.backgroundColor = UIColor.white
                }
                else{
                    if testData[indexPath.row].salida_comida == "--"  && testData[indexPath.row].horario != "--" {
                        cell.backgroundColor = colorFalta
                        cell.textLabel?.isHidden = true
                    } else {
                        cell.textLabel?.text = testData[indexPath.row].salida_comida
                        cell.backgroundColor = UIColor.white
                        cell.textLabel?.isHidden = false
                    }
                }
            }
            //Tabla de Entrada de Comida****
            else {
                if descanso(index: indexPath.row) {
                    cell.backgroundColor = colorDescanso
                    cell.textLabel?.isHidden = true
                }
                else if sem == 0 && indexPath.row != 0{
                    cell.textLabel?.isHidden = true
                    cell.backgroundColor = UIColor.white
                }
                else{
                    if testData[indexPath.row].entrada_comida == "--"  && testData[indexPath.row].horario != "--"  {
                        cell.backgroundColor = colorFalta
                        cell.textLabel?.isHidden = true
                    } else {
                        cell.textLabel?.text = testData[indexPath.row].entrada_comida
                        cell.backgroundColor = UIColor.white
                        cell.textLabel?.isHidden = false
                    }
                }
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
            //View para el popup de marcaje de entrada
            let viewEnt = segue.destination as! PopupMarcaje
            viewEnt.tipo = "ent"
        }
            //View para el popup de marcaje de salida
        else if segue.identifier == "salida"{
            let viewSal = segue.destination as! PopupMarcaje
            viewSal.tipo = "sal"
        }
            //View para el popup de marcaje de falta 
        else if segue.identifier == "falta"{
            let viewSal = segue.destination as! PopupMarcaje
            viewSal.tipo = "falta"
        }
            //View para el popup de marcaje de falta
        else if segue.identifier == "resumenDia"{
            let viewRes = segue.destination as! PopupResumenDia
            viewRes.sem = sem
            var index = tableDia.indexPathForSelectedRow!
            viewRes.dia = index.row
            viewRes.monolito = monolito
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
            //Se cargan las etiquetas correspondientes
            lbSemana.text = "Semana siguiente"
            lbTotalHoras.text = "Total horas: " + monolito.resume0.total
            lbTotalEx.text = "Total horas excedentes: " + monolito.resume0.overtime
        } else if (sem == 1){
            carga(currentdias: monolito.week1)
            //Se cargan las etiquetas correspondientes
            lbSemana.text = "Semana actual"
            lbTotalHoras.text = "Total horas: " + monolito.resume1.total
            lbTotalEx.text = "Total horas excedentes: " + monolito.resume1.overtime
        } else if (sem == 2){
            carga(currentdias: monolito.week2)
            //Se cargan las etiquetas correspondientes
            lbSemana.text = "Primera semana anterior"
            lbTotalHoras.text = "Total horas: " + monolito.resume2.total
            lbTotalEx.text = "Total horas excedentes: " + monolito.resume2.overtime
        } else if (sem == 3){
            carga(currentdias: monolito.week3)
            //Al llegar a la segunda semana pasada, aparecen los botones de semana anterior
            btnSemAnt.isHidden = false
            lbSemAnt.isHidden = false
            //Se cargan las etiquetas correspondientes
            lbSemana.text = "Segunda semana anterior"
            lbTotalHoras.text = "Total horas: " + monolito.resume3.total
            lbTotalEx.text = "Total horas excedentes: " + monolito.resume3.overtime
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
            //Se cargan las etiquetas correspondientes
            lbSemana.text = "Semana actual"
            lbTotalHoras.text = "Total horas: " + monolito.resume1.total
            lbTotalEx.text = "Total horas excedentes: " + monolito.resume1.overtime
        } else if (sem == 2){
            carga(currentdias: monolito.week2)
            //Se cargan las etiquetas correspondientes
            lbSemana.text = "Primera semana anterior"
            lbTotalHoras.text = "Total horas: " + monolito.resume2.total
            lbTotalEx.text = "Total horas excedentes: " + monolito.resume2.overtime
        } else if (sem == 3){
            carga(currentdias: monolito.week3)
            //Se cargan las etiquetas correspondientes
            lbSemana.text = "Segunda semana anterior"
            lbTotalHoras.text = "Total horas: " + monolito.resume3.total
            lbTotalEx.text = "Total horas excedentes: " + monolito.resume3.overtime
        } else if (sem == 4){
            carga(currentdias: monolito.week4)
            //Al llegar a la ultima semana, desapareceran los botones de semana anterior
            btnSemAnt.isHidden = true
            lbSemAnt.isHidden = true
            //Se cargan las etiquetas correspondientes
            lbSemana.text = "Tercera semana anterior"
            lbTotalHoras.text = "Total horas: " + monolito.resume4.total
            lbTotalEx.text = "Total horas excedentes: " + monolito.resume4.overtime
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
        //Si la entrada tiene datos y el index no es 0 , se hacen los calculos
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
    //funcion que indica si el usuario falto todo un dia
    func falto(index : Int) -> Bool {
        //Si es un dia con horario, el index no es 0 y la semana no es 0 ni 1, se hacen los calculos
        if (testData[index].horario != "--" && index != 0 && sem != 0 && sem != 1 ){
            //Se concatena por partes los strings de cada registro de entrada y salida
            var aux1 = testData[index].entrada + testData[index].entrada_comida
            var aux2 = testData[index].salida + testData[index].salida_comida
            //El string final se guarda en aux3
            var aux3 = aux1+aux2
            //Si aux3 es igual a el string resultante de todos los dias vacios se regresa true
            if (aux3 == "--------"){
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    //Funcion que indica si un dia es de descanso o no
    func descanso(index : Int) -> Bool {
        //Si el index no es 0 , se hacen los calculos
        if (index != 0){
            //Se concatena por partes los strings de cada registro de entrada y salida
            var aux1 = testData[index].entrada + testData[index].entrada_comida
            var aux2 = testData[index].salida + testData[index].salida_comida
            //El string final se guarda en aux3
            var aux3 = aux1+aux2+testData[index].horario
            //Si aux3 es igual a el string resultante de todos los dias vacios se regresa true
            if (aux3 == "----------"){
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
}
