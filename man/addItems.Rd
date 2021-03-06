\name{addItems}
\alias{addItems}
\alias{addActions}
\alias{addIcons}
\alias{addMethods}

\title{ Add items from one vector to another one with or without replacement }
\description{
  The function takes the (named) items of one vector and place them in a second
  vector if these names do not exist yet there, or replace corresponding
  content otherwise.
}

\usage{
addItems(x, y, use.names = TRUE, replace = TRUE)
addActions(obj = ".svActions", text = NULL, code = NULL, state = NULL,
	options = NULL, replace = TRUE)
addIcons(obj = ".svIcons", icons, replace = TRUE)
addMethods(methods)
}

\arguments{
  \item{x}{ the vector to add items to. }
  \item{y}{ the vector of which we want to inject missing items in 'x'. }
  \item{use.names}{ use names of items to determine which one is unique,
    otherwise, the selection is done on the items themselves. }
  \item{replace}{ do we replace existing items in 'x'? }
  \item{obj}{ the name of the object in \code{SciViews:TempEnv} to manipulate. }
  \item{text}{ the text of actions to add (label on first line, tip on other
    lines). }
  \item{code}{ the R code of actions to add. }
  \item{state}{ the default (strating) state of an action, as a succession of
    letters: \"c\" = checked, \"u\" = unchecked (default); \"d\" = disabled,
    \"e\" = enabled (default); \"h\" = hidden, \"v\" = visible (default).
	Default values are facultative. Ex: \code{udv} means: unchecked - disabled
	- visible and it equals to simply \code{d}. }
  \item{options}{ a character vector with other options to pass to the graphical
    toolkit for this action. }
  \item{icons}{ a named character vector matching names of actions/panels with
    the URL or file name of icon resources accessible by the GUI client. }
  \item{methods}{ the methods to add to \code{getOption("svGUI.methods")}. This
    information is used to compute a list of possible methods for a given
	object, for instance, in the context menu of an object explorer
	(see \code{objMenu()}). }

}

\author{ Philippe Grosjean <phgrosjean@sciviews.org> }

\seealso{ \code{\link{listMethods}}, \code{\link{objMenu}},
  \code{\link{TempEnv}} }

\examples{
## I have a vector v1 with this:
v1 <- c(a = "some v1 text", b = "another v1 text")
## I want to add items whose name is missing in v1 from v2
v2 <- c(a = "v2 text", c = "the missign item")
addItems(v1, v2, replace = FALSE)
## Not the same as
addItems(v1, v2, replace = TRUE)
## This yield different result (names not used and lost!)
addItems(v1, v2, use.names = FALSE)

## This is useful to add actions, icons, descriptions, shortcuts or methods
## TODO: examples and use for functions addActions(), addIcons() and
## addMethods()
}

\keyword{ utilities }

\concept{ vector manipulation }
