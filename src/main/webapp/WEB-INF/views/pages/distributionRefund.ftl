<@compress>
<!DOCTYPE html>
<html>
  <head>

    <title>退税管理</title>
    <meta charset="utf-8"/>
    <meta name="description" content="退税管理"/>
    <meta name="keywords" content="退税管理"/>

    <#include "/common/macro.ftl">

    <@css/>
    <link href="${csRoot}pages/distributionRefund.css" rel="stylesheet" type="text/css" />
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

    <script>
        var global = {
            applicationStatus: ${applicationStatus!"[]"},
            channelList: ${channelList!"[]"},
            userId: '${userInfo.id!""}'
        };
    </script>

    <@regularui/>
    <script src="${nejRoot}"></script>
    <script>
        NEJ.define([
            'pro/pages/distributionRefund/index'
        ],function(m){
            m._$$Module._$allocate();
        });
    </script>
  </body>
</html>
</@compress>