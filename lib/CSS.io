CSS := Object clone do(
  SelectorParser := Object clone do(
    parse := method(string, 
      1
    )
  )
)

#
# Test
#
if(isLaunchScript,
  verify := method(UnitTest doMessage(message(assertTrue) setArguments(call message arguments)))
  appendProto(CSS SelectorParser)
  verify(parse("a") == message(1))
)
