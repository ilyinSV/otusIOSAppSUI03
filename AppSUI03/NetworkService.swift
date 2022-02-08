
import Foundation

class NetworkService {
    
    func request(urlString: String,
                 complition: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let request = createRequest(url: url)
        let task = createTask(request: request,
                              complition: complition)
        task.resume()
    }
    
    private func createRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringCacheData
        return request
    }
    
    private func createTask(request: URLRequest,
                            complition: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        URLSession.shared.dataTask(with: request) { data, response, error in
            complition(data, error)
        }
    }
    
}
