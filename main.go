package main

import (
	"flag"
	"fmt"
	"os"
	"text/template"
)

type Params struct {
	Version       string
	MacAmd64SHA   string
	MacArm64SHA   string
	LinuxAmd64SHA string
}

func main() {
	version := flag.String("version", "", "The scotty version to release")
	macAmd64SHA := flag.String("mac-amd64-sha", "", "The SHA of the mac amd64 binary")
	macArm64SHA := flag.String("mac-arm64-sha", "", "The SHA of the mac arm64 binary")
	linuxAmd64SHA := flag.String("linux-amd64-sha", "", "The SHA of the linux amd64 binary")
	templatePath := flag.String("template-path", "scotty.rb.tmpl", "Path of the template file")

	flag.Parse()

	params := Params{
		Version:       *version,
		MacAmd64SHA:   *macAmd64SHA,
		MacArm64SHA:   *macArm64SHA,
		LinuxAmd64SHA: *linuxAmd64SHA,
	}

	templ := template.Must(template.ParseFiles(*templatePath))
	if err := templ.Execute(os.Stdout, params); err != nil {
		fmt.Printf("Failed to execute template: %s", err)
		os.Exit(1)
	}
}
