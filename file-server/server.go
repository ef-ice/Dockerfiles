package main

import (
	"net/http"
	"flag"
	"fmt"
	)

func main() {
	dir := flag.String("root_dir", ".", "Directory from where the files should be served")
	flag.Parse()

	fmt.Println("Serving files under " + *dir +  " ...")

    	panic(http.ListenAndServe(":8080", http.FileServer(http.Dir(*dir))))
    }
