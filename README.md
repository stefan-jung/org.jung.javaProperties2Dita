![DOCTALES Logo](https://doctales.github.io/images/doctales-logo-without-subtitle.svg)

- - - -

org.doctales.javaProperties2Dita
================================

[![Build Status](https://travis-ci.org/doctales/org.doctales.javaProperties2Dita.svg?branch=master)](https://travis-ci.org/doctales/org.doctales.javaProperties2Dita)
[![license](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0)

**org.doctales.javaProperties2Dita** is a plugin for the [DITA-OT](http://dita-ot.github.io) for converting Java property files to DITA. Java property files are simple key-value-files, that are converted to DITA `<keyword>` elements.


**Input**

```
key=value
```


**Output**

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE topic
  PUBLIC "-//OASIS//DTD DITA Topic//EN" "topic.dtd">
<topic id="test.properties">
   <title>test.properties</title>
   <body>
      <ul>
         <li>
            <keyword id="key">value</keyword>
         </li>
      </ul>
   </body>
</topic>
```


**Table of Contents**

* [Installation](#installation)
* [Install Framework](#install-framework)
* [Usage](#usage)


### Installation

Install the plugin to the DITA-OT with the following command:

```bash
dita -install https://github.com/doctales/org.doctales.javaProperties2Dita/archive/master.zip
```


### Install Framework

This step is optional. To install the &lt;oXygen/&gt; XML framework, proceed as follows:

1. In &lt;oXygen/&gt; open the menu `Options` > `Preferences`.
2. In the preferences, open `Document Type Association` > `Locations`.
3. Add the directory of the plugin in the DITA-OT, e.g. `/home/user/workspace/dita-ot/plugins/org.doctales.javaProperties2Dita`.


### Usage

**Convert via &lt;oXygen/&gt; transformation scenario**

1. Open a Java properties file in &lt;oXygen/&gt;.
2. Launch the transformation sceanrio `Convert Java-Properties 2 DITA`.
   A DITA file is created in the directory of the input file.


**Convert via Apache Ant transformation scenario**

1. Import the `build_javaProperties2Dita.xml` to your Apache Ant build file.
2. Call the transformation using the custom `<convert-properties-to-dita>` element.
   ```xml
   <convert-properties-to-dita input="input.properties" output="output.dita"/>
   ```
