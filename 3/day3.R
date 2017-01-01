#!/usr/bin/env Rscript

inp <- scan("input", list(0,0,0))
length(which(inp[[1]]+inp[[2]]>inp[[3]]&inp[[1]]+inp[[3]]>inp[[2]]&inp[[2]]+inp[[3]]>inp[[1]]))
