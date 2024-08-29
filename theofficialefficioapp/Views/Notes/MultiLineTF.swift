
import SwiftUI
import Firebase

struct MultiLineTF : UIViewRepresentable {
    
    @Binding var txt : String
    
    func makeCoordinator() -> MultiLineTF.Coordinator {
        return MultiLineTF.Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MultiLineTF>) -> UITextView{
        let view = UITextView()
        
        if self.txt != ""{
            view.text = self.txt
            view.textColor = .black
        } else {
            view.text = "Type Something"
            view.textColor = .gray
        }
        
        view.font = .systemFont(ofSize: 18)
        view.isEditable = true
        view.backgroundColor = .clear
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultiLineTF>) {
    }
    
    class Coordinator : NSObject, UITextViewDelegate {
        var parent : MultiLineTF
        
        init(parent1 : MultiLineTF) {
            parent = parent1
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if self.parent.txt == ""{
                textView.text = ""
                textView.textColor = .black
            }
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.txt = textView.text
        }
    }
}


