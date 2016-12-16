<?xml version="1.0" encoding="UTF-8"?>
<!--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

-->

<!--
    TODO: Describe this XSL file
    Author: Alexey Maslov

-->

<xsl:stylesheet xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                xmlns:dri="http://di.tamu.edu/DRI/1.0/"
                xmlns:mets="http://www.loc.gov/METS/"
                xmlns:xlink="http://www.w3.org/TR/xlink/"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:dim="http://www.dspace.org/xmlns/dspace/dim"
                xmlns:xhtml="http://www.w3.org/1999/xhtml"
                xmlns:mods="http://www.loc.gov/mods/v3"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="i18n dri mets xlink xsl dim xhtml mods dc">


    <xsl:template name="buildHeader">


        <header>
            <div class="navbar navbar-default navbar-static-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">

                        <button type="button" class="navbar-toggle" data-toggle="offcanvas">
                            <span class="sr-only">
                                <i18n:text>xmlui.mirage2.page-structure.toggleNavigation</i18n:text>
                            </span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>

                        <a href="{$context-path}/" class="navbar-brand">
                            <img src="{$theme-path}/images/logo.png" />
                        </a>



                        <div class="navbar-header pull-right visible-xs hidden-sm hidden-md hidden-lg">
                            <ul class="nav nav-pills pull-left ">

                                <xsl:if test="count(/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='page'][@qualifier='supportedLocale']) &gt; 1">
                                    <li id="ds-language-selection-xs" class="dropdown">
                                        <xsl:variable name="active-locale" select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='page'][@qualifier='currentLocale']"/>
                                        <button id="language-dropdown-toggle-xs" href="#" role="button" class="dropdown-toggle navbar-toggle navbar-link" data-toggle="dropdown">
                                            <b class="visible-xs glyphicon glyphicon-globe" aria-hidden="true"/>
                                        </button>
                                        <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="language-dropdown-toggle-xs" data-no-collapse="true">
                                            <xsl:for-each
                                                    select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='page'][@qualifier='supportedLocale']">
                                                <xsl:variable name="locale" select="."/>
                                                <li role="presentation">
                                                    <xsl:if test="$locale = $active-locale">
                                                        <xsl:attribute name="class">
                                                            <xsl:text>disabled</xsl:text>
                                                        </xsl:attribute>
                                                    </xsl:if>
                                                    <a>
                                                        <xsl:attribute name="href">
                                                            <xsl:value-of select="$current-uri"/>
                                                            <xsl:text>?locale-attribute=</xsl:text>
                                                            <xsl:value-of select="$locale"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                                select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='supportedLocale'][@qualifier=$locale]"/>
                                                    </a>
                                                </li>
                                            </xsl:for-each>
                                        </ul>
                                    </li>
                                </xsl:if>

                                <xsl:choose>
                                    <xsl:when test="/dri:document/dri:meta/dri:userMeta/@authenticated = 'yes'">
                                        <li class="dropdown">
                                            <button class="dropdown-toggle navbar-toggle navbar-link" id="user-dropdown-toggle-xs" href="#" role="button"  data-toggle="dropdown">
                                                <b class="visible-xs glyphicon glyphicon-user" aria-hidden="true"/>
                                            </button>
                                            <ul class="dropdown-menu pull-right" role="menu"
                                                aria-labelledby="user-dropdown-toggle-xs" data-no-collapse="true">
                                                <li>
                                                    <a href="{/dri:document/dri:meta/dri:userMeta/
                            dri:metadata[@element='identifier' and @qualifier='url']}">
                                                        <i18n:text>xmlui.EPerson.Navigation.profile</i18n:text>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="{/dri:document/dri:meta/dri:userMeta/
                            dri:metadata[@element='identifier' and @qualifier='logoutURL']}">
                                                        <i18n:text>xmlui.dri2xhtml.structural.logout</i18n:text>
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <li>
                                            <form style="display: inline" action="{/dri:document/dri:meta/dri:userMeta/
                            dri:metadata[@element='identifier' and @qualifier='loginURL']}" method="get">
                                                <button class="navbar-toggle navbar-link">
                                                    <b class="visible-xs glyphicon glyphicon-user" aria-hidden="true"/>
                                                </button>
                                            </form>
                                        </li>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>

        </header>

    </xsl:template>

</xsl:stylesheet>