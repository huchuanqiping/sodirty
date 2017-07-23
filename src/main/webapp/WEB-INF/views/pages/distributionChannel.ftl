<@compress>
<!DOCTYPE html>
<html>
<head>


    <title>分销渠道</title>
    <meta charset="utf-8"/>
    <meta name="description" content="分销渠道管理"/>
    <meta name="keywords" content="分销渠道管理"/>

    <#include "/common/macro.ftl">

    <@css/>
    <link href="${csRoot}pages/distributionChannel.css" rel="stylesheet" type="text/css"/>
</head>
<body>

    <!-- content -->
    <#if _const_cas_user_?? && _const_cas_user_.menu ?? && _const_cas_user_.menu.childsList??>
        <#assign userInfo=_const_cas_user_>
        <#assign currentUrl=currentUrl>
    </#if>
    <@content>
      <div id="module-cnt"></div>
    </@content>
    <!-- /content -->

    <!-- footer -->
    <@footer/>

    <@regularui/>
    <script src="${nejRoot}"></script>
    <script>
        NEJ.define([
            'pro/pages/distributionChannel/index'
        ],function(m){
            m._$$Module._$allocate();
        });
    </script>
</body>
</html>
</@compress>