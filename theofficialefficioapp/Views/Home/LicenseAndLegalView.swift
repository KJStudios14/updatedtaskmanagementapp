

import SwiftUI

struct LicenseAndLegalView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Text("License and Legal")
                    .mitrFont(.title2, weight: .bold)
 

                Text("Terms of Service")
                    .mitrFont(.headline, weight: .bold)
                    .padding(.top, 3)
                
                Text("""
                Welcome to Efficio! By using our app, you agree to the following terms:

                1. **Acceptance of Terms**: By accessing or using EfficioApp, you agree to comply with and be bound by these Terms of Service. If you do not agree with these terms, please do not use the app.

                2. **Changes to Terms**: We may update these terms from time to time. We will notify you of any significant changes by posting the new terms on this page. It is your responsibility to review these terms periodically.

                3. **User Responsibilities**: You agree to use the app in a lawful manner and not to engage in any activity that could harm or disrupt the app or its services.

                4. **Intellectual Property**: All content and materials provided by EfficioApp are owned by us or our licensors. You may not use, reproduce, or distribute any content without our permission.

                5. **Limitation of Liability**: EfficioApp is provided "as is" and we make no warranties regarding its performance or availability. We are not liable for any damages arising from the use of the app.

                6. **Governing Law**: These terms are governed by the laws of the State of Example, without regard to its conflict of laws principles.

                If you have any questions about these terms, please contact us at efficioapp@gmail.com.
                """)
                .mitrFont(.headline, weight: .regular)
                    .padding(.bottom, 20)
                
                Text("Privacy Policy")
                    .mitrFont(.headline, weight: .bold)
                
                Text("""
                Your privacy is important to us. This Privacy Policy outlines how we collect, use, and protect your information:

                1. **Information Collection**: We collect information that you provide directly, such as your name and email address, as well as information about your usage of the app.

                2. **Use of Information**: We use the collected information to provide and improve our services, communicate with you, and for other purposes described in this policy.

                3. **Data Security**: We implement reasonable measures to protect your data from unauthorized access or disclosure. However, no method of transmission over the internet is completely secure.

                4. **Third-Party Services**: Our app may contain links to third-party websites or services. We are not responsible for the privacy practices or content of those third parties.

                5. **Children’s Privacy**: The app is not intended for use by children under the age of 11. We do not knowingly collect personal information from children under 11.

                If you have any questions about our privacy practices, please contact us at efficioapp@gmail.com.
                """)
                    .mitrFont(.headline, weight: .regular)
                    .padding(.bottom, 20)
                

                Spacer()
            }
            .padding()
        }
    }
}


#Preview {
    LicenseAndLegalView()
}
