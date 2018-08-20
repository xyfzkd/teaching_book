## 6.Scatter plots

### 6.1 Basic scatter plots

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
ggplot(df, aes(x=wt, y=mpg)) + 
  geom_point(size=1.5)
```

### ![](/assets/6.1.Basic_scatterplot.png)

### 6.2 Add regression lines and change the point colors, shapes and sizes

```
ggplot(df, aes(x=wt, y=mpg, color=cyl, shape=cyl)) +
  geom_point(size=1.5) + 
  geom_smooth(method=lm, se=FALSE, fullrange=TRUE) +
  theme_classic()
```

![](/assets/6.2.Customized_scatterplot.png)

Reference: [http://www.sthda.com/english/wiki/ggplot2-scatter-plots-quick-start-guide-r-software-and-data-visualization](http://www.sthda.com/english/wiki/ggplot2-scatter-plots-quick-start-guide-r-software-and-data-visualization)

