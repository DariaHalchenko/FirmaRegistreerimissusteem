<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Töötajate nimekiri</title>
                <style>
                    table {border-collapse: collapse;}
                    th, td {border: 1px solid black; padding: 5px;}
                </style>
            </head>
            <body>
                <h2>Töötajate nimekiri</h2>
                <!-- filter nimega -->
                <xsl:call-template name="filterByName">
                    <xsl:with-param name="nimi" select="''"/>
                </xsl:call-template>
            </body>
        </html>
    </xsl:template>
    <!-- filter nimega -->
    <xsl:template name="filterByName">
        <xsl:param name="nimi"/>
        <table>
            <tr>
                <th>Nimi</th>
                <th>Isikukood</th>
                <th>Amet</th>
                <th>Tunnitasu</th>
                <th>Kuupäev</th>
                <th>Sissepääs</th>
                <th>Väljapääs</th>
                <th>Tööaeg</th>
            </tr>
            <xsl:for-each select="Firma/Tootaja[contains(translate(@nimi,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), 
						  translate($nimi,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))]">
				<!-- Sorteerimine nime järgi tähestikulises järjekorras -->
				<xsl:sort select="@nimi" data-type="text" order="ascending"/>
                <xsl:for-each select="Igapaev">
                    <!-- Tööaeg -->
                    <xsl:variable name="sisse" select="substring-before(Aeg/@sissenemine, ':') * 60 + substring-after(Aeg/@sissenemine, ':')"/>
                    <xsl:variable name="valja" select="substring-before(Aeg/@valjumine, ':') * 60 + substring-after(Aeg/@valjumine, ':')"/>
                    <xsl:variable name="tunnid" select="floor(($valja - $sisse) div 60)"/>
                    <xsl:variable name="minutid" select="($valja - $sisse) mod 60"/>
                    <tr>
                        <td><xsl:value-of select="../@nimi"/></td>
                        <td><xsl:value-of select="../@isikukood"/></td>
                        <td><xsl:value-of select="../@amet"/></td>
                        <td><xsl:value-of select="../@tunnitasu"/></td>
                        <td><xsl:value-of select="@kuupaev"/></td>
                        <td><xsl:value-of select="Aeg/@sissenemine"/></td>
                        <td><xsl:value-of select="Aeg/@valjumine"/></td>
                        <td><xsl:value-of select="concat($tunnid, ':', format-number($minutid,'00'))"/></td>
                    </tr>
                </xsl:for-each>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>
