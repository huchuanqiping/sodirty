<link rel="shortcut icon" href="/res/favicon.ico">
<link rel="bookmark" href="/res/favicon.ico">
<#include "./config.ftl">

<#macro css>
  <link href="${csRoot}base.css" rel="stylesheet" type="text/css"/>
</#macro>

<#macro regularui>
    <script src="/src/javascript/lib/regularjs/dist/regular.js" charset="utf-8" ></script>
    <script src="/src/javascript/lib/regular-ui/js/regular-ui.js" charset="utf-8" ></script>
</#macro>

<#-- 左侧菜单 -->
<#function isFold list currentUrl>
  <#--默认折叠-->
  <#local flag = true />
  <#list list as item>
    <#if item.url == currentUrl>
      <#local flag = false />
    </#if>
  </#list>
  <#return flag>
</#function>


<#macro sider userInfo={} currentUrl="">
  <#assign menuInfo = userInfo.menu.childsList>
  <div class="g-sd" id="j-fold-side">
    <div class="g-hd">
      <a href="/" class="u-logo">分销系统V2.0</a>
      <div class="u-info">
        <h2 class='u-title'>分销系统V2.0</h2>
        <p class="u-user">${(userInfo.name)!''}</p>
        <p class="u-logout"><a href="/logout">退出</a></p>
      </div>
    </div>
    <#-- 输出一级菜单 -->
    <div id="j-side-menu" class="m-navwrap">
      <#list menuInfo as menu>
        <#assign subMenu = menu.childsList/>
        <div class="m-nav <#if currentUrl == menu.url || !isFold(subMenu, currentUrl)>z-crt</#if><#if subMenu?size==0> z-uniq</#if>">
          <h3 class="nav-header" <#if subMenu?size!=0>foldable=true</#if> >
            <#if !menu.url?? || menu.url == '' || menu.url == currentUrl>
              <a href="javascript:void(0);" <#if subMenu?size!=0>foldable=true</#if>>
            <#else>
              <a href="${menu.url}" <#if subMenu?size!=0>foldable=true</#if>>
            </#if>
            ${menu.name}
            </a>
          </h3>
          <#if (subMenu?size>0)>
            <ul class="nav-pills">
              <#--输出二级菜单 -->
              <#list subMenu as sub>
                <li <#if sub.url == currentUrl>class="z-crt"</#if>>
                  <#if !sub.link?? || sub.link == '' || sub.url == currentUrl>
                    <a href="javascript:void(0);">${sub.name}</a>
                  <#else>
                    <a href="${sub.url}">${sub.name}</a>
                  </#if>
                </li>
              </#list>
            </ul>
          </#if>
        </div>
      </#list>
    </div>
    <a id="j-fold-toggle" href="javascript:void(0);" class="u-toggle"></a>
  </div>
</#macro>

<#macro content>
  <!-- Page Content Here -->
  <@sider userInfo=userInfo currentUrl=currentUrl/>

  <div class="g-bd" id="j-fold-body">
      <div class="g-bdc">
          <#nested>
      </div>
  </div>
</#macro>

<#-- 页面底部footer -->
<#include "./footer.ftl">