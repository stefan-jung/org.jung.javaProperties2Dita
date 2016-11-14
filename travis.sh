#!/bin/sh
zip -r org.doctales.javaProperties2Dita.zip . -x *.zip* *.git/* *temp/* *out/*
curl -LO https://github.com/dita-ot/dita-ot/releases/download/2.3.3/dita-ot-2.3.3.zip
unzip -q dita-ot-2.3.3.zip
mv dita-ot-*/ dita-ot/
chmod +x dita-ot/bin/ant
dita-ot/bin/ant -buildfile samples/build.xml -Ddita.dir=dita-ot
