import SwiftUI

struct SecureInputView: View {
    @State var password = ""
        
        var body: some View {
            VStack(alignment: .leading) {
                Text("Password")
                    .font(.headline)
                    .bold()
                
                _SecureInputView("Enter Password", text: $password)
                    .font(.caption)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .cornerRadius(5)
                   
            }.padding(.horizontal)
        }
}

struct _SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                }
            }.padding(.trailing, 10)

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }.padding(10)
        }
    }
}

struct SecureInputView_Previews: PreviewProvider {
    static var previews: some View {
        SecureInputView()
    }
}
