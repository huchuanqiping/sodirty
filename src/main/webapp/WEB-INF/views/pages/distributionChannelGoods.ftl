<@compress>
<!DOCTYPE html>
<html>
  <head>

    <title>渠道商品管理</title>
    <meta charset="utf-8"/>
    <meta name="description" content="渠道商品管理"/>
    <meta name="keywords" content="渠道商品管理"/>

    <#include "/common/macro.ftl">

    <@css/>
    <link href="${csRoot}pages/distributionChannelGoods.css" rel="stylesheet" type="text/css" />
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
            warningStatus: ${warningStatus!"[]"},      // 预警状态
            importType: ${importTypes!"[]"},           // 贸易方式
            goodsStatus: ${goodsStatus!"[]"},          // 商品状态
            categories: ${categoryList!"[]"},         // 两级类目选项
            warehouse: ${storageList!"[]"},         // 仓库列表选项
        };
    </script>

    <@regularui/>
    <script src="${nejRoot}"></script>
    <script>
        NEJ.define([
            'pro/pages/distributionChannelGoods/index'
        ],function(m){
            m._$$Module._$allocate();
        });
    </script>
  </body>
</html>
</@compress>