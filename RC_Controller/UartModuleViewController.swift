
import UIKit
import CoreBluetooth

class UartModuleViewController: UIViewController, CBPeripheralManagerDelegate, UITextViewDelegate, UITextFieldDelegate {
    
    //UI

// varible to hold current user input amounts
    var turnVal = 7
    @IBOutlet weak var scrollView: UIScrollView!
    //initializing of outputs
    @IBOutlet weak var speed: UILabel!
    
    @IBOutlet weak var gearing: UILabel!
    @IBOutlet weak var turn: UILabel!
    //    //Data
    var peripheralManager: CBPeripheralManager?
    var peripheral: CBPeripheral!
    private var consoleAsciiText:NSAttributedString? = NSAttributedString(string: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"Back", style:.plain, target:nil, action:nil)
        //Create and start the peripheral manager
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
        //-Notification for updating the text view with incoming text
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
        
    }
 
//all turn controlling functions
    @IBAction func returnForward(_ sender: UIButton) {

        writeValue(data: "7")
        turnVal  = 7
        turn.text = "7"
    }
    @IBAction func left(_ sender: UIButton) {
        if(turnVal > 5){
            turnVal = turnVal - 1

            writeValue(data: String(turnVal))
            turn.text = String(turnVal)
        }
    }
    @IBAction func right(_ sender: UIButton) {
        if(turnVal < 9){
            turnVal = turnVal + 1

            writeValue(data: String(turnVal))
            turn.text = String(turnVal)
        }
    }
 //-------------------------------------------------
    //all motor control functions
    @IBAction func stopit(_ sender: UIButton) {
        writeValue(data: "S")
    speed.text = "Stopped"
    }
    
    @IBAction func Forward(_ sender: UIButton) {
        writeValue(data: "F")
        speed.text = "Forward"
    }
    
    @IBAction func Reverse(_ sender: UIButton) {
        writeValue(data: "B")
       speed.text = "Backward"
    }

    @IBAction func set4(_ sender: UIButton) {
        writeValue(data: "4")
        gearing.text = "4"
    }
    @IBAction func set3(_ sender: UIButton) {
        writeValue(data: "3")
        gearing.text = "3"
    }

    @IBAction func set2(_ sender: UIButton) {
        writeValue(data: "2")
        gearing.text = "2"
    }
    @IBAction func set1(_ sender: UIButton) {
        writeValue(data: "1")
        gearing.text = "1"
    }


    
    
    // Write functions
    func writeValue(data: String){
        let valueString = (data as NSString).data(using: String.Encoding.utf8.rawValue)
        //change the "data" to valueString
        if let blePeripheral = blePeripheral{
            if let txCharacteristic = txCharacteristic {
                blePeripheral.writeValue(valueString!, for: txCharacteristic, type: CBCharacteristicWriteType.withResponse)
                
            }
        }
    }

    
    func writeCharacteristic(val: Int8){
        var val = val
        let ns = NSData(bytes: &val, length: MemoryLayout<Int8>.size)
        blePeripheral!.writeValue(ns as Data, for: txCharacteristic!, type: CBCharacteristicWriteType.withResponse)
    }
    
    
    
    //MARK: UITextViewDelegate methods
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x:0, y:250), animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x:0, y:0), animated: true)
    }
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if peripheral.state == .poweredOn {
            return
        }
        print("Peripheral manager is running")
    }
    
    //Check when someone subscribe to our characteristic, start sending the data
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didSubscribeTo characteristic: CBCharacteristic) {
        print("Device subscribe to characteristic")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        if let error = error {
            print("\(error)")
            return
        }
    }
}

