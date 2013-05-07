DTCubeView
==========

##Cube style switch view

![ScreenShot](https://raw.github.com/Darktt/DTCubeView/master/raw/image/ScreenShot.png)

Get to Start
==========

###Set two view into cubeView class:

``` objective-c
UIView *aView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
[view1 setBackgroundColor:[UIColor redColor]];
    
UIView *aView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
[view2 setBackgroundColor:[UIColor greenColor]];

DTCubeView *cubeView = [DTCubeView cubeViewWithFrame:CGRectMake(0, 0, 320, 44) forView1:aView1 andView2:aView2];

[self.view addSubview:cubeView];

[aView1 release];
[aView2 release];
```

###Slide cubeView:
``` objective-c
// Slide UP
[cubeView slideUP];

// Slide Down
[cubeView slideDown];
```

###Set new view into cubeView:
``` objective-c
// At view1
[cubeView setView1:aNewView];

// At view2
[cubeView setView2:aNewView];
```