//
//  ThinWormHeadsDrawer.swift
//  Maps
//
//  Created by Mohaned Benmesken on 12/31/19.
//  Copyright © 2019 Mohaned Benmesken. All rights reserved.
//

import Foundation
import UIKit
public class ThinWormHeadsDrawer:AdvancedPageControlDrawerParent, AdvancedPageControlDraw {
    
    public func draw(_ rect: CGRect) {
        drawIndicators(rect)
        drawCurrentItem(rect)
    }
    
    func drawIndicators(_ rect: CGRect) {
        for i in 0..<numberOfPages{
            let centeredYPosition = getCenteredYPosition(rect, dotSize: height)
            let y =  rect.origin.y + centeredYPosition
            let x = getCenteredXPosition(rect,itemPos: CGFloat(i), dotSize: width,space: space, numberOfPages: numberOfPages)
            drawItem(CGRect(x: x, y:  y, width: CGFloat(width ), height: CGFloat(height))
                , raduis:radius,color: dotsColor)
        }
    }
    
    fileprivate func drawCurrentItem(_ rect: CGRect) {
        let currPosTranslate = currentItem - floor(currentItem)
        let isPassedHalf = (currPosTranslate) > 0.5
        let centeredYPosition = getCenteredYPosition(rect, dotSize: height)
        let curPos = isPassedHalf ? (((currPosTranslate) - 0.5) * 2) + (floor(currentItem)): floor(currentItem)
        let x = getCenteredXPosition(rect, itemPos: curPos, dotSize: width,space: space, numberOfPages: numberOfPages)
        let halfMovementRatio = !isPassedHalf ? currPosTranslate: 0.5 - ( currPosTranslate - 0.5 )
        let thinOffset = (halfMovementRatio * 16)
        let y = rect.origin.y + centeredYPosition + thinOffset / 2
        drawItem(CGRect(x: x, y:  y , width:  width  + ( halfMovementRatio * 2 * (space + width) ), height: height - thinOffset )
            , raduis:radius,color: indicatorColor)
        if halfMovementRatio != 0{
            let y = rect.origin.y + centeredYPosition
            drawItem(CGRect(x: x, y:  y , width:  width  , height: height  )
                , raduis:radius,color: indicatorColor)
            
            let curPos = !isPassedHalf ? ((currPosTranslate) * 2) + (floor(currentItem)) : ceil(currentItem)
           
            let x = getCenteredXPosition(rect, itemPos: curPos, dotSize: width,space: space, numberOfPages: numberOfPages)
            
            drawItem(CGRect(x: x, y:  y, width:  width  , height: height  )
                , raduis:radius,color: indicatorColor)
        }
    }
}
