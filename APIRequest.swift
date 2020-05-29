//
//  APIRequest.swift
//  HBE Horarios IOS
//
//  HEB Horarios fue desarrollado como proyecto final de la materia Proeycto de Desarrollo
//  para dispositivos móviles en el semestre Febrero Junio 2020.
//  Desarrolladores:
    //  Carlos Andrés Miranda Eguia A00817390 carlosa_miranda@outlook.com
    //  Gabriel Ortega Jacobo A01176807 a01176807@itesm.mx
    //  Paulina Cámara Vidales A01039839 a01039839@itesm.mx
//

import Foundation

enum APIError: Error{
    case responseProblem
    case decodingProblem
    case unexpectedProblem
}

struct APIRequestBody: Codable{
    var user: String
    var password: String
    var fecha: String
}

struct APIResponse: Codable{
    var error: Bool
    var message: String
    var data: String
}


struct APIResponseMonolito: Codable{
    var error: Bool
    var message: String
    var data: Monolito
}

struct APIRequest {
    let resourceURL: URL
    
    init(endpoint: String){
        let resourceString = "http://localhost:8000/api/\(endpoint)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }
    
    func send (_ body: APIRequestBody, completion: @escaping(Result<APIResponse, APIError>)->Void ){
        do{
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(body)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) {data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200,
                    let jsonData = data else{
                    completion(.failure(.responseProblem))
                    return
                }
                do{
                    let responseObject = try JSONDecoder().decode(APIResponse.self, from: jsonData)
                    completion(.success(responseObject))
                }catch{
                    completion(.failure(.decodingProblem))
                }
            }
            
            dataTask.resume()
        }catch{
            completion(.failure(.unexpectedProblem))
        }
        
    }
    
    func bigsend (_ body: APIRequestBody, completion: @escaping(Result<APIResponseMonolito, APIError>)->Void ){
        do{
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(body)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) {data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200,
                    let jsonData = data else{
                    completion(.failure(.responseProblem))
                    return
                }
                do{
                    let responseObject = try JSONDecoder().decode(APIResponseMonolito.self, from: jsonData)
                    completion(.success(responseObject))
                }catch{
                    completion(.failure(.decodingProblem))
                }
            }
            
            dataTask.resume()
        }catch{
            completion(.failure(.unexpectedProblem))
        }
        
    }
}
