<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="no"/>

    <xsl:template match="/doc">
      <html>
      <head>
        <title>
          <xsl:value-of select="assembly/name"/>
        </title>
      </head>
        <body>
          <xsl:apply-templates select="members/member"/>
      </body>
      </html>
    </xsl:template>

  <xsl:template match="member">
    <h1 class="member">
      <xsl:choose>
      <xsl:when test="contains(@name,'(')"><xsl:value-of select="concat(substring-before(substring(@name,3),'('),'()')"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="substring(@name,3)"/></xsl:otherwise>
        </xsl:choose>
    </h1>
    <p class="type">
      <xsl:choose>
        <xsl:when test="contains(@name,'#ctor')">コンストラクタ</xsl:when>
        <xsl:when test="substring(@name,1,1)='T'">クラス</xsl:when>
        <xsl:when test="substring(@name,1,1)='M'">メソッド</xsl:when>
        <xsl:when test="substring(@name,1,1)='F'">フィールド</xsl:when>
        <xsl:when test="substring(@name,1,1)='P'">パラメータ</xsl:when>
      <xsl:otherwise>エラー</xsl:otherwise>
      </xsl:choose>
    </p>
    <h2 class="member_description">内容</h2>
    <p><xsl:value-of select="summary"/></p>
    <xsl:if test="param">
    <h2 class="member_paramaters">引数</h2>
      <table class="member_paramaters">
        <xsl:apply-templates select="param"/>
      </table>
      </xsl:if>
  </xsl:template>
  
<xsl:template match="param">
  <tr>
    <th><xsl:value-of select="@name"/></th>
    <td><xsl:choose><xsl:when test=".=''">説明省略</xsl:when>
  <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise></xsl:choose></td>
  </tr>
  </xsl:template>

</xsl:stylesheet>
