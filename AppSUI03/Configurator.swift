
import Foundation

class Configurator {
    
    static let shared = Configurator()
    
    func register() {
        ServiceLocator.shared.addServices(service: NetworkService())
        ServiceLocator.shared.addServices(service: BitcoinPriceService())
    }
}
