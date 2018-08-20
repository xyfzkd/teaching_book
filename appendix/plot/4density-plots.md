## 4.Density plots

### 4.1 Basic density

```
head(df2)
```

```
###   sex weight
### 1   F     49
### 2   F     56
### 3   F     60
### 4   F     43
### 5   F     57
### 6   F     58
```

```
ggplot(df2, aes(x=weight)) + 
  geom_density()
```

### ![](/assets/4.1.Basic_densityplot.png)

### 4.2 Add mean line on a density plot

```
ggplot(df2, aes(x=weight)) +
  geom_density() +
  geom_vline(aes(xintercept=mean(weight)), color="black", linetype="dashed", size=0.5)
```

### ![](/assets/4.2.Add_meanline_densityplot.png)

### 4.3 Change density plot fill colors

```
##Use the plyr package plyr to calculate the average weight of each group :
mu <- ddply(df2, "sex", summarise, grp.mean=mean(weight))
head(mu)
```

```
###   sex grp.mean
### 1   F    54.70
### 2   M    65.36
```

```
##draw the plot
```

#### 4.3.1 Change fill colors

```
ggplot(df2, aes(x=weight, fill=sex)) +
  geom_density(alpha=0.7)+
  geom_vline(data=mu, aes(xintercept=grp.mean, color=sex), linetype="dashed")+
  labs(title="Weight density curve",x="Weight(kg)", y = "Density") + 
  scale_color_brewer(palette="Paired") +
  scale_fill_brewer(palette="Blues") +
  theme_classic()
```

![](/assets/4.3.1.Customized_histogramplot1.png)

#### 4.3.2 Change line colors

```
ggplot(df2, aes(x=weight, color=sex)) +
  geom_density()+
  geom_vline(data=mu, aes(xintercept=grp.mean, color=sex), linetype="dashed")+
  labs(title="Weight density curve",x="Weight(kg)", y = "Density") + 
  scale_color_brewer(palette="Paired") +
  theme_classic()
```

#### ![](/assets/4.3.2.Customized_histogramplot2.png)

#### 4.3.3 Combine histogram and density plots

```
ggplot(df2, aes(x=weight, color=sex, fill=sex)) + 
  geom_histogram(binwidth=1, aes(y=..density..), alpha=0.5, position="identity") +
  geom_density(alpha=.2) +
  labs(title="Weight density curve",x="Weight(kg)", y = "Density") + 
  scale_color_brewer(palette="Paired") +
  scale_fill_brewer(palette="Blues") +
  theme_classic()
```

![](/assets/4.3.3.Customized_histogramplot3.png)



Reference: [http://www.sthda.com/english/wiki/ggplot2-density-plot-quick-start-guide-r-software-and-data-visualization](http://www.sthda.com/english/wiki/ggplot2-density-plot-quick-start-guide-r-software-and-data-visualization)

