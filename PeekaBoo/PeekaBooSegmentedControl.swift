
//MARK:- Frameworks
import UIKit


//MARK:- PeekaBoo Segmented Control Class
@IBDesignable class PeekaBooSegmentedControl: UIControl {
    
    
    //MARK:- Properties
    // Property to hold all of the buttons
    private var buttonsArray = [UIButton]()
    
    // Property for the button colours
    private let colors = [PeekaBoo.colors[.red], PeekaBoo.colors[.green], PeekaBoo.colors[.blue], PeekaBoo.colors[.yellow], PeekaBoo.colors[.purple]]
    
    // Property for the selector
    private var selector: UIView!
    
    // Property that defines a stack view
    private var stackView: UIStackView!
    
    // Property for the index of the selected button
    private var _selectedButtonIndex: Int = 0
    var selectedButtonIndex: Int {
        set {
            if newValue >= 0 && newValue < buttonsArray.count {
                _selectedButtonIndex = newValue
            }
        }
        get {
            return _selectedButtonIndex
        }
    }
    
    // Property to change the border width
    @IBInspectable var isControlVertical: Bool = false
   
    // Property to change the image of the buttons
    @IBInspectable var buttonImage: UIImage? = nil
    
    // Property to change the border width
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    // Property to change the border color
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    // Property to add the titles of the buttons
    @IBInspectable var commaDelimitedButtonTitles: String = ""
    
    // Property to change the unselected button title color
    @IBInspectable var unselectedButtonTitleColor: UIColor = .clear
    
    // Property to change the selected button title color
    @IBInspectable var selectedButtonTitleColor: UIColor = .clear
    
    // Property to change the selector color
    @IBInspectable var selectorColor: UIColor = .clear
    
    // Property to change the selector color
    @IBInspectable var selectorBorderWidth: CGFloat = 0.0
    
    // Property to change the selector color
    @IBInspectable var selectorCornerRadius: CGFloat = 0.0
    
    // Property to change the selector color
    @IBInspectable var selectorBorderColor: UIColor = .clear
    

    // MARK:- Methods
    // Method to update the control
    func updateControl() {
        
        buttonsArray.removeAll()
       
        self.subviews.forEach { $0.removeFromSuperview() }
        
        let buttons = commaDelimitedButtonTitles.components(separatedBy: ",")
        
        for (index, _ ) in buttons.enumerated() {
            
            let button = UIButton(type: .system)
            
            button.frame = CGRect(x: 0, y: index*50, width: 50, height: 50)

            if index < colors.count {
                 button.tintColor = colors[index]
            }
            if let buttonImage = buttonImage {
                button.setImage(buttonImage, for: .normal)
            }
            button.layer.cornerRadius = button.frame.height / 2
            button.addTarget(self, action: #selector(buttonSelected(button:)), for: .touchUpInside)
            button.imageView?.contentMode = .scaleAspectFit
            buttonsArray.append(button)
        }
     
        stackView = UIStackView(arrangedSubviews: buttonsArray)
        stackView.axis = isControlVertical ? .vertical : .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        let selectorWidth = isControlVertical ? frame.width : (frame.width /  CGFloat(buttonsArray.count))
        let selectorHeight = isControlVertical ? (frame.height /  CGFloat(buttonsArray.count)) : frame.height
        selector = UIView(frame: CGRect(origin: buttonsArray[_selectedButtonIndex].frame.origin, size: CGSize(width: selectorWidth, height: selectorHeight)))
        selector.layer.cornerRadius = selectorCornerRadius
        selector.layer.borderWidth = selectorBorderWidth
        selector.layer.borderColor = selectorBorderColor.cgColor
        selector.backgroundColor = selectorColor
        self.addSubview(selector)
    }
    
    // Method to change the position of the selector
    func moveSelector(to index: Int) {
        buttonSelected(button: buttonsArray[index])
    }
    
    // Method to return the number of buttons in the control
    func numberOfSegments() -> Int {
        return buttonsArray.count
    }
    
    // Method to handle button presses
    @objc func buttonSelected(button: UIButton) {
        for (index, element) in buttonsArray.enumerated() {
            if element == button {
                _selectedButtonIndex = index
                UIView.animate(withDuration: 0.3, animations: {
                    self.selector.frame.origin = button.frame.origin
                })
            }
        }
        sendActions(for: .valueChanged)
    }
    
    // Method to disable the buttons in the control
    func disableControl(_ isEnabled: Bool) {
        for button in buttonsArray {
            button.isEnabled = isEnabled
        }
        if !isEnabled {
            selector.layer.borderColor = UIColor.gray.cgColor
        } else {
            selector.layer.borderColor = selectorBorderColor.cgColor
        }
    }
    
    // Method to change the color of the buttons and selector
    func changeColor(to color: UIColor) {
        buttonsArray.forEach {$0.tintColor = color }
        selector.layer.borderColor = color.cgColor
    }
}
