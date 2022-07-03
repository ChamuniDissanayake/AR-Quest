//
//  OnboardingViewController.swift
//  AR-Quest
//
//  Created by Madushan Senavirathna on 6/12/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageController: UIPageControl!
    
    var slide: [OnboardingSlide] = []
    var currntPage = 0 {
        didSet{
            pageController.currentPage = currntPage
            if currntPage == slide.count - 1 {
                nextButton.setTitle("Get Start", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear
        
        slide = [
            OnboardingSlide(title: "Buy Products ", description: "Buy your expected products from your phone", image: UIImage(named: "Tripamico")!),
            OnboardingSlide(title: "Discover Products ", description: "Get real world experience in your camera", image: UIImage(named: "Exploringamico")!),
            OnboardingSlide(title: "Relax Your Mind ", description: "With next leval AR Experience", image: UIImage(named: "SharingIdeasamico")!)
        ]
    }
    
    @IBAction func nextButtonClick(_ sender: Any) {
        pageController.currentPage = currntPage
        if currntPage == slide.count - 1 {
            let viewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "ViewController")
            self.navigationController?.pushViewController(viewController, animated: true)
        } else {
            currntPage += 1
            let indexPath = IndexPath(item: currntPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
}
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slide.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slide[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currntPage = Int(scrollView.contentOffset.x / width)
    }
    
}
