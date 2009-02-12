#!/usr/bin/env io

WebRequest := Object clone do(
    streamFile := method(aSocket,
        aSocket streamReadNextChunk
        request := aSocket readBuffer betweenSeq("GET ", " HTTP")
        f := File with(request) 
        if(f exists, f streamTo(aSocket), aSocket streamWrite("not found"))
        aSocket close
    )
    streamHello := method(aSocket,
        aSocket setReadTimeout(1)
        aSocket streamReadNextChunk
        buf := aSocket readBuffer
        buf size println
        if(buf size < 89, 
          aSocket streamReadNextChunk
          buf = buf .. aSocket readBuffer
          "updated buffer: #{buf size}" interpolate println
        )
        request := buf betweenSeq("GET ", " HTTP")
        aSocket streamWrite("Hello")
        aSocket close
    )
)

WebServer := Server clone do(
    setPort(8000)
    handleSocket := method(aSocket, 
      # Warning: every request creates a new coroutine!
        WebRequest clone streamHello(aSocket)
    )
)

WebServer start
