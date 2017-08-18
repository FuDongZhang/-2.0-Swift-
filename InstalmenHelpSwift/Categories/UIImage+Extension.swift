//
//  UIImage+Extension.swift
//  InstalmenHelpSwift
//
//  Created by XQT-zfd on 2017/8/18.
//  Copyright © 2017年 XQT-zfd. All rights reserved.
//

import UIKit

import Accelerate
import CoreImage

// MARK: - 模糊的图片
extension UIImage {
    
    /**
     返回一张处理过的模糊图片 越大越模糊
     - parameter value: 模糊程度 0 ~ 无限大 （一开始误认为0~1）
     */
    public func blurImage(value: NSNumber) -> UIImage? {
        let context = CIContext(options: [kCIContextUseSoftwareRenderer: true])
        let ciImage = CoreImage.CIImage(image: self)
        guard let blurFilter = CIFilter(name: "CIGaussianBlur") else { return nil }
        blurFilter.setValue(ciImage, forKey: kCIInputImageKey)
        blurFilter.setValue(value, forKey: "inputRadius")
        guard let imageRef = context.createCGImage(blurFilter.outputImage!, from: (ciImage?.extent)!) else { return nil }
        return UIImage(cgImage: imageRef)
    }
    
    /**
     *   压缩图片，并返回压缩后的图片
     */
    public func imageCompress(targetWidth: CGFloat) -> UIImage? {
        let targetHeight = (targetWidth/self.size.width)*self.size.height
        let targetSize = CGSize(width: targetWidth, height: targetHeight)
        UIGraphicsBeginImageContext(size)
        self.draw(in:  CGRect(origin: CGPoint.zero, size: targetSize))
        guard let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return newImage
    }
}

// MARK: - 设置图片圆角和边框   以及 根据颜色返回一张图片
extension UIImage {
    
    /**
     根据颜色返回一张图片
     - parameter color: 颜色
     - parameter size: 大小
     */
    
    public static func imageWithColor(color: UIColor?, size: CGSize = CGSize.zero) -> UIImage?{
        var size = size
        if size == CGSize.zero {
            size = CGSize(width: SCREEN_WIDTH, height: 64)
        }
        var color = color
        if (color == nil) {
            color = UIColor.orange
        }
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.setFillColor((color?.cgColor)!)
        context.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    
    /**
     返回一张圆角图片
     -  parameter originImage: 原始图片
     -  parameter borderColor: 边框颜色
     -  parameter borderWidth: 边框大小
     */
    public static func circleImage(originImage: UIImage, borderColor: UIColor, borderWidth: CGFloat) -> UIImage? {
        //设置边框宽度
        let imageWH: CGFloat = originImage.size.width
        
        //计算外圆的尺寸
        let ovalWH:CGFloat = imageWH + 2 * borderWidth
        
        //开启上下文
        UIGraphicsBeginImageContextWithOptions(originImage.size, false, 0)
        
        //画一个大的圆形
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width:  ovalWH, height:  ovalWH))
        borderColor.set()
        path.fill()
        
        //设置裁剪区域
        let clipPath = UIBezierPath(ovalIn: CGRect(x: borderWidth, y: borderWidth, width:  ovalWH, height:  ovalWH))
        clipPath.addClip()
        
        //绘制图片
        originImage.draw(at: CGPoint(x: borderWidth, y: borderWidth))
        
        //从上下文中获取图片
        guard let resultImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() else { return  nil }
        
        //关闭上下文
        UIGraphicsEndImageContext()
        return resultImage
    }
    
    // 返回一张原始图片
    public static func mg_RenderModeOriginal(imageName: String) -> UIImage {
        let image = UIImage(named: imageName)
        return (image?.withRenderingMode(.alwaysOriginal))!
    }
}

// MARK: - 图片上绘制文字，返回一张带文字的图片
extension UIImage {
    /**
     图片上绘制文字，返回一张带文字的图片
     - parameter title: 要绘画到图片上的文字
     - parameter drawAtPoint: 绘画的点（位置）
     - parameter fontSize: 要绘画到图片上的文字的大小
     */
    func imageWithTitle(title: String, drawAtPoint: CGPoint, fontSize: CGFloat) -> UIImage? {
        //画布大小
        let size = CGSize(width: self.size.width, height: self.size.height)
        
        //创建一个基于位图的上下文
        UIGraphicsBeginImageContextWithOptions(size,false,0.0) //opaque:NO  scale:0.0
        
        self.draw(at: drawAtPoint)
        
        //文字居中显示在画布上
        let paragraphStyle: NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.lineBreakMode = .byCharWrapping //NSLineBreakByCharWrapping
        paragraphStyle.alignment = NSTextAlignment.center//文字居中
        
        //计算文字所占的size,文字居中显示在画布上
        let sizeText = title.boundingRect(with: self.size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: fontSize)] , context: nil);
        
        let width = self.size.width
        let height = self.size.height
        
        let rect = CGRect(x: (width-sizeText.width)/2, y: (height-sizeText.height)/2, width: sizeText.width, height: sizeText.height)
        
        //绘制文字
        title.draw(in: rect, withAttributes: [NSFontAttributeName: UIFont.systemFont(ofSize: fontSize),NSForegroundColorAttributeName: UIColor.white, NSParagraphStyleAttributeName:paragraphStyle])
        
        //返回绘制的新图形
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return newImage
    }
    
    /**
     图片上绘制logo，返回一张带logo的图片
     - parameter logo: 要绘画到图片上的logo
     */
    func imageWithLogo(logo: String) -> UIImage? {
        //画布大小
        let size = CGSize(width: self.size.width, height: self.size.height)
        
        //创建一个基于位图的上下文
        UIGraphicsBeginImageContextWithOptions(size,false,0.0) //opaque:NO  scale:0.0
        
        self.draw(in: CGRect(origin: .zero, size: size))
        let logoImage = UIImage(named: logo)
        
        // logo显示在画布上
        let width = logoImage!.size.width*0.2
        let height = logoImage!.size.height*0.2
        let margin: CGFloat = 3
        let x = self.size.width - width - margin
        let y = self.size.height - height - margin
        
        let rect = CGRect(x: x, y: y, width: width, height: height)
        
        //绘制文字
        logoImage?.draw(in: rect, blendMode: .normal, alpha: 1.0)
        
        //返回绘制的新图形
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return newImage
    }
    /**
     截屏功能
     - parameter view: 要截屏的View
     */
    func imageWithTitle(view: UIView,finished: @escaping (UIImage?)->()) {
        // 延时一秒执行截屏
        DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
            // 创建一个基于位图的上下文
            UIGraphicsBeginImageContextWithOptions(view.swiftSize,false,0.0)
            view.layer.render(in: UIGraphicsGetCurrentContext()!)
            // 返回绘制的新图形
            if let newImage = UIGraphicsGetImageFromCurrentImageContext() {
                UIGraphicsEndImageContext()
                // 保存到相册
                UIImageWriteToSavedPhotosAlbum(newImage, nil, nil, nil)
                finished(newImage)
                
            }
            finished(nil)
        }
    }
}

