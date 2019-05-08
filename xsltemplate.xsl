<xsl:call-template name="secs-to-DDMMYYYY">
    <xsl:with-param name="secs" select="1557707400" />
    <!-- output = 13.05.2019 -->
</xsl:call-template>


<!-- Transform Epoch Date (in seconds) to formated date DD.MM.YYYY -->
<xsl:template name="secs-to-DDMMYYYY">
    <xsl:param name="secs"/>

    <xsl:param name="JDN" select="floor($secs div 86400) + 2440588"/>
    <xsl:param name="Sec" select="$secs mod 86400"/>

    <xsl:param name="f" select="$JDN + 1401 + floor((floor((4 * $JDN + 274277) div 146097) * 3) div 4) - 38"/>
    <xsl:param name="e" select="4*$f + 3"/>
    <xsl:param name="g" select="floor(($e mod 1461) div 4)"/>
    <xsl:param name="h" select="5*$g + 2"/>

    <xsl:param name="d" select="floor(($h mod 153) div 5 ) + 1"/>
    <xsl:param name="m" select="(floor($h div 153) + 2) mod 12 + 1"/>
    <xsl:param name="y" select="floor($e div 1461) - 4716 + floor((14 - $m) div 12)"/>

    <xsl:param name="H" select="floor($Sec div 3600)"/>
    <xsl:param name="M" select="floor($Sec mod 3600 div 60)"/>
    <xsl:param name="S" select="$Sec mod 60"/>

    <!-- update the line below if you want to change the output format -->
    <xsl:value-of select="concat(format-number($d, '00'),'.',format-number($m, '00'),'.',$y)" />

    <!-- uncomment the line below if you need the time as well -->
    <!-- <xsl:value-of select="concat(format-number($H, 'T00'), format-number($M, ':00'), format-number($S, ':00'))" /> -->

</xsl:template>
