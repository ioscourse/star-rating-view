import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var startRatingWithFilledStyle: TegStarRatingView!
  
  @IBOutlet weak var starRatingViewOne: TegStarRatingView!

  @IBOutlet weak var starRatingViewHalf: TegStarRatingView!
  
  @IBOutlet weak var starRatingViewPrecise: TegStarRatingView!
  
  @IBOutlet weak var ratingSlider: UISlider!
  @IBOutlet weak var ratingLabel: UILabel!
  private let startRating:Float = 3.7
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    ratingSlider.value = startRating
    
    startRatingWithFilledStyle.backgroundColor = nil
    starRatingViewOne.backgroundColor = nil
    starRatingViewHalf.backgroundColor = nil
    starRatingViewPrecise.backgroundColor = nil
    
    startRatingWithFilledStyle.settings.starCharacterEmpty = "★"
    startRatingWithFilledStyle.settings.starColorEmpty = UIColor.lightGrayColor()
    startRatingWithFilledStyle.settings.starColorFilled = UIColor.blackColor()
    startRatingWithFilledStyle.settings.correctFillLevelForPreciseMode = false

    starRatingViewOne.settings.starFillMode = TegStarFillMode.Full
    starRatingViewHalf.settings.starFillMode = TegStarFillMode.Half
    starRatingViewPrecise.settings.starFillMode = TegStarFillMode.Precise
    
    updateRating()
  }
  
  private func updateLabel() {
    
  }
  
  @IBAction func onSliderChanged(sender: AnyObject) {
    updateRating()
  }
  
  private func updateRating() {
    let value = Double(ratingSlider.value)
    startRatingWithFilledStyle.show(rating: value)
    starRatingViewOne.show(rating: value)
    starRatingViewHalf.show(rating: value, text: "(132)")
    starRatingViewPrecise.show(rating: value)
    
    self.ratingLabel.text = ViewController.formatValue(value)
  }
  
  private class func formatValue(value: Double) -> String {
    return String(format: "%.2f", value)
  }
}

