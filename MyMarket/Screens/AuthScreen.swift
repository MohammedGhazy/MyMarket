//
//  AuthScreen.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 4/24/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import UIKit

class AuthScreen: UIViewController {
    
    let emailForLogin        = GFTextField(placeholder: "email", isSecure: false)
    let passwordForLogin     = GFTextField(placeholder: "Password", isSecure: true)
    let emailForRegister     = GFTextField(placeholder: "email", isSecure: false)
    let passwordForRegister  = GFTextField(placeholder: "Password", isSecure: true)
    let address              = GFTextField(placeholder: "address" , isSecure: false)
    let birthDate            = GFTextField(placeholder: "birthdate" , isSecure: false)
    let loginBtn             = GFButton(color: .systemGreen, title: "Login")
    let signupBtn            = GFButton(color: .systemGreen, title: "signup")
    let noAccountLabel       = GFSecandryTitleLabel(fontSize: 12)
    let logoImage            = UIImageView()
    let datePicker           = UIDatePicker()
    
    var isLoginForm: Bool    = true
    var isloginBtn: Bool     = true
    
    //----------------------------viewDidLoad-------------------------------//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailForLogin.delegate       = self
        self.passwordForLogin.delegate    = self
        self.emailForRegister.delegate    = self
        self.passwordForRegister.delegate = self
        self.address.delegate             = self
        self.birthDate.delegate           = self
        
        configureViewController()
        configureLogo()
        configureSegmentControl()
        ConfigureLoginForm()
        configureDatePicker()
        createDismessKeyboard()
        configureButtonsAction()
    }
    
    //----------------------------- view will appear -----------------------------------//
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    //---------------------------- configureViewController -------------------------------//
    func configureViewController(){
        view.backgroundColor  = .systemBackground
    }
    
    //----------------------------configureSegmentControl-------------------------------//
    func configureSegmentControl(){
        let items = ["Login" , "Register"]
        let segmentedControl = UISegmentedControl(items : items)
        segmentedControl.frame = CGRect(x: 10, y: 250, width: (self.view.frame.width - 20), height: 30)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
        
        segmentedControl.layer.cornerRadius = 2.0
        segmentedControl.backgroundColor = .systemGreen
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        segmentedControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
        segmentedControl.setTitleTextAttributes(titleTextAttributes, for: .selected)
        
        navigationItem.titleView = segmentedControl
    }
    
    @objc func indexChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            address.isHidden             = true
            signupBtn.isHidden           = true
            birthDate.isHidden           = true
            emailForRegister.isHidden    = true
            passwordForRegister.isHidden = true
            loginBtn.isHidden            = false
            noAccountLabel.isHidden      = false
            emailForLogin.isHidden       = false
            passwordForLogin.isHidden    = false
            isLoginForm = true
            isloginBtn  = true
            ConfigureLoginForm()
        case 1:
            address.isHidden             = false
            signupBtn.isHidden           = false
            birthDate.isHidden           = false
            emailForRegister.isHidden    = false
            passwordForRegister.isHidden = false
            loginBtn.isHidden            = true
            noAccountLabel.isHidden      = true
            emailForLogin.isHidden       = true
            passwordForLogin.isHidden    = true
            isLoginForm = false
            isloginBtn  = false
            ConfigureRegisterForm()
        default:
            ConfigureLoginForm()
        }
    }
    
    //----------------------------configureLoginForm-------------------------------//
    func ConfigureLoginForm() {
        let stackView = UIStackView(arrangedSubviews: [emailForLogin, passwordForLogin, noAccountLabel, loginBtn])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        noAccountLabel.text = "Don't have account?"
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
    }
    
    //----------------------------configureRegisterForm-------------------------------//
    func ConfigureRegisterForm() {
        let stackView = UIStackView(arrangedSubviews: [emailForRegister, passwordForRegister, address,birthDate,signupBtn])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        noAccountLabel.text = "Don't have account?"
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
    }
    
    //----------------------------configureButtonsAction-------------------------------//
    
    func configureButtonsAction(){
        loginBtn.addTarget(self, action: #selector(pushToHomeScreen), for: .touchDown)
        signupBtn.addTarget(self, action: #selector(pushToHomeScreen), for: .touchDown)
    }
    
    @objc func pushToHomeScreen(){
            let tabBarVC = TabBarVC()
            tabBarVC.modalPresentationStyle = .fullScreen
            navigationController?.present(tabBarVC, animated: true, completion: nil)
    }
    //----------------------------toolBar----------------------------------------------//
    func createToolBar() -> UIToolbar{
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        toolBar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolBar.setItems([doneBtn], animated: true)
        return toolBar
    }
    //----------------------------date picker-------------------------------//
    func configureDatePicker() {
        datePicker.datePickerMode = .date
        birthDate.inputView = datePicker
        birthDate.inputAccessoryView = createToolBar()
    }
    
    @objc func donePressed() {
        let dateFormatter         = DateFormatter()
        dateFormatter.dateFormat  = "MMM yyyy"
        birthDate.text =  dateFormatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
    }
    
    //----------------------------logo-------------------------------//
    func configureLogo(){
        view.addSubview(logoImage)
        logoImage.image  = UIImage(named: "green")
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 150),
            logoImage.heightAnchor.constraint(equalToConstant: 150),
            
        ])
    }
    
    //----------------------------cancel keyboard-------------------------------//
    func createDismessKeyboard(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        if isLoginForm == false {
            switch textField {
            case self.emailForRegister:
                self.passwordForRegister.becomeFirstResponder()
            case self.passwordForRegister:
                self.address.becomeFirstResponder()
            case self.address:
                self.birthDate.becomeFirstResponder()
            default:
                self.emailForRegister.resignFirstResponder()
            }
        }else {
            switch textField {
            case self.emailForLogin:
                self.passwordForLogin.becomeFirstResponder()
            default:
                self.emailForLogin.resignFirstResponder()
            }
        }
    }
}


extension AuthScreen : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // here my logic //
        self.switchBasedNextTextField(textField)
        return true
    }
}
