import Alamofire
import Foundation

/*struct NetworkConfig {
    let baseUrl: String
}*/

enum NetworkPath: String {
    static let baseUrl: String = "https://tarifiyle-bul.onrender.com/api/"
    case login = "users/login"

}
enum NetworkError: Error {
    case ParsingFailed(message: String = "Parsing error")
    case NetworkFailed(message: String = "Network error")
}

protocol INetworkManager {
    func fetch<T: Codable>(path: NetworkPath, method: HTTPMethod,onSuccess:@escaping(T)->(),
                           onError:@escaping (Error)->())
    func post<T: Codable, R: Encodable>(path: NetworkPath,model: R,onSuccess:@escaping(T)->(),
                           onError:@escaping (Error)->())
}

 final class NetworkManager: INetworkManager {
    static let shared: INetworkManager = NetworkManager()

     private init(){
         
     }
     func fetch<T: Codable>(path: NetworkPath, method: HTTPMethod,onSuccess:@escaping(T)->(),
                            onError:@escaping (Error)->()) {
         AF.request("\(NetworkPath.baseUrl)\(path.rawValue)", method: method)
             .validate().responseDecodable(of: T.self) { response in
                 if let model = response.value {
                                onSuccess(model)
                            } else if let error = response.error {
                                 onError(NetworkError.ParsingFailed())
                              
                            } else {
                                onError(NetworkError.ParsingFailed())
                              
                            }
                 guard let model = response.value else {return onError(NetworkError.ParsingFailed())}
                 onSuccess(model)
             }
     }
     func post<T: Codable, R: Encodable>(path: NetworkPath,model: R,onSuccess:@escaping(T)->(),
                            onError:@escaping (Error)->()) {
         
         let jsonEncoder = JSONEncoder()
         guard let data = try? jsonEncoder.encode(model) else {
             return onError(NetworkError.ParsingFailed())
         }
         guard let dataString = String(data: data, encoding: .utf8) else {
             return onError(NetworkError.ParsingFailed())
         }
         let parameters = convertToDictionary(text: dataString)
   
         AF.request("\(NetworkPath.baseUrl)\(path.rawValue)", method: .post,parameters: parameters,encoding: JSONEncoding.default)
             .validate().responseDecodable(of: T.self) { response in
                 print(response.result)
                 if let model = response.value {
                                        onSuccess(model)
                                    } else if let error = response.error {
                                        onError(error)
                                       
                                    } else {
                                        onError(NetworkError.ParsingFailed())
                                      
                                    }
             }
     }


    private func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
}
