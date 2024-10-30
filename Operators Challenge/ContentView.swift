//
//  ContentView.swift
//  Operators Challenge
//
//  Created by Grace Hopper on 9/2/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.openURL) var openURL
    @State private var textField00 = ""
    @State private var textField01 = ""
    @State private var textField02 = ""
    @State private var textField03 = ""
    @State private var textField04 = ""
    @State private var textField05 = ""
    @State private var textField06 = ""
    @State private var textField07 = ""
    @State private var textField08 = ""
    @State private var textField09 = ""
    @State private var textField10 = ""
    @State private var textField11 = ""
    
    @State private var equalToText = ""
    @State private var notEqualToText = ""
    @State private var greaterThanText = ""
    @State private var lessThanText = ""
    @State private var greaterThanOrEqualText = ""
    @State private var lessThanOrEqualText = ""
    
    @State private var numberOfTicketsTextFieldText = ""
    @State private var purchasedPackages = 0
    @State private var individualTickets = 0
    
    @State private var urlAddOnTextFieldText = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("Operators Challenge")
                    .font(.largeTitle)
                MVPFields(leftTextFieldEntry: $textField00,
                          operatorDisplay: "==",
                          rightTextFieldEntry: $textField01,
                          evaluation: equalToText)
                MVPFields(leftTextFieldEntry: $textField02,
                          operatorDisplay: "!=",
                          rightTextFieldEntry: $textField03,
                          evaluation: notEqualToText)
                MVPFields(leftTextFieldEntry: $textField04,
                          operatorDisplay: ">",
                          rightTextFieldEntry: $textField05,
                          evaluation: greaterThanText)
                MVPFields(leftTextFieldEntry: $textField06,
                          operatorDisplay: "<",
                          rightTextFieldEntry: $textField07,
                          evaluation: lessThanText)
                MVPFields(leftTextFieldEntry: $textField08,
                          operatorDisplay: ">=",
                          rightTextFieldEntry: $textField09,
                          evaluation: greaterThanOrEqualText)
                MVPFields(leftTextFieldEntry: $textField10,
                          operatorDisplay: "<=",
                          rightTextFieldEntry: $textField11,
                          evaluation: lessThanOrEqualText)
                Button("Test MVP") {
                    testMVP()
                }
                Divider()
            }
            Group {
                HStack {
                    TextField("Number of tickets", text: $numberOfTicketsTextFieldText)
                        .border(Color.blue)
                        .fixedSize()
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    VStack {
                        Text("Buy \(purchasedPackages) packages")
                        Text("Buy \(individualTickets) single tickets")
                    }
                }
                .onChange(of: numberOfTicketsTextFieldText, perform: { value in
                    testStretch1()
                })
                Divider()
                TextField("urlAddOn", text: $urlAddOnTextFieldText)
                    .border(Color.blue)
                    .fixedSize()
                    .keyboardType(.URL)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                Button("Test Stretch #3") {
                    testStretch3()
                }
                Spacer()
            }
            .gesture(DragGesture(minimumDistance: 10, coordinateSpace: .local)
                        .onEnded({ value in
                            if value.translation.width < 0 {
                                swipeLeft()
                            }
                            if value.translation.width > 0 {
                                swipeRight()
                            }
                        }))
        }
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0 ))
    }
    
    /****************************************
    * Complete the MVP code in the following section
    ********************************************/
    func testMVP() {
        if let number00 = Int(textField00) {
            if let number01 = Int(textField01) {
                // replace the ?? below with the 'equality' operator
                equalToText = String(number00 == number01)
            }
        }
        if let number02 = Int(textField02) {
            if let number03 = Int(textField03) {
                // replace the ?? below with the 'not equals' operator
                notEqualToText = String(number02 != number03)
            }
        }
        if let number04 = Int(textField04) {
            if let number05 = Int(textField05) {
                // replace the ?? below with the 'greater than' operator
                greaterThanText = String(number04 > number05)
            }
        }
        if let number06 = Int(textField06) {
            if let number07 = Int(textField07) {
                // replace the ?? below with the 'less than' operator
                lessThanText = String(number06 < number07)
            }
        }
        if let number08 = Int(textField08) {
            if let number09 = Int(textField09) {
                // replace the ?? below with the 'greater than or equal' operator
                greaterThanOrEqualText = String(number08 >= number09)
            }
        }
        if let number10 = Int(textField10) {
            if let number11 = Int(textField11) {
                // replace the ?? below with the 'less than or equal' operator
                lessThanOrEqualText = String(number10 <= number11)
            }
        }
    }
    
    func testStretch1() {
        if let numberOfTickets = Int(numberOfTicketsTextFieldText) {
            /************************************
            * Start Your Code Here For Stretch 1
            ************************************/
            purchasedPackages = numberOfTickets / 4
            individualTickets = numberOfTickets % 4
            /*********************************
            * End Your Code Here For Stretch 1
            ***********************************/
        }
    }
    
    func swipeRight() {
        if var numberOfTickets = Int(numberOfTicketsTextFieldText) {
            /***************************************************
            * Start Your Code Here For Stretch 2 - right swipe
            ****************************************************/
            numberOfTickets = numberOfTickets + 1
            /***************************************************
            * End Your Code Here For Stretch 2 - right swipe
            ***************************************************/
            numberOfTicketsTextFieldText = String(numberOfTickets)
        }
    }
    
    func swipeLeft() {
        if var numberOfTickets = Int(numberOfTicketsTextFieldText) {
             /***************************************************
             * Start Your Code Here For Stretch 2 - left swipe
             ****************************************************/
            numberOfTickets = numberOfTickets - 1

             /***************************************************
             * End Your Code Here For Stretch 2 - left swipe
             ***************************************************/
            numberOfTicketsTextFieldText = String(numberOfTickets)
        }
    }
    
    func testStretch3() {
        /************************************
        * Start Your Code Here For Stretch 3
        *************************************/
        let unchartedLink = "https://www.unchartedlearning.org"
        let completeURL = unchartedLink + urlAddOnTextFieldText
        /***********************************
        * End Your Code Here For Stretch 3
        ***********************************/
        // Uncomment the following line for Stretch #3
        openURL(URL(string: completeURL)!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MVPFields: View {
    let leftTextFieldEntry: Binding<String>
    let operatorDisplay: String
    let rightTextFieldEntry: Binding<String>
    let evaluation: String
    var body: some View {
        HStack {
            TextField("", text: leftTextFieldEntry)
                .frame(width: 50, height: 30, alignment: .center)
                .multilineTextAlignment(.center)
                .border(Color.blue)
                .fixedSize()
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text(operatorDisplay)
                .frame(width: 50, height: 30, alignment: .center)
                .font(.title)
            TextField("", text: rightTextFieldEntry)
                .frame(width: 50, height: 30, alignment: .center)
                .multilineTextAlignment(.center)
                .border(Color.blue)
                .fixedSize()
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack {
                if evaluation != "" {
                    Text("evaluates to ")
                    Text("\(evaluation)")
                        .fontWeight(.bold)
                }
            }
        }
    }
}
