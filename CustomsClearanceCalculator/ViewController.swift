//
//  ViewController.swift
//  CustomsClearanceCalculator
//
//  Created by Владислав Юрченко on 06.03.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var countryCustomsClearance: UISegmentedControl!
    @IBOutlet weak var modelField: UITextField!
    @IBOutlet weak var brandField: UITextField!
    @IBOutlet weak var productionField: UITextField!
    @IBOutlet weak var fuelField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    let modelPickerView = UIPickerView()
    let brandPickerView = UIPickerView()
    let productionPickerView = UIPickerView ()
    let fuelPickerView = UIPickerView()
    let models = Model.allCases
    let brands = Brand.allCases
    let fuels = Fuel.allCases
    let productions = Production.allCases
    let countries = Country.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuremodelField ()
        configurebrandField ()
        configureproductionField ()
        configurefuelField()
        configureTextFields()
        configureCountryCustomsClearance ()
        modelField.becomeFirstResponder()
        registerForKeyboardNotifications()
    }
    @IBAction func calculateDidTap(_ sender: Any) {
        let titlemodel = modelField.text ?? ""
        let carmodel = Model(title: titlemodel)
        let model = carmodel.value
        
        let titlebrand = brandField.text ?? ""
        let carbrand = Brand(title: titlebrand)
        let brand = carbrand.value
        
        let titleproduction = productionField.text ?? ""
        let carproduction = Production(title: titleproduction)
        let production = carproduction.value
        
        let titlefuel = fuelField.text ?? ""
        let carfuel = Fuel(title: titlefuel)
        let fuel = carfuel.value
        
        let seletedCountry = Country(value: countryCustomsClearance.selectedSegmentIndex) 
        let calculate = Double((model) + (production) + (brand) + (fuel)) * seletedCountry.rawValue
        let result = Double(calculate)//ukraine; country koef;)
        priceField.text = String(result)
    }
    
    @IBAction func countryCustomsClearanceDidChange(_ sender: UISegmentedControl) {
        clear()
    }
    @IBAction func clearDidTap(_ sender: Any) {
        clear ()
    }
    func  clear () {
        modelField.text = nil
        brandField.text = nil
        productionField.text = nil
        fuelField.text = nil
        priceField.text = nil
        modelField.becomeFirstResponder()
    }
    func configureCountryCustomsClearance () {
        countryCustomsClearance.removeAllSegments()
        countryCustomsClearance.insertSegment(withTitle: Country.Ukraine.title, at: 0, animated: false)
        countryCustomsClearance.insertSegment(withTitle: Country.USA.title, at: 1, animated: false)
        countryCustomsClearance.selectedSegmentIndex = 0
        
        // Do any additional setup after loading the view.
    }
    func configureTextFields () {
        priceField.delegate = self
        priceField.keyboardType = .numberPad
    }
    func configuremodelField () {
        modelPickerView.dataSource = self
        modelPickerView.delegate = self
        modelField.inputView = modelPickerView
        selectModelBy(row: 0)
    }
    func configurebrandField () {
        brandPickerView.dataSource = self
        brandPickerView.delegate = self
        brandField.inputView = brandPickerView
        selectBrandBy(row: 0)
    }
    func configureproductionField () {
        productionPickerView.dataSource = self
        productionPickerView.delegate = self
        productionField.inputView = productionPickerView
        selectProductionBy(row: 0)
    }
    func configurefuelField () {
        fuelPickerView.dataSource = self
        fuelPickerView.delegate = self
        fuelField.inputView = fuelPickerView
        selectFuelBy(row: 0)
    }
    func selectModelBy(row: Int) {
        modelField.text = models[row].title
    }
    func selectBrandBy(row: Int) {
        brandField.text = brands[row].title
    }
    func selectProductionBy(row: Int) {
        productionField.text = productions[row].title
    }
    func selectFuelBy(row: Int) {
        fuelField.text = fuels[row].title
        
    }
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardApear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisapear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
//    func removeKeyboardNotifications() {
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIkeyboardWillShowNotification, object: nil
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.kbwillHide, object: nil)
//    }
    var isExpand : Bool = false
    @objc func keyboardApear(_ notification: Notification) {
        if !isExpand {
            self.scrollView.contentSize = CGSize (width: self.view.frame.width, height: self.scrollView.frame.height + 250)
        }
        let userInfo = notification.userInfo
        let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize.height)
    }
    @objc func keyboardDisapear(){
        self.scrollView.contentSize = CGSize (width: self.view.frame.width, height: self.scrollView.frame.height + 250)
        self.isExpand = false
        scrollView.contentOffset = CGPoint.zero
}

}
extension ViewController: UITextFieldDelegate {
    
    func textField (_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet (charactersIn: string)
        return allowedCharacters.isSuperset (of: characterSet)
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case modelPickerView:
            return models.count
        case brandPickerView:
            return brands.count
        case productionPickerView:
            return productions.count
        case fuelPickerView:
            return fuels.count
        default:
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case modelPickerView:
            return models[row].title
        case brandPickerView:
            return brands[row].title
        case productionPickerView:
            return productions[row].title
        case fuelPickerView:
            return fuels[row].title
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case modelPickerView:
            return selectModelBy(row: row)
        case brandPickerView:
            return selectBrandBy(row: row)
        case productionPickerView:
            return selectProductionBy(row: row)
        case fuelPickerView:
            return selectFuelBy(row: row)
        default:
            break
            
        }
    }
}

