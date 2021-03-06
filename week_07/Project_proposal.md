GEO 511 Final Project Proposal
================
Hui Gao
October 18, 2021

# Introduction to problem/question

Jakobshavn Isbrae, one of the largest tidewater glaciers in Greenland,
has been exhibiting complex spatiotemporal behaviors. After \~20 years
of acceleration, retreating, and thinning, it started to decelerate,
readvance, and thicken beginning in 2016. The acceleration and retreat
resumed in 2019. Understanding the driving mechanisms of these changes,
especially the reversal in 2016, is essential to predict its future
contribution to sea-level rise under different scenarios of climate
change.

Previous studies found that decreased submarine melt and extended
existence of rigid melange as a result of ocean cooling near the
terminus are strong candidates for causing the reversal. However, the
roles of the subglacial drainage system and bed topography remain
elusive. This project aims to compare the relationships of ice surface
velocity with the subglacial drainage system, bedrock topography, and
oceanic temperature to identify the forcing driving the evolution of
Jakobshavn Isbrae.

# Problem / Question

What are the driving the variations of ice flow of Jakobshavn Isbrae on
Western Greenland?

# Inspiring Examples

## Example 1

![](https://tc.copernicus.org/articles/15/407/2021/tc-15-407-2021-avatar-web.png)

This figure illustrates the first few steps I want to do in this
project. It shows a map of the surface ice velocity of Jakobshavn Isbrae
with its location on the Greenland Ice Sheet. Time series of surface ice
velocity are extracted at different locations from a bunch of such maps.
The lower panel shows the decomposed seasonal and interannual trends. It
helps analyze the velocity data at different temporal scales and
locations on the glacier.

## Example 2

![](https://agupubs.onlinelibrary.wiley.com/cms/asset/c0b5d023-0cc1-40e6-a466-9c0c0d1d72ba/grl58290-fig-0001-m.png)

Modeled and observed terminus evolution of Jakobshavn Isbrae until 2018
and bedrock elevation map. Previous studies found a correlation between
terminus position and ice velocity in this glacier. Bed elevation can be
used to calculate the bed slope and depth of the terminus or grounding
line to compare with variations of terminus position and velocity.

## Example 3

![](https://journals.ametsoc.org/view/journals/clim/22/14/i1520-0442-22-14-4029-f07.jpg)

Seasonal correlation patterns for 1958???2007 of the Ilulissat
meteorological station recorded surface air temperature observations vs
Polar MM5???modeled 2-m air temperature. I will produce similar
correlation maps showing correlations between different pairs of
variables, for example, ocean temperature vs surface ice velocity.

# Proposed data sources

  - Surface ice velocity maps (GeoTIFFs) from NSIDC:
    <https://nsidc.org/data/nsidc-0481/versions/2>
  - Terminus position (Shapefiles): <https://doi.org/10.7280/D1FH5D>
  - Bed elevation (netCDF) from BedMachine Greenland v3:
    <https://sites.uci.edu/morlighem/dataproducts/bedmachine-greenland/>
  - Runoff (netCDF) from RACMO2.3p2:
    <https://www.projects.science.uu.nl/iceclimate/models/greenland.php>
  - Ocean temperature (netCDF) from OMG:
    <https://omg.jpl.nasa.gov/portal/browse/OMGEV-AXCTD/>

# Proposed methods

``` r
library(tidyverse)
library(raster)
library(rgdal)
library(sf)
library(spData)
library(ncdf4)
library(tmap)
library(stats)
```

Read data:

``` r
raster() # read GeoTIFFs
readOGR() # read shapefiles
nc_open() # read netCDF files
```

Calculate surface ice velocity variations:

``` r
overlay() # subtract one raster from another 
```

Seasonal decomposition for time series:

``` r
stl() # STL decomposition
```

Correlation analysis:

``` r
cor.test(method = "spearman") # calculate correlation coefficient (Spearman) between two variables
```

Plot:

``` r
ggplot() # plot using ggplot2
tm_shape() # plot using tmap
plot() # basic r plot
```

# Expected results

The expected results include:

1.  Summary statistics of all the variables including mean, variance,
    standard deviation, etc.
2.  Maps of bed elevation, mean velocity, hydraulic potential, etc.
3.  Decomposed velocity trend, seasonality, and residuals.
4.  Correlation coefficient summary tables.
5.  Correlation coefficient maps.
6.  Discussion on the roles of oceanic temperature, subglacial drainage
    system, and bed elevation in driving the evolution of ice flow.
