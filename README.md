# DCTypography

DCTypography**DCTypography** is a simple and user-friendly tool designed for reconciliation of developers and designers :)

With DCTypography you can create a typographic styles when it's convenient to you, add them to the shared storage and use when needed. You need just specify typographic parameters.

Example 1:
```objc
DCTypographyStyle *style = [DCTypographyStyle styleWithName:@"style"];
[style setFont:[UIFont fontWithName:@"HelvetivaNeue" size:24]];
[style setForegroundColor:[UIColor redColor]];
[style setBackgroundColor:[UIColor yellowColor]];
[style setTrackingValue:10 fromPhotoshop:NO];
[style setLinespacing:24];
[style setAlignment:NSTextAlignmentCenter];
[DCTypography addStyle:style];
...
[self.label setAttributedText:[DCTypography attributedStringWithContents:@"Lorem Ipsum dolOn Sit ameT" styleName:@"style"]];
```
Result 1:

![Result 1](http://take.ms/D8cGr)

Example 2:
```objc
DCTypographyStyle *style1 = [DCTypographyStyle styleWithName:@"style1"];
[style1 setFont:[UIFont systemFontOfSize:10 weight:UIFontWeightBlack]];
[style1 setForegroundColor:[UIColor blueColor]];
[style1 setBackgroundColor:[UIColor greenColor]];
[DCTypography addStyle:style1];
...
[self.lalbel setAttributedText:[DCTypography attributedStringWithContents:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla leo neque, lacinia id diam at, porta vestibulum ante. Nulla ut risus rutrum neque bibendum porta. Nulla cursus, mi quis consequat rhoncus, nulla dolor maximus lacus, ut egestas leo libero dictum lacus. In purus elit, tincidunt rutrum nisi sit amet, dictum posuere neque." styleName:@"style1"]];
```
Result 2:

![Result 2](http://take.ms/VXADZ)
