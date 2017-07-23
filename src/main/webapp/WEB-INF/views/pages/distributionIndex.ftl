<@compress>
<!DOCTYPE html>
<html>
<head>

    <title>平台总览</title>
    <meta charset="utf-8"/>
    <meta name="description" content="平台总览"/>
    <meta name="keywords" content="平台总览"/>

    <#include "/common/macro.ftl">

    <@css/>
    <link href="${csRoot}pages/distributionIndex.css" rel="stylesheet" type="text/css"/>
</head>
<body>

    <!-- content -->
    <#if _const_cas_user_?? && _const_cas_user_.menu ?? && _const_cas_user_.menu.childsList??>
        <#assign userInfo=_const_cas_user_>
        <#assign currentUrl=currentUrl>
    </#if>
    <@content>
      <div id="module-cnt">
          <article class="" style="min-width:1500px;height: 100%;">
              <#--<h2 class="m-title">平台总览</h2>-->
              <!-- 分页信息 -->
              <section class="m-wrap m-wrap-1 f-cb">
                  <iframe class="u-iframe" src="http://kl.da.netease.com/report/2534"></iframe></div>
              </section>
          </article>
      </div>
    </@content>

    <!-- footer -->
    <@footer/>

    <script src="${nejRoot}"></script>
    <script>
        NEJ.define([
            'pro/pages/distributionIndex/index'
        ],function(m){
            m._$$Module._$allocate();
        });
    </script>
</body>
</html>
</@compress>