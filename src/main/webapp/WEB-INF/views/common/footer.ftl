<#macro footer>
<footer>
    <!-- @NOPARSE -->
    <#if !localDev?exists && userInfo?exists && userInfo.name?exists>
        <script src="//feedback.kaola.com/javascripts/feedback.js" id="feedback-collect-tool" data-username="${(userInfo.name)!""}"></script>
    </#if>
    <!-- /@NOPARSE -->
</footer>
</#macro>