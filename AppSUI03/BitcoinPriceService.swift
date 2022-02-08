
import Foundation

class BitcoinPriceService {
    
    @Injected var network: NetworkService?
    
    private let url = "https://api.coinbase.com/v2/prices/BTC-USD/spot"
    
    func fetchPrice(response: @escaping (String?) -> Void) {
        network?.request(urlString: url, complition: { data, error in
            if let error = error {
                print("Error requesting: \(error.localizedDescription).")
                response(nil)
            }
            
            let amount = self.parsePrice(data: data)
            response(amount)
        })
    }
    
    private func parsePrice(data: Data?) -> String? {
        guard let data = data,
            let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
                print("Error invalid received data.")
                return nil
        }
        
        var result: String?
        
        if let json = json as? [String: Any] {
            if let data = json["data"] as? [String: Any] {
                result = data["amount"] as? String
            }
        }
        
        return result
    }
}
