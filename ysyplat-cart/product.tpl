<link href="/themes/cart/ysyplat-cart/assets/css/icons.min.css?v={$Ver}" rel="stylesheet" type="text/css" />
<link href="/themes/cart/ysyplat-cart/assets/fonts/iconfont.css?v={$Ver}" rel="stylesheet">

<style>
  * { box-sizing: border-box; }
  body { margin:0; padding:0; background:#f5f7fa; font-family:-apple-system,BlinkMacSystemFont,"Segoe UI","PingFang SC","Microsoft YaHei",sans-serif; color:#1e1b2e; }
  a { color:#6366f1; text-decoration:none; }
  a:hover { color:#4f46e5; }

  /* 顶栏 */
  .ysy-cart-topbar { position:fixed; top:0; left:0; right:0; z-index:1030; display:flex; align-items:center; justify-content:space-between; height:56px; padding:0 20px; background:#fff; box-shadow:0 1px 4px rgba(0,0,0,0.08); }
  .ysy-cart-topbar__left { display:flex; align-items:center; gap:0.6rem; text-decoration:none; }
  .ysy-cart-topbar__left img { height:28px; }
  .ysy-cart-topbar__name { color:#1e1b2e; font-weight:700; font-size:1rem; }
  .ysy-cart-topbar__right { display:flex; align-items:center; gap:0.6rem; }
  .ysy-cart-topbar__link { display:inline-flex; align-items:center; gap:0.3rem; color:#4b4662; font-size:0.85rem; font-weight:500; text-decoration:none; padding:0.35rem 0.7rem; border-radius:0.6rem; transition:all 0.2s; }
  .ysy-cart-topbar__link:hover { background:#f5f3ff; color:#6366f1; }

  /* 主容器 */
  .ysy-cart-wrap { max-width:1280px; margin:56px auto 0; padding:20px; }

  /* 布局 */
  .ysy-cart-layout { display:flex; gap:16px; }
  .ysy-cart-sidebar { width:240px; flex-shrink:0; }
  .ysy-cart-products { flex:1; min-width:0; }

  /* 侧边栏 */
  .ysy-sidebar-box { background:#fff; border:1px solid #ede9fe; border-radius:12px; box-shadow:0 2px 8px rgba(0,0,0,0.04); overflow:hidden; }
  .ysy-sidebar-search { padding:10px 12px; border-bottom:1px solid #f0ecff; }
  .ysy-sidebar-search input { width:100%; padding:7px 12px; border:1px solid #e5e3f0; border-radius:8px; font-size:13px; outline:none; transition:all 0.2s; }
  .ysy-sidebar-search input:focus { border-color:#6366f1; box-shadow:0 0 0 3px rgba(99,102,241,0.1); }
  .ysy-category-tree { padding:6px 0; }
  .ysy-category-item { margin-bottom:1px; }
  .ysy-category-header { display:flex; justify-content:space-between; align-items:center; padding:8px 12px; cursor:pointer; border-radius:8px; margin:0 4px; transition:all 0.15s; }
  .ysy-category-header:hover { background:#f5f3ff; }
  .ysy-category-link { color:#4b4662; text-decoration:none; font-weight:500; font-size:14px; flex:1; }
  .ysy-category-link:hover { color:#6366f1; }
  .ysy-category-link.active { color:#6366f1; font-weight:600; }
  .ysy-category-children { display:none; }
  .ysy-category-children.expanded { display:block; }
  .ysy-category-child-link { display:block; padding:6px 12px 6px 24px; color:#6b6786; text-decoration:none; font-size:13px; border-radius:8px; margin:0 4px; transition:all 0.15s; }
  .ysy-category-child-link:hover { color:#6366f1; background:#f5f3ff; }
  .ysy-category-child-link.active { color:#6366f1; background:#ede9fe; font-weight:600; }
  .ysy-category-expand { display:inline-block; width:0; height:0; border-left:4px solid transparent; border-right:4px solid transparent; border-top:4px solid #9ca3af; transition:all 0.25s; margin-left:6px; }
  .ysy-category-expand.expanded { transform:rotate(180deg); border-top-color:#6366f1; }

  /* 标语 */
  .ysy-product-tagline { padding:8px 12px; background:#f5f3ff; border:1px solid #ede9fe; border-left:3px solid #6366f1; border-radius:8px; color:#4b4662; font-size:13px; margin-bottom:12px; }

  /* 商品网格 */
  .ysy-product-row { display:flex; flex-wrap:wrap; margin:-6px; }
  .ysy-product-col { padding:6px; display:flex; }
  @media(min-width:1200px){.ysy-product-col{flex:0 0 25%;max-width:25%}}
  @media(max-width:1200px) and (min-width:768px){.ysy-product-col{flex:0 0 33.33%;max-width:33.33%}}
  @media(max-width:768px) and (min-width:576px){.ysy-product-col{flex:0 0 50%;max-width:50%}}
  @media(max-width:576px){.ysy-product-col{flex:0 0 100%;max-width:100%}}

  /* 商品卡片 */
  .ysy-cart-item { background:#fff; border:1px solid #ede9fe; border-radius:12px; overflow:hidden; transition:all 0.25s; flex:1; display:flex; flex-direction:column; }
  .ysy-cart-item:hover { border-color:#a5b4fc; box-shadow:0 8px 24px rgba(99,102,241,0.12); transform:translateY(-2px); }
  .ysy-cart-item .card-body { flex:1; display:flex; flex-direction:column; padding:14px; }
  .ysy-cart-item .product-header { display:flex; align-items:center; justify-content:space-between; margin:-14px -14px 8px -14px; padding:8px 14px; background:#f9f8ff; border-bottom:1px solid #f0ecff; }
  .ysy-cart-item h5 { font-size:14px; font-weight:600; color:#1e1b2e; margin:0; }
  .ysy-cart-item .card-text { font-size:12px; color:#6b6786; line-height:1.5; margin-bottom:6px; }
  .ysy-cart-item .stock-info { color:#9ca3af; font-size:11px; white-space:nowrap; }
  .ysy-cart-item .separator { color:#d1cfe3; margin:0 6px; }
  .ysy-cart-item .sale-price { font-size:18px; font-weight:700; color:#ef4444; margin-bottom:2px; }
  .ysy-cart-item .original-price { font-size:11px; color:#9ca3af; text-decoration:line-through; }
  .ysy-cart-item .trial-price { font-size:11px; color:#fff; background:#f59e0b; padding:1px 6px; border-radius:8px; display:inline-block; margin-top:3px; }
  .ysy-cart-item .card-footer { padding:0; border-top:1px solid #f0ecff; }
  .ysy-cart-item .card-footer a { display:block; width:100%; line-height:40px; text-align:center; background:linear-gradient(135deg,#6366f1,#8b5cf6); color:#fff; font-weight:600; font-size:13px; text-decoration:none; transition:all 0.2s; }
  .ysy-cart-item .card-footer a:hover { background:linear-gradient(135deg,#5457e5,#7c3aed); }
  .ysy-cart-item .card-footer a[style*="not-allowed"] { background:#e9ecef !important; color:#9ca3af !important; }

  /* 售罄标签 */
  .saleout-tag { position:absolute; top:6px; right:6px; background:rgba(239,68,68,0.9); color:#fff; padding:2px 8px; border-radius:8px; font-size:10px; font-weight:500; z-index:5; }

  /* 分页 */
  .pagination { list-style:none; display:flex; gap:4px; padding:0; margin:16px 0 0; justify-content:center; }
  .pagination .page-link { color:#6366f1; border:1px solid #ede9fe; border-radius:6px; font-size:13px; padding:5px 10px; text-decoration:none; transition:all 0.15s; }
  .pagination .page-link:hover { background:#6366f1; color:#fff; border-color:#6366f1; }
  .pagination .page-item.active .page-link { background:#6366f1; border-color:#6366f1; color:#fff; }

  /* 警告框 */
  .ysy-warning-box { padding:10px 14px; background:#fef2f2; border:1px solid #fecaca; border-left:3px solid #ef4444; border-radius:8px; color:#b91c1c; font-size:12px; line-height:1.6; margin-top:16px; }

  /* 移动端 */
  @media(max-width:768px){
    .ysy-cart-layout { flex-direction:column; }
    .ysy-cart-sidebar { width:100%; }
  }
</style>

<!-- 顶栏 -->
<div class="ysy-cart-topbar">
  <a href="{$Setting.web_jump_url}" class="ysy-cart-topbar__left">
    {if $Setting.web_logo}<img src="{$Setting.web_logo}" alt="">{/if}
    <span class="ysy-cart-topbar__name">{$Setting.company_name}</span>
  </a>
  <div class="ysy-cart-topbar__right">
    <a href="/cart" class="ysy-cart-topbar__link"><i class="bx bx-cart-alt"></i>购物车</a>
    {if $Userinfo}
    <a href="/clientarea" class="ysy-cart-topbar__link"><i class="bx bx-user"></i>{$Userinfo.user.username}</a>
    <a href="/logout" class="ysy-cart-topbar__link"><i class="bx bx-power-off"></i></a>
    {else}
    <a href="/login" class="ysy-cart-topbar__link"><i class="bx bx-log-in"></i>登录</a>
    {/if}
  </div>
</div>

<div class="ysy-cart-wrap">
  <div class="ysy-cart-layout">
    <!-- 左侧分类 -->
    <div class="ysy-cart-sidebar">
      <div class="ysy-sidebar-box">
        <div class="ysy-sidebar-search">
          <input type="text" id="product-search-input" placeholder="搜索产品...">
        </div>
        <div class="ysy-category-tree">
          {foreach $Cart.product_groups as $index=>$first}
          <div class="ysy-category-item">
            <div class="ysy-category-header" data-fid="{$first.id}">
              <a href="/cart?fid={$first.id}{if $Get.site}&site={$Get.site}{/if}" class="ysy-category-link">{$first.name}</a>
              <span class="ysy-category-expand"></span>
            </div>
            <div class="ysy-category-children">
              {foreach $first.second as $secondItem}
              <a href="/cart?fid={$first.id}&gid={$secondItem.id}{if $Get.site}&site={$Get.site}{/if}" class="ysy-category-child-link">{$secondItem.name}</a>
              {/foreach}
            </div>
          </div>
          {/foreach}
        </div>
      </div>
    </div>

    <!-- 右侧商品 -->
    <div class="ysy-cart-products">
      <div class="ysy-product-tagline" id="active-product-tagline">
        {foreach $Cart.product_groups as $key => $first}
          {if $first.id == $Get.fid || (!$Get.fid && $key == 0)}
            {if $Get.gid}
              {foreach $first.second as $second}
                {if $second.id == $Get.gid && $second.tagline}{:htmlspecialchars_decode($second.tagline)}{/if}
              {/foreach}
            {elseif $first.tagline}{:htmlspecialchars_decode($first.tagline)}{/if}
          {/if}
        {/foreach}
      </div>

      <div class="ysy-product-row">
        {foreach $Cart.products as $list}
        <div class="ysy-product-col">
          <div class="ysy-cart-item" style="position:relative;">
            {if $list.stock_control==1 && $list.qty<=0}
            <span class="saleout-tag">已售罄</span>
            {/if}
            <div class="card-body">
              <div class="product-header">
                <h5>{$list.name}</h5>
                {if $list.stock_control==1}
                <span class="separator">|</span>
                <span class="stock-info">库存:{$list.qty}</span>
                {/if}
              </div>
              <div class="card-text">{:htmlspecialchars_decode($list.description)}</div>
              <div style="margin-top:auto;padding-top:6px;">
                <div class="sale-price">
                  {$Cart.currency.prefix} {if $list.sale_price>0}{$list.sale_price}{else}{$list.product_price}{/if} {$Cart.currency.suffix}
                  {if $list.ontrial==1}
                  <span class="trial-price">试用 {$Cart.currency.prefix}{$list.ontrial_setup_fee+$list.ontrial_price}/{$list.ontrial_cycle}{$list.ontrial_cycle_type=='day'?'天':'时'}</span>
                  {/if}
                </div>
                {if $list.sale_price>0}
                <div style="display:flex;align-items:center;gap:4px;">
                  <span style="color:#ef4444;font-size:10px;">[{:number_format($list.sale_price/$list.product_price*10,1)}折]</span>
                  <span class="original-price">原价:{$Cart.currency.prefix}{$list.product_price}/{$list.billingcycle_zh}</span>
                </div>
                {else}
                <div style="color:#9ca3af;font-size:11px;">/ {$list.billingcycle_zh}</div>
                {/if}
              </div>
            </div>
            <div class="card-footer">
              {if $list.stock_control==1 && $list.qty<=0}
              <a href="javascript:void(0)" style="cursor:not-allowed;background:#e9ecef!important;color:#9ca3af!important;">已售罄</a>
              {else}
              <a href="/cart?action=configureproduct&pid={$list.id}{if $Get.site}&site={$Get.site}{/if}">立即选购</a>
              {/if}
            </div>
          </div>
        </div>
        {/foreach}
      </div>

      <ul class="pagination">
        {$Pages}
      </ul>

      <div class="ysy-warning-box">
        <i class="fas fa-exclamation-triangle" style="margin-right:4px;"></i>
        本站云产品禁止用于违法违规用途。购买即视为同意相关条款。
      </div>
    </div>
  </div>
</div>

<script>
  $(function(){
    // 分类折叠 - 仅用 expanded 类控制，不用 slideToggle 避免冲突
    $('.ysy-category-header').click(function(e){
      if(e.target.tagName==='A'){e.preventDefault()}
      var children=$(this).next('.ysy-category-children');
      var expand=$(this).find('.ysy-category-expand');
      if(children.hasClass('expanded')){
        children.removeClass('expanded');
        expand.removeClass('expanded');
      }else{
        children.addClass('expanded');
        expand.addClass('expanded');
      }
    });

    // 选中标记 - 仅展开当前选中的分类，无选中则全部隐藏
    var fid='{$Think.get.fid}',gid='{$Think.get.gid}';
    if(fid){
      var target=$('.ysy-category-item').filter(function(){return new RegExp('fid='+fid+'(?:&|$)').test($(this).find('.ysy-category-link').attr('href')||'')}).first();
      if(target.length>0){
        target.find('.ysy-category-children').addClass('expanded');
        target.find('.ysy-category-expand').addClass('expanded');
        target.find('.ysy-category-link').addClass('active');
        if(gid){target.find('.ysy-category-child-link').each(function(){if(new RegExp('gid='+gid+'(?:&|$)').test($(this).attr('href')||'')){$(this).addClass('active')}})}
      }
    }

    // 标语空则隐藏
    (function(){var t=document.getElementById('active-product-tagline');if(t&&!t.textContent.trim()){t.style.display='none'}})();

    // 搜索
    $('#product-search-input').on('keydown',function(e){if(e.keyCode==13){location.href='/cart?action=product&keywords='+$(this).val()}});
  });
</script>
