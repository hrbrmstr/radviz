
`radviz` : an htmlwidget for [https://github.com/biovisualize/radviz](https://github.com/biovisualize/radviz)

See <https://github.com/biovisualize/radviz> for more info.

This is a super-basic widget that's looking for a home (i.e pls take over development! :-)

The following functions are implemented:

- `radviz`:	Make a radviz
- `add_dimensions`:	Add the columns (dimensions) you wish to map in the radviz
- `add_color`:	Add color to the charts
- `add_tooltip`:	Add a tooltip to a radviz widget

The following data sets are included:

### Installation


```r
devtools::install_github("hrbrmstr/radviz")
```



### Usage


```r
library(radviz)

# current verison
packageVersion("radviz")
```

```
## [1] '0.2.0'
```

```r
radviz(iris, diameter=600, margin=100, 
       use_repulsion=TRUE, draw_links=TRUE, 
       width=600, height=500) %>% 
  add_dimensions(c('Sepal.Length', 'Sepal.Width', 
                   'Petal.Length', 'Petal.Width')) %>% 
  add_color("Species") %>% 
  add_tooltip("function(d){ return 'Petal width: ' + d['Petal.Length']; }")
```

![](radviz.png)

### Test Results


```r
library(radviz)
library(testthat)

date()
```

```
## [1] "Fri Mar  4 17:48:47 2016"
```

```r
test_dir("tests/")
```

```
## testthat results ========================================================================================================
## OK: 0 SKIPPED: 0 FAILED: 0
```
