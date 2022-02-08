
import Foundation

class ServiceLocator {
    
    static let shared = ServiceLocator()
    
    lazy var services: [String: AnyObject] = {
        [String: AnyObject]()
    }()
    
    public func addServices<T: AnyObject>(service: T) {
        let key = String(describing: T.self)
        if self.services[key] == nil {
            self.services[key] = service
        }
    }
    
    public func getService<T: AnyObject>(type: T.Type) -> T? {
        let key = String(describing: T.self)
        return self.services[key] as? T
    }
}
