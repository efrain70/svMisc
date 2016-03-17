# runitsvMisc.R test suite
# by Ph. Grosjean <phgrosjean@sciviews.org>
# run it simply by example(unitTests.svMisc) TODO: adapt this!

# The test cases
.setUp <- function() {}

.tearDown <- function() {}

testTempEnv <- function() {
  # TempEnv() must be an environment attached to the search path
  checkTrue(is.environment(tenv <- TempEnv()), msg = "TempEnv is an environment")
  # Now, that TempEnv() was called at least once, TempEnv must be attanched to the serach path
  checkTrue(!is.na(match("SciViews:TempEnv", search())), msg = "TempEnv is attached to the search path as 'SciViews:TempEnv'")
  # Further calls to Tempenv() return the same environment
  checkIdentical(tenv, TempEnv(), msg = "TempEnv() always returns the same environment")
  
  # Assign, get and check for variables in TempEnv
  # test_variable___ should not be there yet
  varname <- "test_variable___"
  checkTrue(!existsTemp(varname), "Test variable does not exists yet in TempEnv")
  # Create that variable and check for existence
  
  checkTrue({assignTemp(varname, 1:3); existsTemp(varname)}, "Test variable should exists after assignation in TempEnv")
  # Check content of the variable, try changing
  # with both replace.existing = TRUE|FALSE and recheck
  checkIdentical(1:3, getTemp(varname), "Test variable should contain 1:3")
  checkIdentical(1:3, {
    assignTemp(varname, 4:5, replace.existing = FALSE)
    getTemp(varname)
  }, "Test variable should still contain 1:3 after assignation without replacement")
  checkIdentical(4:5, {
    assignTemp(varname, 4:5, replace.existing = TRUE)
    getTemp(varname)
  }, "Test variable should contain 4:5 after assignation with replacement")
  # Remove the test variable and check it is not there any more
  checkTrue({
    rmTemp(varname)
    !existsTemp(varname)
  }, "Test variable does not exists any more in TempEnv after removal")
}

testparseText <- function() {
	# Note: the srcfile mechanism with timestamp does not produce identical
	# objects on two successive calls of parse(). To get around this,
	# we only compare the expression transformed into a character string	
	# Check that correct expressions are parsed
	expr <- "1+1"; res <- as.character(parse(text = expr))
	checkIdentical(res, as.character(parseText(expr)),
		msg = "parseText() with a single instruction")
#	expr <- "1+1; ls()"; res <- as.character(parse(text = expr))
#	checkIdentical(res, as.character(parseText(expr)),
#		msg = "parseText() with two instructions on one line")
#	expr <- c("1+1", "ls()"); res <- as.character(parse(text = expr))
#	checkIdentical(res, as.character(parseText(expr)),
#		msg = "parseText() with two separate instructions")
	## Check that incomplete instructions produce NA in parseText()
#	expr <- "1 +"
#	checkTrue(is.na(parseText(expr)),
#		msg = "parseText() returns NA when parsing incomplete command")
	# Check that incorrect expression return a try-error object
	# with correct error message
#	expr <- "1+)"
#	checkTrue(inherits(parseText(expr), "try-error"),
#		msg = "parseText() returns a 'try-error' object with incorrect code")
	# This function retrieves the error message as it should appear
	# in parseText()
#	getErrorMsg <- function (text) {
#		res <- try(parse(text = text), silent = TRUE)
#		if (inherits(res, "try-error")) {
#			res <- sub("^.*<text>:", "", as.character(res))
#			res <- sub("\n$", "", res)
#			return(res)
#		} else return("") # This is not supposed to happen!
#	}
	# TODO: for some reasons this does not work as expected...
#	checkIdentical(getErrorMsg(expr), as.character(parseText(expr)),
#		msg = "parseText() returns an error message with wrong code")
	
	# TODO: add other tests...
}

testcaptureAll <- function() {
	# A couple of expressions and expected results from captureAll()
	expr1 <- parse(text = "1+1")
	res1 <- "[1] 2\n"
	
	# General tests of captureAll()
	# TODO...

	# Test of 'expr' argument
	# Expected behaviour: expr can be an expression, a name, a call (and they are evaluated),
	# or NA, and it is passed through. Anything else raises an exception
#	checkTrue(is.na(captureAll(NA)), msg = "captureAll() returns NA when expr is NA")
	checkException(captureAll(1), msg = "captureAll(1) raises error (expr only expression or NA)")
	checkException(captureAll("1+1"), msg = "captureAll(\"1+1\") raises error (expr only expression or NA)")
	checkException(captureAll(TRUE), msg = "captureAll(TRUE) raises error (expr only expression or NA)")
	checkException(captureAll(NULL), msg = "captureAll(NULL) raises error (expr only expression or NA)")
	checkException(captureAll(logical(0)), msg = "captureAll(logical(0)) raises error (expr only expression or NA)")
	
	# Test of 'split' argument
	# TODO: we cannot check if split is correct, but at least, we can check it does not raise error
	# Expected behaviour: split can be anything, but only split = TRUE do split the output
#	checkIdentical(res1, captureAll(expr1, echo = FALSE, split = TRUE), msg = "captureAll(...., split = TRUE) test")
#	checkIdentical(res1, captureAll(expr1, echo = FALSE, split = FALSE), msg = "captureAll(...., split = FALSE) test")
#	checkIdentical(res1, captureAll(expr1, echo = FALSE, split = c(TRUE, FALSE)), msg = "captureAll(...., split = c(TRUE, FALSE)) test")
#	checkIdentical(res1, captureAll(expr1, echo = FALSE, split = logical(0)), msg = "captureAll(...., split = logical(0)) test")
#	checkIdentical(res1, captureAll(expr1, echo = FALSE, split = NULL), msg = "captureAll(...., split = NULL) test")
#	checkIdentical(res1, captureAll(expr1, echo = FALSE, split = "TRUE"), msg = "captureAll(...., split = \"TRUE\") test")
#	checkIdentical(res1, captureAll(expr1, echo = FALSE, split = 1), msg = "captureAll(...., split = 1) test")
#	checkIdentical(res1, captureAll(expr1, echo = FALSE, split = NA), msg = "captureAll(...., split = NA) test")
	
	# TODO:... other tests (warnings, errors, sink(), capture.output(), interactive commands -how?-, etc.)
}
