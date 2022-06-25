import SwiftUI

struct FixedTextView: View {
    var body: some View {
        VStack {
            Text("TextView")
                .font(.system(size: 20, weight: .bold))
            
            Text("Swift includes modern features like type inference, optionals, and closures, which make the syntax concise yet expressive. Swift ensures your code is fast and efficient, while its memory safety and native error handling make the language safe by design. Writing Swift code is interactive and fun in Swift Playgrounds, playgrounds in Xcode, and REPL.")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(14)
            
            Spacer()
            
            Text("FixedTextView")
                .font(.system(size: 20, weight: .bold))
            Text("Swift includes modern features like type inference, optionals, and closures, which make the syntax concise yet expressive. Swift ensures your code is fast and efficient, while its memory safety and native error handling make the language safe by design. Writing Swift code is interactive and fun in Swift Playgrounds, playgrounds in Xcode, and REPL.")
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(14)
            
            Spacer()
            
            Text("TextView")
                .font(.system(size: 20, weight: .bold))
            
            Text("Swift includes modern features like type inference, optionals, and closures, which make the syntax concise yet expressive. Swift ensures your code is fast and efficient, while its memory safety and native error handling make the language safe by design. Writing Swift code is interactive and fun in Swift Playgrounds, playgrounds in Xcode, and REPL.")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(14)
            
            Spacer()
            
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green)
    }
}

struct FixedTextView_Previews: PreviewProvider {
    static var previews: some View {
        FixedTextView()
    }
}
