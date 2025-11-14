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
				<table>
					<tr>
						<th>Nimi</th>
						<th>Isikukood</th>
						<th>Amet</th>
						<th>Tunnitasu</th>
						<th>Kuupäev</th>
					</tr>

					<xsl:for-each select="Firma/Tootaja">
						<xsl:for-each select="Igapaev">
							<tr>
								<td>
									<xsl:value-of select="../@nimi"/>
								</td>
								<td>
									<xsl:value-of select="../@isikukood"/>
								</td>
								<td>
									<xsl:value-of select="../@amet"/>
								</td>
								<td>
									<xsl:value-of select="../@tunnitasu"/>
								</td>
								<td>
									<xsl:value-of select="@kuupaev"/>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:for-each>

				</table>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
