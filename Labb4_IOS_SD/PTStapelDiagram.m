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
    
    
    self.heightScale = (rect.size.height-30) / [usersD[highestNr][@"value"] floatValue];
    self.stapelThickness = rect.size.width * (1.0f/((float)usersD.count+1.0f));
    self.userindex = 0;
    self.colorIndex= 0;
    self.stapelSpaceing = self.stapelThickness / ((float)usersD.count-1.0f);
  
    for (float i = self.stapelThickness/2; i < rect.size.width; i=i+self.stapelSpaceing+self.stapelThickness) {
        linePath = CGPathCreateMutable();
        [self drawText:i-10 yPosition:rect.size.height-20 canvasWidth:rect.size.width canvasHeight:rect.size.height users:usersD[self.userindex] color:colors[self.colorIndex]];
    
        CGPathMoveToPoint(linePath, NULL, i,rect.size.height-30);
        CGPathAddLineToPoint(linePath, NULL, i,rect.size.height-30-[usersD[self.userindex][@"value"] intValue]*self.heightScale);
        UIBezierPath *path2 = [UIBezierPath bezierPathWithCGPath:linePath];
        [colors[self.colorIndex] setStroke];
        path2.lineWidth = self.stapelThickness;
        [path2 stroke];
          self.userindex++;
        if (self.colorIndex==colors.count-1) {
            self.colorIndex=0;
        } else{
            self.colorIndex++;
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
