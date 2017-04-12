<?xml version="1.0" encoding="UTF-8"?>
<!-- Odkaz na github: https://github.com/Eda190/EKnihovna -->
<!-- Vybrání všech uživatelů, kteří mají přístupové práva vyší nebo rovny dvoumi, a transformace do JSON -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="text"/>
	<xsl:template match="/">
		[ 
		<xsl:for-each select="Eknihovna_konfigurace/Oddeleni/Pristupove-prava/osoba[Pravomoce >= 2]"> 
			<xsl:sort select="Jmeno" order="descending"/>
			{
			"Jméno": "<xsl:value-of select="Jmeno"/>",
			"Príjmení": "<xsl:value-of select="Prijmeni"/>",
			"ID": "<xsl:value-of select="@id"/>",
			"Míra Oprávnění": "<xsl:value-of select="Pravomoce"/>",
			}<xsl:if test="position() != last()">,</xsl:if>
		</xsl:for-each>
		] 
	</xsl:template>
</xsl:stylesheet>