<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  version="1.0">
	
  <xsl:output method="xml"/>
  
      
  <!-- ########################### decimal-format ########################### -->
  <!-- format for euros -->
  <xsl:decimal-format name="euro" decimal-separator="," grouping-separator="."  NaN=""/>

  
  <!-- ########################### global.imageBaseDir ########################### -->
  <!-- Basedirectory for Logos and Images. Should be set by calling appilication -->
  <xsl:param name="global.imageBaseDir" select="'file:D:\ibm\vaj\ide\project_resources\IBM WebSphere Test Environment\hosts\default_host\xfleet_app\web\img\'"/>
  
  <!-- ########################### Address ########################### -->
  <!-- Renders a block containing the user address, expects User node as Parameter -->
  <xsl:template name="Address" >
    <xsl:param name="GlobalParameters"/>
    <xsl:param name="User"/>
    <xsl:param name="font-size-sender" select="'6pt'" />
    <xsl:param name="font-size" select="'8pt'" />

    <fo:block  space-after="0.3cm" font-size="{$font-size-sender}">
      <fo:block>
        <xsl:value-of select="$GlobalParameters/Parameter[@name='G_OFFER_SENDER_1']/@value" />
      </fo:block>
      <fo:block>
        <xsl:value-of select="$GlobalParameters/Parameter[@name='G_OFFER_SENDER_2']/@value" />
      </fo:block>
    </fo:block>
      
    <fo:block font-size="{$font-size}">
      <fo:block><xsl:value-of select="$User/companyDisplayname" /></fo:block>
      <fo:block><xsl:value-of select="$User/firstname" /><xsl:text> </xsl:text><xsl:value-of select="$User/surname" /></fo:block>
      <fo:block><xsl:value-of select="$User/street" /><xsl:text> </xsl:text><xsl:value-of select="$User/streetnumber" /></fo:block>
      <fo:block space-before="0.5cm"><xsl:value-of select="$User/postalCode" /><xsl:text> </xsl:text><xsl:value-of select="$User/town" /></fo:block>
    </fo:block>
  
  <!-- End Address -->
  </xsl:template>
  
  <!-- ########################### OfferHeaderLong ########################### -->
  <!-- Renders a stack of blocks containing the DC Logo, OfferNumber, Date, Contact, Tel and Pagenumber -->
  <xsl:template name="OfferHeaderLong" >
    <xsl:param name="Offer"/>
    <xsl:param name="User"/>
    <xsl:param name="font-size" select="'8pt'" />
    <xsl:param name="space-after-logo" select="'0.5cm'" />
    <xsl:param name="space-after-angebot" select="'0.5cm'" />
    <xsl:param name="table-width" select="'4.9cm'" />
    <xsl:param name="column1-width" select="'1.9cm'" />
    <xsl:param name="column2-width" select="'3.0cm'" />

  
    <!-- DCSFM Logo-->
    <fo:block>
      <fo:external-graphic src="{$global.imageBaseDir}logo.gif"/>
    </fo:block>
    <fo:block padding-after="{$space-after-logo}">
      <fo:external-graphic src="{$global.imageBaseDir}logo_title.gif"/>
    </fo:block>
    
    <fo:block font-size="{$font-size}">
      <fo:table  table-layout="fixed" width="{$table-width}">
        
        <fo:table-column column-width="{$column1-width}" />
        <fo:table-column column-width="{$column2-width}" />
        
        <fo:table-body>
	   
	   <!-- 1. Row (OfferHeaderLong/Angebot) -->
          <fo:table-row>
	     
	     <fo:table-cell>
	       <fo:block space-after="{$space-after-angebot}" font-weight="bold" color="#808080">Angebot:</fo:block>
            </fo:table-cell>
	     
	     <fo:table-cell>
              <fo:block><xsl:value-of select="$Offer/OfferNumber" /></fo:block>
	     </fo:table-cell>
	   
	   </fo:table-row>
	   
	   <!-- 2. Row (OfferHeaderLong/Datum) -->
	   <fo:table-row>
	   
	     <fo:table-cell>
	       <fo:block color="#808080">Datum:</fo:block>
	     </fo:table-cell>
	     
	     <fo:table-cell>
	       <fo:block><xsl:value-of select="$Offer/OfferDate" /></fo:block>
	     </fo:table-cell>
          
          </fo:table-row>
	               
	   <!-- 3. Row (OfferHeaderLong/Bearbeiter) -->
	   <fo:table-row>
            
            <fo:table-cell>
	       <fo:block color="#808080">Bearbeiter:</fo:block>
	     </fo:table-cell>
	     
	     <fo:table-cell>
	       <fo:block><xsl:value-of select="$User/DCContactPerson" /></fo:block>
	     </fo:table-cell>
	   
	   </fo:table-row>
	   
	   <!-- 4. Row (OfferHeaderLong/Tel) -->
          <fo:table-row>
          
            <fo:table-cell>
              <fo:block color="#808080">Tel.:</fo:block>
            </fo:table-cell>
            
            <fo:table-cell>
              <fo:block><xsl:value-of select="$User/DCPhone" /></fo:block>
            </fo:table-cell>
          </fo:table-row>
          
          <!-- 5. Row (OfferHeaderLong/Seite) -->
          <fo:table-row>
            
            <fo:table-cell>
              <fo:block color="#808080">Seite:</fo:block>
            </fo:table-cell>
            
            <fo:table-cell>
              <fo:block><fo:page-number/> von <fo:page-number-citation ref-id="end"/></fo:block>
            </fo:table-cell>
           
          </fo:table-row>
          
        </fo:table-body>
	             
      </fo:table>
    
    </fo:block>
  
  <!-- End OfferHeaderLong -->
  </xsl:template>
  
  <!-- ########################### OfferHeaderShort ########################### -->
  <!-- Renders a block containing the OfferNumber, Date, Contact and Pagenumber -->
  <xsl:template name="OfferHeaderShort" >
    <xsl:param name="Offer"/>
    <xsl:param name="User"/>
    <xsl:param name="font-size" select="'8pt'" />
    <xsl:param name="table-width" select="'4.9cm'" />
    <xsl:param name="column1-width" select="'1.9cm'" />
    <xsl:param name="column2-width" select="'3.0cm'" />
    
    <fo:block font-size="{$font-size}">
    
      <fo:table  table-layout="fixed" width="{$table-width}">
        <fo:table-column column-width="{$column1-width}" />
        <fo:table-column column-width="{$column2-width}" />
        
        <fo:table-body>
  
          <!-- 1. Row (OfferHeaderShort/Angebot) -->
          <fo:table-row>
       
            <fo:table-cell>
              <fo:block color="#808080">Angebot:</fo:block>
            </fo:table-cell>
       
            <fo:table-cell>
              <fo:block><xsl:value-of select="$Offer/OfferNumber" /></fo:block>
            </fo:table-cell>
            
          </fo:table-row>
                 
          <!-- 2. Row (OfferHeaderShort/Datum) -->
          <fo:table-row>
          
            <fo:table-cell>
              <fo:block color="#808080">Datum:</fo:block>
            </fo:table-cell>
       
            <fo:table-cell>
              <fo:block><xsl:value-of select="$Offer/OfferDate" /></fo:block>
            </fo:table-cell>
       
          </fo:table-row>
  
          <!-- 3. Row (OfferHeaderShort/Bearbeiter) -->
          <fo:table-row>
          
            <fo:table-cell>
              <fo:block color="#808080">Bearbeiter:</fo:block>
            </fo:table-cell>
       
            <fo:table-cell>
              <fo:block><xsl:value-of select="$User/DCContactPerson" /></fo:block>
            </fo:table-cell>
            
          </fo:table-row>
  
          <!-- 4. Row (OfferHeaderShort/Seite) -->
          <fo:table-row>
     
            <fo:table-cell>
              <fo:block color="#808080">Seite:</fo:block>
            </fo:table-cell>
           
            <fo:table-cell>
              <fo:block><fo:page-number/> von <fo:page-number-citation ref-id="end"/></fo:block>
            </fo:table-cell>
       
          </fo:table-row>
                 
        </fo:table-body>
               
      </fo:table>

    </fo:block>
    
  <!-- End OfferHeaderShort -->
  </xsl:template>
  
  <!-- ########################### VehicleDescription########################### -->
  <!-- Renders a stack of blocks with a core description of the vehicle -->
  <xsl:template name="VehicleDescription">
    <xsl:param name="Vehicle"/>
    <xsl:param name="Offer"/>    

    <!-- Line 1 Hersteller + Bezeichnung -->
    <fo:block>
      <xsl:value-of select="$Vehicle/hersteller/herstellerBezeichnung" /><xsl:text> </xsl:text>
      <xsl:value-of select="$Vehicle/bezeichnung" />
    </fo:block>

    <!-- Line 2 Modell + Type -->                
    <fo:block>
      <xsl:value-of select="$Vehicle/modell/modellBezeichnung"/><xsl:text> </xsl:text>
      <xsl:value-of select="$Vehicle/aufbau/fahrzeugKategorieBezeichnung"/>
    </fo:block>

    <!-- Line 3 Türen + PS + ccm -->
    <fo:block>
      <xsl:value-of select="$Vehicle/anzahlTueren"/>-türig, 
      <xsl:value-of select="$Vehicle/leistungPS"/> PS, 
      <xsl:value-of select="$Vehicle/hubraum"/> ccm Hubraum
    </fo:block>
    
    <!-- Line 4 Schwackecode-->                
    <fo:block>
      Code:<xsl:text> </xsl:text><xsl:value-of select="$Offer/CalculationRequest/GlobalComponent/Parameters/Parameter[@name='G_FZG_ID']/@value" />
    </fo:block>

    <!-- Line 5 Lackierung -->                
    <fo:block>
      <xsl:value-of select="$Vehicle/aussenAusstattung/optionLangtext" /><xsl:text> </xsl:text>
      <xsl:value-of select="$Vehicle/aussenAusstattung/auspraegungsBezeichnung" />
    </fo:block>
    
    <!-- Line 6 Polsterung -->                
    <fo:block>
      <xsl:value-of select="$Vehicle/innenAusstattung/optionLangtext" /><xsl:text> </xsl:text>
      <xsl:value-of select="$Vehicle/innenAusstattung/auspraegungsBezeichnung" />
    </fo:block>

  <!-- End VehicleDescription -->
  </xsl:template>
  
  <!-- ########################### OptionsWithoutPrice Frame ########################### -->
  <!-- Renders a table with all options of the vehicle -->
  <xsl:template name="OptionsWithoutPrice">
    <xsl:param name="Options"/>
    <xsl:param name="table-width" select="'7.5cm'" />
    <xsl:param name="column1-width" select="'0.2cm'" />
    <xsl:param name="column2-width" select="'7.3cm'" />
        
    <fo:table table-layout="fixed" width="{$table-width}">
      <fo:table-column column-width="{$column1-width}" />
      <fo:table-column column-width="{$column2-width}" />
      
      <fo:table-body>
        <xsl:apply-templates select="$Options" mode="withoutPrice"/>
      </fo:table-body>
      
    </fo:table>
  </xsl:template>
  
  <xsl:template match="sonderAusstattungen/sonderAusstattungen | serienAusstattungen/Option " mode="withoutPrice">
    <fo:table-row>
      <fo:table-cell>
        <fo:block>&#x2022;</fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block><fo:block><xsl:value-of select="optionLangtext"/></fo:block></fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>
  
  <!-- ########################### OptionsWithPrice Frame ########################### -->
  <!-- Renders a table with all options of the vehicle -->
  <xsl:template name="OptionsWithPrice">
    <xsl:param name="Options"/>
    <xsl:param name="table-width" select="'7.5cm'" />
    <xsl:param name="column1-width" select="'0.2cm'" />
    <xsl:param name="column2-width" select="'5.8cm'" />
    <xsl:param name="column3-width" select="'1.5cm'" />
        
    <fo:table table-layout="fixed" width="{$table-width}">
      <fo:table-column column-width="{$column1-width}" />
      <fo:table-column column-width="{$column2-width}" />
      <fo:table-column column-width="{$column3-width}" />

      <fo:table-body>
        <xsl:apply-templates select="$Options" mode="withPrice"/>
      </fo:table-body>
      
    </fo:table>
  </xsl:template>
  
  <xsl:template match="sonderAusstattungen/sonderAusstattungen | serienAusstattungen/Option " mode="withPrice">
    <fo:table-row>
      <fo:table-cell>
        <fo:block>&#x2022;</fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block><fo:block><xsl:value-of select="optionLangtext"/></fo:block></fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="right">
        <fo:block><xsl:value-of select="format-number( optionPreis, '###.###.##0,00 €', 'euro' )"/></fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>



</xsl:stylesheet>
