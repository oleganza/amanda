#!/usr/bin/env io

Iota := Object clone do (
    stack := nil
    output := nil

    init := method (
        stack = List clone
        output = List clone
    )

    squareBrackets := method (
        for ( arg, 0, call argCount - 1,
            output append ( call evalArgAt ( arg ) )
        )
        output append ( stack pop )
        ""
    )

    forward := method (
        name := call message name
        attrs := call message arguments map ( arguments ) map ( pair,
            k := pair at ( 0 ) asString exSlice ( 1, -1 )
            v := pair at ( 1 )
            " " .. k .. "=" .. v
        ) join

        if ( call message next ?name == "squareBrackets",
            output append ( "<" .. name .. attrs .. ">" )
            stack push ( "</" .. name .. ">" )
            self

        , // else
            output append ( "<" .. name .. attrs .. " />" )
            ""
        )
    )
)

server := HttpServer clone do (
    setPort ( 5000 )
    setHost ( "localhost" )

    renderResponse := method(request, response,
    #    request fields foreach(k,v, list(k,v) println)
    #    CGI parseString(request queryString ) foreach(k,v, list(k,v) println)
        response setBody (
            "Hello, world!"
        )
    )

    createBody := method (
        Iota clone do (
            html [
                head [
                    title [ "the title" ]
                ]

                body [
                    div ( class="foo", id="bar" ) [
                        "hello, world" , br
                        "this is a test"
                    ]
                ]
            ]
        ) output join
    )
)

server start
