//
//  OnboardingViewController.swift
//  Asses Me
//
//  Created by Fahmi Dzulqarnain on 27/04/21.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var indexPaths: IndexPath!
    
    var slides = [OnboardingSlide]()
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                btnNext.setTitle("Understandable, Lets Go!", for: .normal)
            } else {
                btnNext.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            OnboardingSlide(title: "Helps Learning Journey", description: "Discover your self-efficacy in every challenge", image: UIImage(named: "onboardingIllustration1")!),
            OnboardingSlide(title: "Smart Assesment", description: "Assessing your self-efficacy level at the academy in one single tap.", image: UIImage(named: "onboardingIllustration2")!),
            OnboardingSlide(title: "Result Feedback", description: "Improving your performance based on your self-efficacy level with our best recommendation tips!", image: UIImage(named: "onboardingIllustration3")!)
        ]
        
        pageControl.numberOfPages = slides.count
    }
    
    @IBAction func btnNext_Click(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            
            let viewController = storyboard.instantiateViewController(withIdentifier: "HomeView") as! MainPageViewController;
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        } else {
            currentPage += 1
            collectionView.isPagingEnabled = false
            collectionView.scrollToItem(at: IndexPath(item: currentPage, section: 0), at: .centeredHorizontally, animated: true)
            collectionView.isPagingEnabled = true
        }
    }
}

extension OnboardingViewController: UICollectionViewDelegate {
    
}

extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        indexPaths = indexPath
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
}
