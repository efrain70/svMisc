# svMisc

[![Linux & OSX Build Status](https://travis-ci.org/SciViews/svMisc.svg )](https://travis-ci.org/SciViews/svMisc)
[![Win Build Status](https://ci.appveyor.com/api/projects/status/github/phgrosjean/svMisc?branch=master&svg=true)](http://ci.appveyor.com/project/phgrosjean/svMisc)
[![Coverage Status](https://img.shields.io/codecov/c/github/SciViews/svMisc/master.svg)
](https://codecov.io/github/SciViews/svMisc?branch=master)
[![CRAN Status](http://www.r-pkg.org/badges/version/svMisc)](http://cran.r-project.org/package=svMisc)
[![License](https://img.shields.io/badge/license-GPL-blue.svg)](http://www.gnu.org/licenses/gpl-2.0.html)

Miscellaneous functions for SciViews.

The [R-Forge version](https://r-forge.r-project.org/projects/sciviews/)) is moved to Github on 2016-03-16 (SVN version 569). **Please, do not use R-forge anymore for SciViews development, use this github repository instead.**


## Installation

### Latest stable version

The latest stable version of **svMisc** can simply be installed from [CRAN](http://cran.r-project.org):

```r
install.packages("svMisc")
```


### Development version

Make sure you have the **devtools** R package installed:

```r
install.packages("devtools")
```

Use `install_github()` to install the **svMisc** package from Github (master branch):

```r
devtools::install_github("SciViews/svMisc")
```

R should install all required dependencies automatically, and then it should compile and install **svMisc**.

Latest devel version in source and Windows binaires formats also available from [appveyor](https://ci.appveyor.com/project/phgrosjean/svMisc/build/artifacts).


## Usage

Make the **svMisc** package available in your R session:

```r
library("svMisc")
```

Get help about this package:

```r
library(help = "svMisc")
help("svMisc-package")
```
