package main

import (
    "flag"
    "fmt"
    "log"
    "net/http"
)

var addr = flag.String("addr", ":80", "service listen address")

func MainHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello world.")
}

func main() {
    flag.Parse()
    http.HandleFunc("/", MainHandler)

    log.Println("server starting and listening", *addr)
    log.Fatal(http.ListenAndServe(*addr, nil))
}