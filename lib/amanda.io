/*
  
  Author: Oleg Andreev
  MIT License.
*/


Amanda := Object clone do(
  Server := HttpServer clone do (
    setPort ( 5000 )
    setHost ( "localhost" )

    renderResponse := method(request, response,
      response setBody (
          "Hello, world!"
      )
    )
  )
)

