//
//  ScheduleViewController.swift
//  RWDevCon
//
//  Created by Mic Pringle on 06/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class ScheduleViewController: UICollectionViewController {
  
  let sessions = Session.allSessions()
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    //return UIStatusBarStyle.LightContent
  return UIStatusBarStyle.Default
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let width = CGRectGetWidth(collectionView!.bounds)
    let layout = collectionViewLayout as! UICollectionViewFlowLayout
    layout.headerReferenceSize = CGSize(width:width, height: 180)
    layout.itemSize = CGSize(width: width, height: 62)
    
    collectionView!.contentInset =
        UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
  }
  
}

extension ScheduleViewController {
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return sessions.count
  }
  
  override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "ScheduleHeader", forIndexPath: indexPath) as! ScheduleHeaderView
    return header
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ScheduleCell", forIndexPath: indexPath) as! ScheduleCell
    cell.session = sessions[indexPath.item]
    return cell
  }
  
}