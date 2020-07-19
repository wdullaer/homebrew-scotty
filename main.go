package main

import (
	"flag"
	"fmt"
	"os"
	"text/template"
)

type Params struct {
	Version  string
	MacSHA   string
	LinuxSHA string
}

func main() {
	version := flag.String("version", "", "The scotty version to release")
	macSHA := flag.String("mac-sha", "", "The SHA of the mac binary")
	linuxSHA := flag.String("linux-sha", "", "The SHA of the linux binary")
	templatePath := flag.String("template-path", "scotty.rb.tmpl", "Path of the template file")

	flag.Parse()

	params := Params{
		Version:  *version,
		MacSHA:   *macSHA,
		LinuxSHA: *linuxSHA,
	}

	templ := template.Must(template.ParseFiles(*templatePath))
	if err := templ.Execute(os.Stdout, params); err != nil {
		fmt.Printf("Failed to execute template: %s", err)
		os.Exit(1)
	}
}
