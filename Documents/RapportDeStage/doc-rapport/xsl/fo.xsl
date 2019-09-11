<?xml version='1.0'?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">

  <xsl:import href="../../globals/common-fo.xsl" />
  <!-- <xsl:include href="./titlepage.xsl" /> -->
  
  <!-- Biblio -->
  <xsl:param name="bibliography.numbered" select="1"/>
  
  <!-- Draft mode 
  <xsl:attribute-set name="normal.para.spacing">
    <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
    <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
    <xsl:attribute name="line-height">16pt</xsl:attribute>
  </xsl:attribute-set> -->

  <!-- Custom titlepage for the ENSI -->
  <xsl:template name="book.titlepage.recto">
    <!-- ENSI -->
    <fo:block-container absolute-position="absolute" top="0mm" left="0mm">
      <fo:block>
        <fo:external-graphic 
              src="img/logos/ensi.png" 
              content-width="4cm" 
              content-type="content-type:image/png" />
      </fo:block>
      <fo:block font-family="serif" font-size="12pt">6 bd maréchal Juin</fo:block>
      <fo:block font-family="serif" font-size="12pt" space-before="0pt">14050 CAEN Cedex 4</fo:block>
      <fo:block font-family="serif" font-size="14pt" space-before="8pt">Spécialité Informatique</fo:block>
      <fo:block font-family="serif" font-size="14pt" space-before="0pt">Option Monétique</fo:block>
      <fo:block font-family="serif" font-size="14pt" space-before="0pt">3ème Année</fo:block>
    </fo:block-container>
    
    <!-- ENSI vertical -->
    <fo:block-container absolute-position="absolute" bottom="0mm" left="0mm" display-align="after">
      <fo:block>
        <fo:external-graphic 
              src="img/logos/ensi-vertical-long.png" 
              content-height="20cm"
              content-type="content-type:image/png" />
      </fo:block>
    </fo:block-container>
    
    <!-- T-Systems -->
    <fo:block-container absolute-position="absolute" top="0mm" right="0mm">
      <fo:block text-align="right">
        <fo:external-graphic 
              src="img/logos/idealx.png" 
              content-width="5cm" 
              content-type="content-type:image/png" />
      </fo:block>
      <fo:block text-align="right" font-family="serif" font-size="12pt">IDEALX</fo:block>
      <fo:block text-align="right" font-family="serif" font-size="12pt">15-17 avenue de Ségur</fo:block>
      <fo:block text-align="right" font-family="serif" font-size="12pt">75007 PARIS</fo:block>
      <fo:block text-align="right" font-family="serif" font-size="12pt">http://www.idealx.com/</fo:block>
    </fo:block-container>
    
    <!-- Title -->
    <fo:block-container absolute-position="absolute" top="6cm" bottom="2cm" left="20mm" right="0cm" display-align="center">
      <fo:block text-align="center" font-family="serif" font-size="18pt" space-after="15mm">
        <xsl:value-of select="bookinfo/subtitle" />
      </fo:block>
      <fo:block text-align="center" space-after="0mm"><fo:leader leader-length="5cm" leader-pattern="rule" rule-thickness="1pt"/></fo:block>
      <fo:block text-align="center" font-family="serif" font-size="36pt" space-before="7.8mm" space-after="7.8mm">
        <xsl:value-of select="bookinfo/title" />
      </fo:block>
      <fo:block text-align="center" space-before="0mm"><fo:leader leader-length="5cm" leader-pattern="rule" rule-thickness="1pt"/></fo:block>
      <fo:block text-align="center" font-family="serif" font-size="14pt" space-before="20mm">
        <xsl:apply-templates select="bookinfo/author" />
      </fo:block>
    </fo:block-container>

    <!-- Suivi -->
    <fo:block-container absolute-position="absolute" bottom="0mm" left="20mm" display-align="after">
      <fo:block font-family="serif" font-size="14pt">Suivi Ensicaen:</fo:block>
      <fo:block font-family="serif" font-size="14pt">OTMANI Ayoub</fo:block>
      <fo:block font-family="serif" font-size="14pt" space-before="14pt">Suivi entreprise:</fo:block>
      <fo:block font-family="serif" font-size="14pt">BROSSARD Mathias</fo:block>
    </fo:block-container>

    <!-- Date -->
    <fo:block-container absolute-position="absolute" bottom="0mm" right="0mm" display-align="after">
      <fo:block text-align="right" font-family="serif" font-size="14pt">Mars - Septembre 2007</fo:block>
    </fo:block-container>

  </xsl:template>

  <!-- User defined page layout -->
  <xsl:template name="user.pagemasters">
    <!-- custom setup for title page(s) -->
    <fo:page-sequence-master master-name="custom-titlepage">
      <fo:repeatable-page-master-alternatives>
        <fo:conditional-page-master-reference master-reference="blank"
                                              blank-or-not-blank="blank"/>
        <fo:conditional-page-master-reference master-reference="custom-titlepage-first"
                                              page-position="first"/>
        <fo:conditional-page-master-reference master-reference="titlepage-odd"
                                              odd-or-even="odd"/>
        <fo:conditional-page-master-reference 
                                              odd-or-even="even">
          <xsl:attribute name="master-reference">
            <xsl:choose>
              <xsl:when test="$double.sided != 0">titlepage-even</xsl:when>
              <xsl:otherwise>titlepage-odd</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
        </fo:conditional-page-master-reference>
      </fo:repeatable-page-master-alternatives>
    </fo:page-sequence-master>

    <!-- Custom first title page -->
    <fo:simple-page-master master-name="custom-titlepage-first"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="20mm"
                           margin-bottom="20mm"
                           margin-left="20mm"
                           margin-right="20mm">
      <fo:region-body margin-bottom="0mm"
                      margin-top="0mm"
                      column-count="1">
      </fo:region-body>
    </fo:simple-page-master>
  </xsl:template>
  
  <!-- Wrapper override -->
  <xsl:template name="select.user.pagemaster">
    <xsl:param name="element"/>
    <xsl:param name="pageclass"/>
    <xsl:param name="default-pagemaster"/>

    <!-- Return my customized title page master name if for titlepage,
         otherwise return the default -->

    <xsl:choose>
      <xsl:when test="$default-pagemaster = 'titlepage'">
        <xsl:value-of select="'custom-titlepage'" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$default-pagemaster"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Header / Footer width -->
  <xsl:param name="header.column.widths" select="'1 5 1'"></xsl:param>
</xsl:stylesheet>

