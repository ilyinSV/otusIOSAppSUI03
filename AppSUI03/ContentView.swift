
import Foundation
import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = ContentViewModel()
    
    var body: some View {
        VStack {
            Text("Bitcoin is currently\n")
            Text("\(self.model.price ?? "--.--") USD" )
            Button {
                self.model.updatePrice()
            } label: {
                Text("Update").frame(height: 50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
