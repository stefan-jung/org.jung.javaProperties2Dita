<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:fn="fn"
    xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="xs fn xd saxon">

    <!--
        Copyright 2016 DOCTALES
        
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

    <xsl:param name="lineFeedChar">�</xsl:param>
    <xsl:param name="newlineWithSpace">\n </xsl:param>
    <xsl:param name="newlineWithoutSpace">\n</xsl:param>

    <xsl:output method="xml"
        doctype-public="-//OASIS//DTD DITA Topic//EN"
        doctype-system="http://docs.oasis-open.org/dita/v1.2/os/dtd1.2/technicalContent/dtd/topic.dtd"
        indent="yes"/>

    <xsl:param name="text-encoding" as="xs:string" select="'UTF-8'"/>
    <xsl:param name="propertiesFile" as="xs:string"/>

    <xsl:function name="fn:getTokens" as="xs:string+">
        <xsl:param name="str" as="xs:string"/>
        <xsl:analyze-string select="concat($str, '�')" regex='(("[^"]*")+|[^,]*)�'>
            <xsl:matching-substring>
                <xsl:sequence select='replace(regex-group(1), "^""|""$|("")""", "$1")'/>
            </xsl:matching-substring>
        </xsl:analyze-string>
    </xsl:function>

    <xsl:function name="fn:getKey" as="xs:string">
        <xsl:param name="str" as="xs:string"/>
        <xsl:analyze-string select="concat($str, '�')" regex='(("[^"]*")+|[^,]*)�'>
            <xsl:matching-substring>
                <xsl:variable name="unparsed">
                    &lt;x><xsl:value-of select="replace(
                        replace(
                        replace(replace(substring-before(., '='), '\\u([0-9a-fA-F]{4})', '&amp;#x$1;'),
                        $newlineWithSpace, ' '),
                        $newlineWithoutSpace, ''),
                        $lineFeedChar, '')"/>&lt;/x>
                </xsl:variable>
                <xsl:value-of select="saxon:parse($unparsed)/*/text()"/>
            </xsl:matching-substring>
        </xsl:analyze-string>
    </xsl:function>

    <xsl:function name="fn:getValue" as="xs:string">
        <xsl:param name="str" as="xs:string"/>
        <xsl:analyze-string select="concat($str, '�')" regex='(("[^"]*")+|[^,]*)�'>
            <xsl:matching-substring>
                <xsl:variable name="unparsed">
                    &lt;x><xsl:value-of select="replace(
                            replace(
                            replace(replace(substring-after(., '='), '\\u([0-9a-fA-F]{4})', '&amp;#x$1;'),
                            $newlineWithSpace, ' '),
                            $newlineWithoutSpace, ''),
                            $lineFeedChar, '')"/>&lt;/x>
                </xsl:variable>
                <xsl:value-of select="saxon:parse($unparsed)/*/text()"/>
            </xsl:matching-substring>
        </xsl:analyze-string>
    </xsl:function>

    <xsl:template name="getFilenameFromPath">
        <xsl:param name="string"/>
        <xsl:param name="char"/>
        <xsl:choose>
            <xsl:when test="contains($string, $char)">
                <xsl:call-template name="getFilenameFromPath">
                    <xsl:with-param name="string" select="substring-after($string, $char)"/>
                    <xsl:with-param name="char" select="$char"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$string"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/*">
        <xsl:variable name="properties" select="unparsed-text($propertiesFile)"/>
        <xsl:variable name="properties.filename">
            <xsl:call-template name="getFilenameFromPath">
                <xsl:with-param name="string" select="$propertiesFile"/>
                <xsl:with-param name="char" select="'/'"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="inputFilePath" select="base-uri()"/>
        <xsl:variable name="stylesheetFilePath" select="base-uri(document(''))"/>
        <xsl:variable name="lines" select="tokenize($properties, '&#xa;')" as="xs:string+"/>

        <topic>
            <xsl:attribute name="id">
                <xsl:value-of select="$properties.filename"/>
            </xsl:attribute>
            <xsl:attribute name="translate">no</xsl:attribute>
            <title><xsl:value-of select="$properties.filename"/></title>
            <body>
                <ul>
                    <xsl:for-each select="$lines">
                        <xsl:variable name="key" select="normalize-space(fn:getKey(.))" as="xs:string+"/>
                        <xsl:variable name="value" select="normalize-space(fn:getValue(.))" as="xs:string+"/>
                        <xsl:choose>
                            <xsl:when test="$key != '' and $value != ''">
                                <xsl:element name="li"><xsl:element name="keyword"><xsl:attribute name="id"><xsl:value-of select="$key"/></xsl:attribute><xsl:attribute name="translate">no</xsl:attribute><xsl:value-of select="$value"/></xsl:element></xsl:element>                                
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </ul>
            </body>
        </topic>
    </xsl:template>

</xsl:stylesheet>