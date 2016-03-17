<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:fn="fn"
    exclude-result-prefixes="xs fn xd">
    
    <!--
        Doctales org.doctales.javaProperties2Dita Stylesheet
        
        Licensed to the Apache Software Foundation (ASF) under one or more
        contributor license agreements. See the NOTICE file distributed with
        this work for additional information regarding copyright ownership.
        The ASF licenses this file to You under the Apache License, Version 2.0
        (the “License”); you may not use this file except in compliance with
        the License. You may obtain a copy of the License at
        
        http://www.apache.org/licenses/LICENSE-2.0
        
        Unless required by applicable law or agreed to in writing, software
        distributed under the License is distributed on an “AS IS” BASIS,
        WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
        See the License for the specific language governing permissions and
        limitations under the License.
    -->
    
    <xsl:param name="lineFeedChar">�</xsl:param>
    <xsl:param name="newlineWithSpace">\n </xsl:param>
    <xsl:param name="newlineWithoutSpace">\n</xsl:param>
    <xsl:param name="u00C5.after">Å</xsl:param>
    <xsl:param name="u00C5.before">\\u00C5</xsl:param>
    <xsl:param name="u00C6.after">Æ</xsl:param>
    <xsl:param name="u00C6.before">\\u00C6</xsl:param>
    <xsl:param name="u00C9.after">É</xsl:param>
    <xsl:param name="u00C9.before">\\u00C9</xsl:param>
    <xsl:param name="u00CD.after">Í</xsl:param>
    <xsl:param name="u00CD.before">\\u00CD</xsl:param>
    <xsl:param name="u00D3.after">Ó</xsl:param>
    <xsl:param name="u00D3.before">\\u00D3</xsl:param>
    <xsl:param name="u00D8.after">Ø</xsl:param>
    <xsl:param name="u00D8.before">\\u00D8</xsl:param>
    <xsl:param name="u00DA.after">Ú</xsl:param>
    <xsl:param name="u00DA.before">\\u00DA</xsl:param>
    <xsl:param name="u00DD.after">Ý</xsl:param>
    <xsl:param name="u00DD.before">\\u00DD</xsl:param>
    <xsl:param name="u00E1.after">á</xsl:param>
    <xsl:param name="u00E1.before">\\u00E1</xsl:param>
    <xsl:param name="u00E5.after">å</xsl:param>
    <xsl:param name="u00E5.before">\\u00E5</xsl:param>
    <xsl:param name="u00E6.after">æ</xsl:param>
    <xsl:param name="u00E6.before">\\u00E6</xsl:param>
    <xsl:param name="u00E9.after">é</xsl:param>
    <xsl:param name="u00E9.before">\\u00E9</xsl:param>
    <xsl:param name="u00ED.after">í</xsl:param>
    <xsl:param name="u00ED.before">\\u00ED</xsl:param>
    <xsl:param name="u00F3.after">ó</xsl:param>
    <xsl:param name="u00F3.before">\\u00F3</xsl:param>
    <xsl:param name="u00F8.after">ø</xsl:param>
    <xsl:param name="u00F8.before">\\u00F8</xsl:param>
    <xsl:param name="u00FA.after">ú</xsl:param>
    <xsl:param name="u00FA.before">\\u00FA</xsl:param>
    <xsl:param name="u00FD.after">ý</xsl:param>
    <xsl:param name="u00FD.before">\\u00FD</xsl:param>
    <xsl:param name="u00a0.after"> </xsl:param>
    <xsl:param name="u00a0.before">\\u00a0</xsl:param>
    <xsl:param name="u00c4.after">Ä</xsl:param>
    <xsl:param name="u00c4.before">\\u00c4</xsl:param>
    <xsl:param name="u00d3.after">Ó</xsl:param>
    <xsl:param name="u00d3.before">\\u00d3</xsl:param>
    <xsl:param name="u00d6.after">Ö</xsl:param>
    <xsl:param name="u00d6.before">\\u00d6</xsl:param>
    <xsl:param name="u00dc.after">Ü</xsl:param>
    <xsl:param name="u00dc.before">\\u00dc</xsl:param>
    <xsl:param name="u00df.after">ß</xsl:param>
    <xsl:param name="u00df.before">\\u00df</xsl:param>
    <xsl:param name="u00f3.after">ó</xsl:param>
    <xsl:param name="u00f3.before">\\u00f3</xsl:param>
    <xsl:param name="u00f6.after">ö</xsl:param>
    <xsl:param name="u00f6.before">\\u00f6</xsl:param>
    <xsl:param name="u00fc.after">ü</xsl:param>
    <xsl:param name="u00fc.before">\\u00fc</xsl:param>
    <xsl:param name="u0104.after">Ą</xsl:param>
    <xsl:param name="u0104.before">\\u0104</xsl:param>
    <xsl:param name="u0105.after">ą</xsl:param>
    <xsl:param name="u0105.before">\\u0105</xsl:param>
    <xsl:param name="u0106.after">Ć</xsl:param>
    <xsl:param name="u0106.before">\\u0106</xsl:param>
    <xsl:param name="u0107.after">ć</xsl:param>
    <xsl:param name="u0107.before">\\u0107</xsl:param>
    <xsl:param name="u010C.after">Č</xsl:param>
    <xsl:param name="u010C.before">\\u010C</xsl:param>
    <xsl:param name="u010D.after">č</xsl:param>
    <xsl:param name="u010D.before">\\u010D</xsl:param>
    <xsl:param name="u010E.after">Ď</xsl:param>
    <xsl:param name="u010E.before">\\u010E</xsl:param>
    <xsl:param name="u010F.after">ď</xsl:param>
    <xsl:param name="u010F.before">\\u010F</xsl:param>
    <xsl:param name="u0118.after">Ę</xsl:param>
    <xsl:param name="u0118.before">\\u0118</xsl:param>
    <xsl:param name="u0119.after">ę</xsl:param>
    <xsl:param name="u0119.before">\\u0119</xsl:param>
    <xsl:param name="u011A.after">Ě</xsl:param>
    <xsl:param name="u011A.before">\\u011A</xsl:param>
    <xsl:param name="u011B.after">ě</xsl:param>
    <xsl:param name="u011B.before">\\u011B</xsl:param>
    <xsl:param name="u0141.after">Ł</xsl:param>
    <xsl:param name="u0141.before">\\u0141</xsl:param>
    <xsl:param name="u0142.after">ł</xsl:param>
    <xsl:param name="u0142.before">\\u0142</xsl:param>
    <xsl:param name="u0143.after">Ń</xsl:param>
    <xsl:param name="u0143.before">\\u0143</xsl:param>
    <xsl:param name="u0144.after">ń</xsl:param>
    <xsl:param name="u0144.before">\\u0144</xsl:param>
    <xsl:param name="u0147.after">Ň</xsl:param>
    <xsl:param name="u0147.before">\\u0147</xsl:param>
    <xsl:param name="u0148.after">ň</xsl:param>
    <xsl:param name="u0148.before">\\u0148</xsl:param>
    <xsl:param name="u0158.after">Ř</xsl:param>
    <xsl:param name="u0158.before">\\u0158</xsl:param>
    <xsl:param name="u0159.after">ř</xsl:param>
    <xsl:param name="u0159.before">\\u0159</xsl:param>
    <xsl:param name="u015a.after">Ś</xsl:param>
    <xsl:param name="u015a.before">\\u015a</xsl:param>
    <xsl:param name="u015b.after">ś</xsl:param>
    <xsl:param name="u015b.before">\\u015b</xsl:param>
    <xsl:param name="u0160.after">Š</xsl:param>
    <xsl:param name="u0160.before">\\u0160</xsl:param>
    <xsl:param name="u0161.after">š</xsl:param>
    <xsl:param name="u0161.before">\\u0161</xsl:param>
    <xsl:param name="u0164.after">Ť</xsl:param>
    <xsl:param name="u0164.before">\\u0164</xsl:param>
    <xsl:param name="u0165.after">ť</xsl:param>
    <xsl:param name="u0165.before">\\u0165</xsl:param>
    <xsl:param name="u016E.after">Ů</xsl:param>
    <xsl:param name="u016E.before">\\u016E</xsl:param>
    <xsl:param name="u016F.after">ů</xsl:param>
    <xsl:param name="u016F.before">\\u016F</xsl:param>
    <xsl:param name="u0179.after">Ź</xsl:param>
    <xsl:param name="u0179.before">\\u0179</xsl:param>
    <xsl:param name="u017D.after">Ž</xsl:param>
    <xsl:param name="u017D.before">\\u017D</xsl:param>
    <xsl:param name="u017E.after">ž</xsl:param>
    <xsl:param name="u017E.before">\\u017E</xsl:param>
    <xsl:param name="u017a.after">ź</xsl:param>
    <xsl:param name="u017a.before">\\u017a</xsl:param>
    <xsl:param name="u017b.after">Ż</xsl:param>
    <xsl:param name="u017b.before">\\u017b</xsl:param>
    <xsl:param name="u017c.after">ż</xsl:param>
    <xsl:param name="u017c.before">\\u017c</xsl:param>
    <xsl:param name="u2013.after">–</xsl:param>
    <xsl:param name="u2013.before">\\u2013</xsl:param>
    <xsl:param name="u2013Z.after">–</xsl:param>
    <xsl:param name="u2013Z.before">\\u2013Z</xsl:param>
    <xsl:param name="u201d.after">”</xsl:param>
    <xsl:param name="u201d.before">\\u201d</xsl:param>
    <xsl:param name="u201e.after">„</xsl:param>
    <xsl:param name="u201e.before">\\u201e</xsl:param>
    <xsl:param name="u2215.after">∕</xsl:param>
    <xsl:param name="u2215.before">\\u2215</xsl:param>
    <xsl:param name="u00e4.after">ä</xsl:param>
    <xsl:param name="u00e4.before">\\u00e4</xsl:param>
    
    <xsl:output method="xml"
        doctype-public="-//OASIS//DTD DITA Topic//EN"
        doctype-system="http://docs.oasis-open.org/dita/v1.1/OS/dtd/topic.dtd"
        indent="yes"/>
    
    <xsl:param name="text-encoding" as="xs:string" select="'UTF-8'"/>
    <!--<xsl:param name="propertiesFile" as="xs:string" select="'my.properties'"/>-->
    <xsl:param name="propertiesFile" as="xs:string"/>
    
    
    
    <xsl:function name="fn:getTokens" as="xs:string+">
        <xsl:param name="str" as="xs:string"/>
        <xsl:analyze-string select="concat($str, '�')" regex='(("[^"]*")+|[^,]*)�'>
            <xsl:matching-substring>
                <xsl:sequence select='replace(regex-group(1), "^""|""$|("")""", "$1")'/>
            </xsl:matching-substring>
        </xsl:analyze-string>
    </xsl:function>
    
    <xsl:function name="fn:getKey" as="xs:string+">
        <xsl:param name="str" as="xs:string"/>
        <xsl:analyze-string select="concat($str, '�')" regex='(("[^"]*")+|[^,]*)�'>
            <xsl:matching-substring>
               <xsl:sequence select="substring-before(., '=')"/>
            </xsl:matching-substring>
        </xsl:analyze-string>
    </xsl:function>
    
    <xsl:function name="fn:getValue" as="xs:string+">
        <xsl:param name="str" as="xs:string"/>
       
        <xsl:analyze-string select="concat($str, '�')" regex='(("[^"]*")+|[^,]*)�'>
            <xsl:matching-substring>
                <xsl:sequence select="replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(
                                      replace(substring-after(., '='),
                                      $newlineWithSpace, ' '),
                                      $newlineWithoutSpace, ''),
                                      $u00C5.before, $u00C5.after),
                                      $u00C6.before, $u00C6.after),
                                      $u00C9.before, $u00C9.after),
                                      $u00CD.before, $u00CD.after),
                                      $u00D3.before, $u00D3.after),
                                      $u00D8.before, $u00D8.after),
                                      $u00DA.before, $u00DA.after),
                                      $u00DD.before, $u00DD.after),
                                      $u00E1.before, $u00E1.after),
                                      $u00E5.before, $u00E5.after),
                                      $u00E6.before, $u00E6.after),
                                      $u00E9.before, $u00E9.after),
                                      $u00ED.before, $u00ED.after),
                                      $u00F3.before, $u00F3.after),
                                      $u00F8.before, $u00F8.after),
                                      $u00FA.before, $u00FA.after),
                                      $u00FD.before, $u00FD.after),
                                      $u00a0.before, $u00a0.after),
                                      $u00c4.before, $u00c4.after),
                                      $u00d3.before, $u00d3.after),
                                      $u00d6.before, $u00d6.after),
                                      $u00dc.before, $u00dc.after),
                                      $u00df.before, $u00df.after),
                                      $u00f3.before, $u00f3.after),
                                      $u00f6.before, $u00f6.after),
                                      $u00fc.before, $u00fc.after),
                                      $u0104.before, $u0104.after),
                                      $u0105.before, $u0105.after),
                                      $u0106.before, $u0106.after),
                                      $u0107.before, $u0107.after),
                                      $u010C.before, $u010C.after),
                                      $u010D.before, $u010D.after),
                                      $u010E.before, $u010E.after),
                                      $u010F.before, $u010F.after),
                                      $u0118.before, $u0118.after),
                                      $u0119.before, $u0119.after),
                                      $u011A.before, $u011A.after),
                                      $u011B.before, $u011B.after),
                                      $u0141.before, $u0141.after),
                                      $u0142.before, $u0142.after),
                                      $u0143.before, $u0143.after),
                                      $u0144.before, $u0144.after),
                                      $u0147.before, $u0147.after),
                                      $u0148.before, $u0148.after),
                                      $u0158.before, $u0158.after),
                                      $u0159.before, $u0159.after),
                                      $u015a.before, $u015a.after),
                                      $u015b.before, $u015b.after),
                                      $u0160.before, $u0160.after),
                                      $u0161.before, $u0161.after),
                                      $u0164.before, $u0164.after),
                                      $u0165.before, $u0165.after),
                                      $u016E.before, $u016E.after),
                                      $u016F.before, $u016F.after),
                                      $u0179.before, $u0179.after),
                                      $u017D.before, $u017D.after),
                                      $u017E.before, $u017E.after),
                                      $u017a.before, $u017a.after),
                                      $u017b.before, $u017b.after),
                                      $u017c.before, $u017c.after),
                                      $u2013.before, $u2013.after),
                                      $u2013Z.before, $u2013Z.after),
                                      $u201d.before, $u201d.after),
                                      $u201e.before, $u201e.after),
                                      $u2215.before, $u2215.after),
                                      $u00e4.before, $u00e4.after),
                                      $lineFeedChar, '')"/>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <!--  -->
            </xsl:non-matching-substring>
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
        
        <xsl:variable name="inputFilePath" select="base-uri()"/>
        <xsl:variable name="stylesheetFilePath" select="base-uri(document(''))"/>
        
        <xsl:variable name="lines" select="tokenize($properties, '&#xa;')" as="xs:string+"/>
        
        <topic id="properties">
            <title><xsl:value-of select="$propertiesFile"/></title>
            <shortdesc>Input: <xsl:value-of select="$propertiesFile"/>; Output: <xsl:call-template name="getFilenameFromPath"><xsl:with-param name="string" select="$inputFilePath"/><xsl:with-param name="char" select="'/'"/></xsl:call-template>; Stylesheet: <xsl:call-template name="getFilenameFromPath"><xsl:with-param name="string" select="$stylesheetFilePath"/><xsl:with-param name="char" select="'/'"/></xsl:call-template></shortdesc>
            <body>
                <ul>
                    <xsl:for-each select="$lines">
                        <xsl:variable name="key" select="fn:getKey(.)" as="xs:string+"/>
                        <xsl:variable name="value" select="fn:getValue(.)" as="xs:string+"/>
                        <xsl:choose>
                            <xsl:when test="$key != '' and $value != ''">
                                <xsl:element name="li">
                                    <xsl:element name="keyword">
                                        <xsl:attribute name="id"><xsl:value-of select="$key"/></xsl:attribute>
                                        <xsl:value-of select="$value"/>
                                    </xsl:element>
                                </xsl:element>                                
                            </xsl:when>
                            <xsl:otherwise>
                                <!-- -->
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </ul>
            </body>
        </topic>
    </xsl:template>
    
</xsl:stylesheet>