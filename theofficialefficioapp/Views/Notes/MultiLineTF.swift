
import SwiftUI
import Firebase

struct MultiLineTF: UIViewRepresentable {
    
    @Binding var txt: String
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        
        // Set custom font
        view.font = UIFont.mitrFont(size: 18, weight: .regular)
        
        // Set initial placeholder
        view.textColor = .gray
        view.text = "Type here..."
        
        view.isEditable = true
        view.backgroundColor = .clear
        view.delegate = context.coordinator
        
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        // Update the UITextView content based on the binding
        if txt.isEmpty {
            if uiView.text.isEmpty {
                // Show placeholder if text is empty
                uiView.text = "Type here..."
                uiView.textColor = .gray
            }
        } else {
            uiView.text = txt
            uiView.textColor = .black
        }
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: MultiLineTF
        
        init(parent: MultiLineTF) {
            self.parent = parent
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            // Clear placeholder when editing begins
            if textView.text == "Type here..." {
                textView.text = ""
                textView.textColor = .black
            }
        }
        
        func textViewDidChange(_ textView: UITextView) {
            // Update binding with text view's content
            parent.txt = textView.text
            
            // Manage placeholder visibility
            if textView.text.isEmpty {
                textView.text = "Type here..."
                textView.textColor = .gray
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            // Restore placeholder if text view is empty
            if textView.text.isEmpty {
                textView.text = "Type here..."
                textView.textColor = .gray
            }
        }
    }
}
