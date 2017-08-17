//
//  Define.swift
//  InstalmenHelpSwift
//
//  Created by XQT-zfd on 2017/8/15.
//  Copyright © 2017年 XQT-zfd. All rights reserved.
//

import Foundation
import UIKit

/**
 * 屏幕设置系列
 */
let SCREEN_WIDTH = UIScreen.main.bounds.size.width

let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

let SCREEN_BOUNDS = UIScreen.main.bounds

let TABBAR_HEIGHT : CGFloat = 49.0

let NAVI_HEIGHT : CGFloat = 64.0

let SCREEN_PRESENT : CGFloat = SCREEN_WIDTH / 375.0

func normalRGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor{
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor (red: r, green: g, blue: b, alpha: a)
}

func colorWithRGB (hex:String) -> UIColor {
    
    var cString = hex.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    if (cString.hasPrefix("#")) {
        cString = (cString as NSString).substring(from: 1)
    }
    let rString = (cString as NSString).substring(to: 2)
    let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
    let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
    
    var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
    Scanner(string: rString).scanHexInt32(&r)
    Scanner(string: gString).scanHexInt32(&g)
    Scanner(string: bString).scanHexInt32(&b)
    return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
}

/**
 *  颜色
 */
let white_Color = RGBA(r: 0.97, g: 0.97, b: 0.97, a: 1.00)
let disabledWhite_Color = RGBA(r: 0.97, g: 0.97, b: 0.97, a: 0.30)
let green_Color = RGBA(r: 0.15, g: 0.67, b: 0.16, a: 1.00)
let disabledGreen_Color = RGBA(r: 0.65, g: 0.87, b: 0.65, a: 1.00)
let red_Color = RGBA(r: 0.89, g: 0.27, b: 0.27, a: 1.00)
let splitLine_Color = RGBA(r: 0.78, g: 0.78, b: 0.80, a: 1.00)
let commonBg_Color = RGBA(r: 0.92, g: 0.92, b: 0.92, a: 1.00)
let section_Color = RGBA(r: 0.94, g: 0.94, b: 0.96, a: 1.00)
let navBarBg_Color = normalRGBA(r: 20, g: 20, b: 20, a: 0.9)
let defaultPurple_Color = colorWithRGB(hex: "9C74E4")
let clickButton_Color = colorWithRGB(hex: "FF4E01")

/**
 * 通知常量
 */
let bNoteNewsSendAgain = "NOTENEWSSENDAGAIN"




/**
 * 判断手机的型号
 */
/*判断iphone4*/
let iPhone4: Bool! = (UIScreen.main.bounds.size.height == 480) ? true : false
/*判断iphone5、5c、5s*/
let iPhone5: Bool! = (UIScreen.main.bounds.size.height == 568) ? true : false
/*判断iphone6、6s、7*/
let iPhone6: Bool! = (UIScreen.main.bounds.size.height == 667) ? true : false
/*判断iphone6p、7p*/
let iPhone6p:Bool! = (UIScreen.main.bounds.size.height >  667) ? true : false
/*判断iPad*/
let iPad: Bool! = (UIDevice.current.userInterfaceIdiom == .pad) ? true : false








