import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var displayLabel: UILabel!
  var isFinishedTypingNumber: Bool = true
  
  var displayValue: Double {
    get {
      guard let number = Double(displayLabel.text!) else {
        fatalError("Cannot convert display label text to a Double.")
      }
      return number
    }
    set {
      displayLabel.text = String(newValue)
    }
  }

  @IBAction func calcButtonPressed(_ sender: UIButton) {
    isFinishedTypingNumber = true
    
    guard let number = Double(displayLabel.text!) else {
      fatalError("Cannot convert display label text to a Double.")
    }
    
    if let calcMethod = sender.currentTitle {
      switch calcMethod {
      case "+/-":
        displayValue = displayValue * -1
      case "AC":
        displayLabel.text = "0"
      case "%":
        displayValue = displayValue / 100
      case "=":
        break
      default:
        break
      }
    }
  }

  @IBAction func numButtonPressed(_ sender: UIButton) {
    if let numValue = sender.currentTitle {
      if isFinishedTypingNumber {
        displayLabel.text = numValue
        isFinishedTypingNumber = false
      } else {
        if numValue == "." {
          let isInt = floor(displayValue) == displayValue
          if !isInt {
            return
          }
        }
        displayLabel.text = displayLabel.text! + numValue
      }
    }
  }
}
