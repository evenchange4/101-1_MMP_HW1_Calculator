# Obj-C iOS Calculator
The Homework 1 my first iOS app from [NTU101-1 MMP Course](http://ntumpp.sodas.tw/)

by NTU Michael Hsu

## This homework's importance
### some variable type
1. ``NSString是self.display.text``
2. ``NSNumber *Memory; ``
3. ``NSString *Operator;``
4. ``double result;``

### NSNumber to double
  
```
[self.Memory doubleValue] 
```
### double to NSString
	
```
[NSString stringWithFormat:@"%f", result]
```

### NSString to double

```
[self.display.text doubleValue]
```
### NNSting to NSNumber

```
_Memory = [NSNumber numberWithDouble:[self.display.text doubleValue]];    
```
### String to NSString
```
self.display.text = @"0";
```
### NSLoog

```
NSLog(@"%f",result); //double
NSLog(@"%@", self.Memory);  //NSNumber
```

## Conclusions and Tips to follow
1. ``@(…)`` is “boxed literal”   //Object
2. 字串比較，不能用switch，用``[self.Operator isEqualToString:@"+"]``
3. ``UIButton`` use ``sender.currentTitle``

## Other Resources
1. Stanford University Developing Apps for iOS on iTunes U