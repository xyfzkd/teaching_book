## 9.Heatmaps

### 9.1.Draw the heatmap with the gplots package, heatmap.2 function

```
head(dm)
```

```
###       Control1      Tumor2 Control3     Tumor4 Control5     Tumor1
### Gene1 3.646058 -0.98990248 2.210404 -0.2063050 2.859744  1.3304284
### Gene2 4.271172 -1.16217765 2.734119 -2.4782173 3.752013  0.0255639
### Gene3 3.530448  1.11451101 1.635485 -0.4241215 3.701427  1.2263312
### Gene4 3.061122 -1.18791027 4.331229  0.8733314 2.349352  0.4825479
### Gene5 1.956817  0.25431042 1.984438  1.2713845 1.685917  1.4554739
### Gene6 2.000919  0.06015972 4.480901  0.9780682 3.063475 -0.4222994
###       Control2     Tumor3 Control4     Tumor5
### Gene1 2.690376  0.6135943 2.470413  0.5158246
### Gene2 4.471795  1.6516242 2.735508 -0.5837784
### Gene3 3.588787 -0.6349656 1.999844  0.1417349
### Gene4 1.854433 -1.2237684 1.154377 -0.9301261
### Gene5 2.445830  0.3316909 2.715163  0.1866400
### Gene6 3.585366  1.0689000 2.563422  1.3465830
```

```
##to draw high expression value in red, we use colorRampPalette instead of redblue in heatmap.2
##colorRampPalette is a function in the RColorBrewer package
cr <- colorRampPalette(c("blue","white","red"))
heatmap.2(dm,
          scale="row", #scale the rows, scale each gene's expression value
          key=T, keysize=1.1, 
          cexCol=0.9,cexRow=0.8,
          col=cr(1000),
          ColSideColors=c(rep(c("blue","red"),5)),
          density.info="none",trace="none",
          #dendrogram='none', #if you want to remove dendrogram 
          Colv = T,Rowv = T #clusters by both row and col)
```

### ![](/assets/9.1.Customized_heatmap.png)

### 9.2.Draw the heatmap with the pheatmap package, pheatmap function

```
##add column and row annotations
annotation_col = data.frame(CellType = factor(rep(c("Control", "Tumor"), 5)), Time = 1:5)
rownames(annotation_col) = colnames(dm)
annotation_row = data.frame(GeneClass = factor(rep(c("Path1", "Path2", "Path3"), c(10, 4, 6))))
rownames(annotation_row) = paste("Gene", 1:20, sep = "")
##set colors of each group
ann_colors = list(Time = c("white", "springgreen4"), 
                  CellType = c(Control = "#7FBC41", Tumor = "#DE77AE"),
                  GeneClass = c(Path1 = "#807DBA", Path2 = "#9E9AC8", Path3 = "#BCBDDC"))
##draw the heatmap
pheatmap(dm, 
         cutree_col = 2, cutree_row = 3, #break up the heatmap by clusters you define
         cluster_rows=TRUE, show_rownames=TRUE, cluster_cols=TRUE, #by default, pheatmap clusters by both row and col
         annotation_col = annotation_col, annotation_row = annotation_row,annotation_colors = ann_colors)
```

### ![](/assets/9.2.Customized_heatmap.png)

### 9.3.Draw the heatmap with the ggplot2 package

```
##9.3.1.cluster by row and col
##cluster and re-order rows
rowclust = hclust(dist(dm))
reordered = dm[rowclust$order,]
##cluster and re-order columns
colclust = hclust(dist(t(dm)))
##9.3.2.scale each row value in [0,1]
dm.reordered = reordered[, colclust$order]
dm.reordered=apply(dm.reordered,1,rescale) #rescale is a function in the scales package
dm.reordered=t(dm.reordered) #transposed matrix
##9.3.3.save col and row names before changing the matrix format
col_name=colnames(dm.reordered) 
row_name=rownames(dm.reordered) 
##9.3.4.change data format for geom_title 
colnames(dm.reordered)=1:ncol(dm.reordered)
rownames(dm.reordered)=1:nrow(dm.reordered)
dm.reordered=melt(dm.reordered) #melt is a function in the reshape2 package
head(dm.reordered)
##9.3.5.draw the heatmap
ggplot(dm.reordered, aes(Var2, Var1)) + 
  geom_tile(aes(fill = value), color = "white") + 
  scale_fill_gradient(low = "white", high = "steelblue") +
  theme_grey(base_size = 10) + 
  labs(x = "", y = "") + 
  scale_x_continuous(expand = c(0, 0),labels=col_name,breaks=1:length(col_name)) + 
  scale_y_continuous(expand = c(0, 0),labels=row_name,breaks=1:length(row_name))
```

![](/assets/9.3.Customized_heatmap.png)

