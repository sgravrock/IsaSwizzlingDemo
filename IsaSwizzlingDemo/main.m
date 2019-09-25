#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface ColorChanger: NSObject
- (NSString *)color;
- (void)changeColor;
@end

@interface Red: NSObject; @end
@interface Green: NSObject; @end


@implementation ColorChanger

+ (instancetype)alloc { return (ColorChanger *)[Red alloc]; }
- (NSString *)color { return nil;}
- (void)changeColor {}

@end


@implementation Red

- (NSString *)color { return @"red"; }
- (void)changeColor { object_setClass(self, [Green class]); }

@end


@implementation Green

- (NSString *)color { return @"green"; }
- (void)changeColor { object_setClass(self, [Red class]); }

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ColorChanger *changer = [[ColorChanger alloc] init];
        printf("It's %s\n", [[changer color] cStringUsingEncoding:NSUTF8StringEncoding]);
        [changer changeColor];
        printf("It's %s\n", [[changer color] cStringUsingEncoding:NSUTF8StringEncoding]);
        [changer changeColor];
        printf("It's %s\n", [[changer color] cStringUsingEncoding:NSUTF8StringEncoding]);
    }
    return 0;
}
