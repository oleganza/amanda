#!/usr/bin/env io
doRelativeFile("../../lib/amanda.io")

Production := Amanda Environment clone do(
  
)

Development := Amanda Environment clone do(
  
)

# Set this up depending on the system env variables.
Blog := Development application




/*Blog App do(
  Router do(
    route("uuid"/uuid,               Controllers Documents, "show")
    route("uuid"/uuid.format,        Controllers Documents, "show")
    route("uuid"/uuid/action.format, Controllers Documents, action)
    route("",                        Controllers Documents, index)
  )
)
*/

