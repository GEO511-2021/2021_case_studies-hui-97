Case Study 07
================
Hui Gao
October 19, 2021

## Reproducible example

``` r
library(reprex)
library(styler)
library(tidyverse)
library(spData)
data(world)

ggplot(world,aes(x=gdpPercap, y=continent, color=continent))+
  geom_density(alpha=0.5,color=F)

ggplot(world,aes(x=gdpPercap, color=continent, fill=continent))+
  geom_density(alpha=0.5,color=F)+
  theme(legend.position = "bottom")

reprex(venue="gh")
```
