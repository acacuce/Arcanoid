//
//  GameScene.m
//  Arcanoid
//
//  Created by Никита Солдатов on 20.04.16.
//  Copyright (c) 2016 Никита Солдатов. All rights reserved.
//

#import "GameScene.h"
@interface GameScene () {
    SKShapeNode *_circle;
    SKSpriteNode *_rocket;
    CGPoint _pointOfRocket;
}
@end
@implementation GameScene

-(void)didMoveToView:(SKView *)view
{
    self.backgroundColor = [SKColor orangeColor];
    [self configureGameField];
}

-(void)update:(NSTimeInterval)currentTime {
    _rocket.position = _pointOfRocket;
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        _pointOfRocket = CGPointMake([touch locationInNode:self].x, 2);
    }
}

- (void)configureGameField
{
    self.physicsWorld.gravity = CGVectorMake(0, 0);
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    self.physicsBody.dynamic = NO;


    _circle = [SKShapeNode shapeNodeWithCircleOfRadius:10];
    _circle.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    _circle.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:10];
    _circle.fillColor = [UIColor blackColor];
    _circle.physicsBody.dynamic = YES;
    _circle.physicsBody.restitution = 1;
    _circle.physicsBody.affectedByGravity = YES;
    [self addChild:_circle];
    _rocket = [SKSpriteNode spriteNodeWithColor:[SKColor blackColor] size:CGSizeMake(self.frame.size.width*0.2, 6)];
    _rocket.position = CGPointMake(self.frame.size.width * 0.5, 2);
    _rocket.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_rocket.frame.size];
    _rocket.physicsBody.dynamic = NO;
    _rocket.physicsBody.density = 2;
    _rocket.physicsBody.affectedByGravity = YES;
    [self addChild:_rocket];
    [_circle.physicsBody applyImpulse:CGVectorMake(10, 6)];
    
}

@end
