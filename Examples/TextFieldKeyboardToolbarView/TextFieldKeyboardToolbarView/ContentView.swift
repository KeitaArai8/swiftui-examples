import SwiftUI

extension UIApplication {
  func endEditing() {
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}

struct ContentView: View {
  @State var text = ""
   
  var body: some View {
    VStack {
      HStack {
        Spacer().frame(width: 24)
         
        Text("TextField")
         
        Spacer()
      }.frame(maxWidth: .infinity)
       
      TextField("Placeholder", text: $text)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        .toolbar {
          ToolbarItemGroup(placement: .keyboard) {
            HStack {
              Spacer()
              Button("閉じる") {
                UIApplication.shared.endEditing()
              }
              Spacer().frame(width: 16)
            }
          }
        }
    }
  }
}
