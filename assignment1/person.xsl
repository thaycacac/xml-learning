<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Name</th>
      <th>Gender</th>
      <th>Contact</th>
    </tr>
    <xsl:for-each select="person_list/person">
    <tr>
      <td><xsl:value-of select="name"/></td>
      <td><xsl:value-of select="gender"/></td>
      <td>
        <p>phone: <xsl:value-of select="contact/phone"/></p>
        <p>email: <xsl:value-of select="contact/email"/></p>
        <p>address: <xsl:value-of select="contact/address"/></p>
      </td>
    </tr>
    </xsl:for-each>
  </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>