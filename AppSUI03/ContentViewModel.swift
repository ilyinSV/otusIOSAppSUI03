
import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    
    @Injected var bitcoinPriceFetcher: BitcoinPriceService?
    
    @Published var price: String?
    
    func updatePrice() {
        bitcoinPriceFetcher?.fetchPrice(response: { amount in
            DispatchQueue.main.async {
                self.price = amount
            }
        })
    }
    
}
