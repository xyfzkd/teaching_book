## 5.Dot plots

### 5.1 Basic dot plots

```
df$cyl <- as.factor(df$cyl)
head(df)
```

```
###                    mpg cyl    wt
### Mazda RX4         21.0   6 2.620
### Mazda RX4 Wag     21.0   6 2.875
### Datsun 710        22.8   4 2.320
### Hornet 4 Drive    21.4   6 3.215
### Hornet Sportabout 18.7   8 3.440
### Valiant           18.1   6 3.460
```

```
ggplot(df, aes(x=cyl, y=mpg)) + 
  geom_dotplot(binaxis='y', stackdir='center', binwidth=1)
```

### ![](/assets/5.1.Basic_dotplot.png)

### 5.2 Add mean and standard deviation

```
ggplot(df, aes(x=cyl, y=mpg)) + 
  geom_dotplot(binaxis='y', stackdir='center', binwidth=1) + 
  stat_summary(fun.data="mean_sdl", fun.args = list(mult=1), geom="crossbar", width=0.5)
##or
ggplot(df, aes(x=cyl, y=mpg)) + 
  geom_dotplot(binaxis='y', stackdir='center', binwidth=1) + 
  stat_summary(fun.data="mean_sdl", fun.args = list(mult=1), geom="pointrange", color="red")
```

### ![](/assets/5.2.Add_mean&sd1_dotplot.png)![](/assets/5.2.Add_mean&sd2_dotplot.png)

### 5.3 Change dot colors

```
ggplot(df, aes(x=cyl, y=mpg, fill=cyl, shape=cyl)) + 
  geom_dotplot(binaxis='y', stackdir='center', binwidth=1, dotsize=0.8) + 
  labs(title="Plot of mpg per cyl",x="Cyl", y = "Mpg") +
  #stat_summary(fun.data="mean_sdl", fun.args = list(mult=1), geom="crossbar", width=0.5) +
  scale_fill_brewer(palette="Blues") +
  #scale_color_brewer(palette="Blues") +
  theme_classic()
```

### ![](/assets/5.3.Customized_dotplot.png)

### 5.4 Change dot colors, shapes and align types

```
ggplot(df, aes(x=cyl, y=mpg, color=cyl, shape=cyl)) + 
  geom_jitter(position=position_jitter(0.1), cex=2)+
  labs(title="Plot of mpg per cyl",x="Cyl", y = "Mpg") + 
  scale_color_brewer(palette="Blues") + 
  theme_classic()
```

![](/assets/5.4.Customized_dotplot.png)

Reference: [http://www.sthda.com/english/wiki/ggplot2-dot-plot-quick-start-guide-r-software-and-data-visualization](http://www.sthda.com/english/wiki/ggplot2-dot-plot-quick-start-guide-r-software-and-data-visualization)

