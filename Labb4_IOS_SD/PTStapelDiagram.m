//
//  PTStapelDiagram.m
//  Labb4_IOS_SD
//
//  Created by lösen är 0000 on 2018-02-06.
//  Copyright © 2018 PT. All rights reserved.
//

#import "PTStapelDiagram.h"

@implementation PTStapelDiagram





// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // lägga till eller ta bort. diagramet anpassar sig
    NSArray *usersD = @[@{@"name":@"Kalle",
                          @"value":@3324},
                        @{@"name":@"Ping",
                          @"value":@1334},
                        @{@"name":@"Pelle",
                          @"value":@444},
                        @{@"name":@"Fisk",
                          @"value":@1941},
                        @{@"name":@"Micke",
                          @"value":@814},
                        @{@"name":@"Hesus",
                          @"value":@1844}
                       ];

    
    // can ha flera färger i arrayn. smidigt.
    NSArray *colors = @[[UIColor grayColor],[UIColor greenColor],[UIColor redColor],[UIColor blueColor]];
       CGMutablePathRef linePath;
   
    
    int highestNr = 0;
    for (int i =1; i<=usersD.count-1; i++) {
        if (usersD[i][@"value"] > usersD[highestNr][@"value"]) {
            highestNr = i;
        }
    }
    
    
    float heightScale = (rect.size.height-30) / [usersD[highestNr][@"value"] floatValue];
    float stapelThickness = rect.size.width * (1.0f/((float)usersD.count+1.0f));
    int userindex = 0;
    int colorIndex= 0;
    float stapelStart = stapelThickness / usersD.count;
    
    for (float i = stapelStart+(stapelThickness/2); i < rect.size.width; i=i+stapelStart+stapelThickness) {
        linePath = CGPathCreateMutable();
        [self drawText:i-10 yPosition:rect.size.height-20 canvasWidth:rect.size.width canvasHeight:rect.size.height users:usersD[userindex] color:colors[colorIndex]];
    
        CGPathMoveToPoint(linePath, NULL, i,rect.size.height-30);
        CGPathAddLineToPoint(linePath, NULL, i,rect.size.height-30-[usersD[userindex][@"value"] intValue]*heightScale);
        UIBezierPath *path2 = [UIBezierPath bezierPathWithCGPath:linePath];
        [colors[colorIndex] setStroke];
        path2.lineWidth = stapelThickness;
        [path2 stroke];
          userindex++;
        if (colorIndex==colors.count-1) {
            colorIndex=0;
        } else{
            colorIndex++;
        }
    }
    
    CGPathRelease(linePath);
}



- (void)drawText:(CGFloat)xPosition yPosition:(CGFloat)yPosition canvasWidth:(CGFloat)canvasWidth canvasHeight:(CGFloat)canvasHeight users:(NSDictionary*)user color:(UIColor*)color
{
  
    CGRect textRect = CGRectMake(xPosition, yPosition, canvasWidth, canvasHeight);
    NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
    textStyle.alignment = NSTextAlignmentLeft;
    
    NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Helvetica" size: 13], NSForegroundColorAttributeName: color, NSParagraphStyleAttributeName: textStyle};
    
    [user[@"name"] drawInRect: textRect withAttributes: textFontAttributes];
}





@end
