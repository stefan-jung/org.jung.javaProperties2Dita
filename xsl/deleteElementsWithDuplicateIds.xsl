<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:fn="fn"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" 
    exclude-result-prefixes="xs fn xd saxon ditaarch">

    <!--
        Copyright 2023 Stefan Jung

        Licensed under the Apache License, Version 2.0 (the "License");
        you may not use this file except in compliance with the License.
        You may obtain a copy of the License at

          http://www.apache.org/licenses/LICENSE-2.0

        Unless required by applicable law or agreed to in writing, software
        distributed under the License is distributed on an "AS IS" BASIS,
        WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
        See the License for the specific language governing permissions and
        limitations under the License.
    -->

    <xsl:output method="xml"
        doctype-public="-//OASIS//DTD DITA Topic//EN"
        doctype-system="topic.dtd"
        indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="@class"/>
    <xsl:template match="@domains"/>
    <xsl:template match="@DITAArchVersion"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="keyword">
        <xsl:if test="not(@id = following-sibling::*/@id)">
            <xsl:element name="keyword">
              <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
              <xsl:apply-templates/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet> 

