//
//  AMKSuperView+Image.swift
//  iFactory
//
//  Created by Bruno Garelli on 9/27/16.
//  Copyright © 2016 Bruno Garelli. All rights reserved.
//
import AssociatedValues
import UIKit
extension AMKSuperView {
    internal func addIdleImageView(_ origin: CGPoint, size: CGSize, image: UIImage) {
        idleImageView = UIImageView.init(x: origin.x, y: origin.y, w: size.width, h: size.height, image: image)
        addSubview(idleImageView)
    }
    internal func settleImageView() {
        var size = idleImage.size
        var setX = /*centerX*/frame.size.width / 2 - size.width / 2 - 5
        var setY = /*centerY*/frame.size.height / 2 - size.height / 2
        if adoptImgSize {
            setX = 0
            setY = 0
        }
        !idlePositionAngle.isZero && !idlePositionRadius.isZero ? {
            setX += cos(idlePositionAngle.toRadians()) * idlePositionRadius
            setY -= sin(idlePositionAngle.toRadians()) * idlePositionRadius
            }() : {}()
        if idleImageScale != 0 {
            size = frame.getScaledSize(idleImageScale, overSize: idleImage.size)
        }
        addIdleImageView(CGPoint.init(x: setX, y: setY), size: size, image: idleImage)
        ///////////////////////////////////////////////////////////////////////////////
        let tSize = touchImage.size
        var setTX = frame.size.width / 2 - tSize.width / 2 - 5
        var setTY = frame.size.height / 2 - tSize.height / 2
        if adoptImgSize {
            setTX = 0
            setTY = 0
        }
        !touchPositionAngle.isZero && !touchPositionRadius.isZero ? {
            setTX += cos(touchPositionAngle.toRadians()) * touchPositionRadius
            setTY -= sin(touchPositionAngle.toRadians()) * touchPositionRadius
            }() : {}()
        addTouchImageView(CGPoint.init(x: setTX, y: setTY), size: tSize, image: touchImage)
    }
    internal func updateImageViewLocation(_ angle: CGFloat, radius: CGFloat, imageView: inout UIImageView, newSize: CGSize? = nil) {
        guard !imageView.isEmpty() && imageView.image != nil else {
            return
        }
        let image = imageView.image!
        var size = newSize != nil ? newSize! : image.size
        var setX = centerX - size.width / 2
        var setY = centerY - size.height / 2
        if !angle.isZero && !radius.isZero {
            setX += cos(angle.toRadians()) * radius
            setY -= sin(angle.toRadians()) * radius
        }
        if idleImageScale != 0 {
            size = frame.getScaledSize(idleImageScale, overSize: idleImage.size)
        }
        imageView.frame = CGRect.init(x: setX, y: setY, w: size.width, h: size.height)
    }
}
