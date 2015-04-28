# DKTypeWritterLabel
A UILabel subclass with a TypeWritter like animation

## Add the TypeWritter animation

To trigger the animation, you just use a method from this class : 
```
- (void)setText:(NSString *)text
       animated:(BOOL)animated
withAnimationSpeed:(DKTypewritterLabelAnimationSpeed)animationSpeed
     completion:(void (^)())completion;
```
This will trigger an animated text setting with a specified speed and completion block (animated does nothing at this point).

NOTE : You can still use this subclass like a ordinary label.

## DKTypewritterLabelAnimationSpeed

The speed of the animation is represented by a enum which links to the MACRO constants in the implementation file. Feel free to change the values to your liking.
```
typedef NS_ENUM(NSInteger, DKTypewritterLabelAnimationSpeed) {
    DKTypewritterLabelAnimationSpeedVerySlow,
    DKTypewritterLabelAnimationSpeedSlow,
    DKTypewritterLabelAnimationSpeedNormal,
    DKTypewritterLabelAnimationSpeedFast,
    DKTypewritterLabelAnimationSpeedVeryFast
};
```
