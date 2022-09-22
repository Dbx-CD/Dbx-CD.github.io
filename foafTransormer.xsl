<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        xmlns:foaf="http://xmlns.com/foaf/0.1/"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
>
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"/>
            </head>
            <body>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Title</th>
                            <th scope="col">Given name</th>
                            <th scope="col">Family name</th>
                            <th scope="col">Nick</th>
                            <th scope="col">Homepage</th>
                            <th scope="col">School homepage</th>
                            <th scope="col">Knows</th>
                        </tr>
                    </thead>
                    <xsl:for-each select="rdf:RDF/foaf:Person">
                        <tr>
                            <td>
                                <xsl:value-of select="foaf:name"/>
                            </td>
                            <td>
                                <xsl:value-of select="foaf:title"/>
                            </td>
                            <td>
                                <xsl:value-of select="foaf:givenname"/>
                            </td>
                            <td>
                                <xsl:value-of select="foaf:family_name"/>
                            </td>
                            <td>
                                <xsl:value-of select="foaf:nick"/>
                            </td>
                            <td>
                                <a href="{foaf:homepage/@rdf:resource}">
                                    Link to homepage
                                </a>
                            </td>
                            <td>
                                <a href="{foaf:schoolHomepage/@rdf:resource}">
                                    Link to school homepage
                                </a>
                            </td>
                            <td>
                                <xsl:for-each select="foaf:knows">
                                    <p>
                                        <xsl:value-of select="foaf:Person/foaf:name"/>
                                    </p>
                                    <br/>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
