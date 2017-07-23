<@compress>
<!DOCTYPE html>
<html>
  <head>
    <title>示例页面</title>
    <meta charset="utf-8"/>
    <meta name="description" content="示例页面"/>
    <meta name="keywords" content="示例页面"/>

    <#include "/common/macro.ftl">

    <@css/>
    <link href="${csRoot}pages/demo.css" rel="stylesheet" type="text/css"/>
  </head>
  <body>

    <#if _const_cas_user_?? && _const_cas_user_.menu ?? && _const_cas_user_.menu.childsList??>
        <#assign userInfo=_const_cas_user_>
        <#assign currentUrl=currentUrl>
    </#if>
    <!-- content -->
    <@content>
      <div id="module-cnt"></div>
    </@content>
    <!-- /content -->
    <@regularui/>
    <script src="${nejRoot}"></script>
    <script>
        NEJ.define([
            'pro/pages/demo/index'
        ],function(m){
            m._$$Module._$allocate();
        });
    </script>
  </body>
</html>
</@compress>