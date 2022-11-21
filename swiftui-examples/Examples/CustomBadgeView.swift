import SwiftUI

struct CustomBadgeView: View {
    var body: some View {
        VStack(spacing: 50) {
            HStack {
                Text("右上")
                
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "bell")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 42, height: 42)
                        .foregroundColor(.black)
                    
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 12, height: 12)
                        .cornerRadius(60)
                }
            }
            
            HStack {
                Text("左上")
                
                ZStack(alignment: .topLeading) {
                    Image(systemName: "bell")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 42, height: 42)
                        .foregroundColor(.black)
                    
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 12, height: 12)
                        .cornerRadius(60)
                }
            }
        }
    }
}
