#!/bin/sh
zip -r org.doctales.javaProperties2Dita.zip . -x *.zip* *.git/* *temp/* *out/*
curl -LO https://github.com/dita-ot/dita-ot/releases/download/2.4/dita-ot-2.4.zip
unzip -q dita-ot-2.4.zip
mv dita-ot-*/ dita-ot/
mv dita-ot/ /tmp/
chmod +x /tmp/dita-ot/bin/ant
chmod +x /tmp/dita-ot/bin/dita
export ditaot=/tmp/dita-ot
echo $ditaot
/tmp/dita-ot/bin/dita --install org.doctales.javaProperties2Dita.zip
/tmp/dita-ot/bin/ant -f /tmp/dita-ot/plugins/org.doctales.javaProperties2Dita/samples/build.xml