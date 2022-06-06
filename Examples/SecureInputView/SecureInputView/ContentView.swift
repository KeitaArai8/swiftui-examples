import SwiftUI

struct ContentView: View {
    @State var password = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Password")
                .font(.headline)
                .bold()
            
            SecureInputView("Enter Password", text: $password)
                .font(.caption)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .cornerRadius(5)
               
        }.padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
