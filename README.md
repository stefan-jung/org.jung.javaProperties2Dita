org.jung.javaProperties2Dita
================================

[![license](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0)

**org.jung.javaProperties2Dita** is a plugin for the [DITA-OT](http://dita-ot.github.io) for converting Java property files to DITA. Java property files are simple key-value-files, that are converted to DITA `<keyword>` elements.

**Input**

```
key=value
```

**Output**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE topic
  PUBLIC "-//OASIS//DTD DITA Topic//EN" "topic.dtd">
<topic id="test.properties">
   <title>test.properties</title>
   <body>
      <div>
          <keyword id="key">value</keyword>
      </div>
   </body>
</topic>
```


### Installation

Install the plugin to the DITA-OT with the following command:

```bash
dita -install https://github.com/stefan-jung/org.jung.javaProperties2Dita/archive/master.zip
```


### Install Framework

This step is optional. To install the &lt;oXygen/&gt; XML framework, proceed as follows:

1. In &lt;oXygen/&gt; open the menu `Options` > `Preferences`.
2. In the preferences, open `Document Type Association` > `Locations`.
3. Add the directory of the plugin in the DITA-OT, e.g. `/home/user/workspace/dita-ot/plugins/org.jung.javaProperties2Dita`.


# Using the Plugin

Please refer to the documentation on [stefan-jung.org](https://stefanjung.netlify.app/plugins/javaproperties2dita).
