//
//  ViewController.swift
//  CustomsClearanceCalculator
//
//  Created by Владислав Юрченко on 06.03.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countryCustomsClearance: UISegmentedControl!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var brandField: UITextField!
    @IBOutlet weak var productionField: UITextField!
    @IBOutlet weak var fuelField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    let typePickerView = UIPickerView()
    let brandPickerView = UIPickerView()
    let productionPickerView = UIPickerView ()
    let fuelPickerView = UIPickerView()
    let types = Type.allCases
    let brands = Brand.allCases
    let fuels = Fuel.allCases
    let productions = Production.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuretypeField ()
        configurebrandField ()
        configureproductionField ()
        configurefuelField()
        configureTextFields()
        configureCountryCustomsClearance ()
        priceField.becomeFirstResponder()
    }
    
    @IBAction func calculateDidTap(_ sender: Any) {
//        guard let type = Int(typeField.text ?? ""),
//              let brand = Int(brandField.text ?? ""),
//              let production = Int(aField.text ?? ""),
//              weight > 0 && height > 0 && age > 0 else {
//            return
//        }
//
//        let activityIndex = pickerView.selectedRow(inComponent: 0)
//        let activity = activities[activityIndex]
//        let activityValue = activity.value
//
//        guard let seletedSex = Sex(rawValue: sexSegmentControl.selectedSegmentIndex) else { return }
//
//        switch seletedSex {
//        case .male:
//            let result = Double(10 * weight) + (6.25 * Double(height)) - Double(5 * age) + 5.0 + Double(activityValue)
//            showAlertWith(title: String(result))
//
//        case .female:
//            let result = Double(8 * weight) + (5.25 * Double(height)) - Double(5 * age) + 5.0 - 161.0 + Double(activityValue)
//            showAlertWith(title: String(result))
        }
        
        @IBAction func clearDidTap(_ sender: Any) {
            clear ()
        }
        func  clear () {
            typeField.text = nil
            brandField.text = nil
            productionField.text = nil
            fuelField.text = nil
            priceField.text = nil
            pickerView.selectRow(0, inComponent: 0, animated: true)
            selectTypeBy(row: 0)
            selectBrandBy(row: 0)
            selectProductionBy(row: 0)
            selectFuelBy(row: 0)
        }
        func configureCountryCustomsClearance () {
            countryCustomsClearance.removeAllSegments()
            countryCustomsClearance.insertSegment(withTitle: "Ukraine", at: 0, animated: false)
            countryCustomsClearance.insertSegment(withTitle: "USA", at: 1, animated: false)
            countryCustomsClearance.selectedSegmentIndex = 0
            
            // Do any additional setup after loading the view.
        }
        func configureTextFields () {
            priceField.delegate = self
            priceField.keyboardType = .numberPad
        }
        func configuretypeField () {
            typePickerView.dataSource = self
            typePickerView.delegate = self
            typeField.inputView = typePickerView
            selectTypeBy(row: 0)
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
        func selectTypeBy(row: Int) {
            typeField.text = types[row].title
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
            case typePickerView:
                return types.count
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
            case typePickerView:
                return types[row].title
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
            selectTypeBy(row: row)
            selectBrandBy(row: row)
            selectProductionBy(row: row)
            selectFuelBy(row: row)
        }
    }
    
    
