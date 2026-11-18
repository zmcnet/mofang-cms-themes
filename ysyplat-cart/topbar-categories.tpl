<link rel="stylesheet" href="/themes/cart/ysyplat-cart/assets/css/topbar.css">
<style>
    @media (max-width: 576px) {
      
      .firstgroup_item,.secondgroup_item{
          min-width:auto!important;
          width:50%;
          padding:0;
      }
    }
    

    
    /* 新的商品标语模块样式 - 白色直角底 */
    .product-tagline-container {
        width: 100%;
        padding: 8px 0;
    }
    
    .active-tagline {
        padding: 6px 12px;
        background-color: #fff;
        border-radius: 1px;
        color: #495057;
        font-size: 14px;
        line-height: 1.4;
        text-align: left;
        border: 1px solid #ced1e2;
        box-shadow: 0px 4px 15px 1px rgba(6, 75, 179, 0.06);
        min-height: 28px;
        display: flex;
        align-items: center;
        justify-content: flex-start;
    }
    

</style>
<div class="firstgroup_box mb-2">
  <div class="firstgroup_box_prov mr-2">选择产品</div>
  <div class="firstgroup_box_group">
    {foreach $Cart.product_groups as $index=>$first} 
	{if $first.id==$Think.get.fid || (!$Think.get.fid && $index==0)}
	{if $first.tagline}
	<div class="firstgroup_item pointer active" data-original-name="{$first.name}" data-tagline='{:htmlspecialchars_decode($first.tagline)}'><a class="text-white" href="/cart?fid={$first.id}{if $Get.site}&site={$Get.site}{/if}">{$first.name}</a></div>
	{else}
	<div class="firstgroup_item pointer active" data-original-name="{$first.name}" data-tagline=""><a class="text-white" href="/cart?fid={$first.id}{if $Get.site}&site={$Get.site}{/if}">{$first.name}</a></div>
	{/if}
	{assign name="cart_first_id" value="$first.id" /}  
	{assign name="cart_second" value="$first.second" /}  
	{else/}
	{if $first.tagline}
	<div class="firstgroup_item pointer" data-original-name="{$first.name}" data-tagline='{:htmlspecialchars_decode($first.tagline)}'><a href="/cart?fid={$first.id}{if $Get.site}&site={$Get.site}{/if}">{$first.name}</a></div>
	{else}
	<div class="firstgroup_item pointer" data-original-name="{$first.name}" data-tagline=""><a href="/cart?fid={$first.id}{if $Get.site}&site={$Get.site}{/if}">{$first.name}</a></div>
	{/if}
	{/if}
	{/foreach}
  </div>
</div>

<div class="secondgroup_box mb-2">
  <div class="secondgroup_box_area mr-2">选择分类</div>
  <div class="secondgroup_box_group">
	{foreach $cart_second as $index=>$secondItem}
	{if $secondItem.id == $Think.get.gid || (!$Think.get.gid && $index==0)}
	{if $secondItem.tagline}
    <div class="secondgroup_item pointer active" data-original-name="{$secondItem.name}" data-tagline='{:htmlspecialchars_decode($secondItem.tagline)}'><a class="text-white" href="/cart?fid={$cart_first_id}&gid={$secondItem.id}{if $Get.site}&site={$Get.site}{/if}">{$secondItem.name}</a></div>
	{else}
    <div class="secondgroup_item pointer active" data-original-name="{$secondItem.name}" data-tagline=""><a class="text-white" href="/cart?fid={$cart_first_id}&gid={$secondItem.id}{if $Get.site}&site={$Get.site}{/if}">{$secondItem.name}</a></div>
	{/if}
	{assign name="cart_gid" value="$secondItem.id" /} 
	{else/}
	{if $secondItem.tagline}
	<div class="secondgroup_item pointer" data-original-name="{$secondItem.name}" data-tagline='{:htmlspecialchars_decode($secondItem.tagline)}'><a href="/cart?fid={$cart_first_id}&gid={$secondItem.id}{if $Get.site}&site={$Get.site}{/if}">{$secondItem.name}</a></div>
	{else}
	<div class="secondgroup_item pointer" data-original-name="{$secondItem.name}" data-tagline=""><a href="/cart?fid={$cart_first_id}&gid={$secondItem.id}{if $Get.site}&site={$Get.site}{/if}">{$secondItem.name}</a></div>
	{/if}
	{/if}
	{/foreach}
  </div>
</div>

<!-- 商品标语显示模块 -->
<div class="product-tagline-container mb-2">
  <div id="active-product-tagline" class="active-tagline">
    <!-- 当前选中商品的标语将通过JavaScript显示在这里 -->
  </div>
</div>

<style>
  /* 分类名称中"-【内容】"格式的样式 - 红色背景 */
  .category-name-suffix {
    background-color: #ff4d4f;
    color: white;
    padding: 2px 6px;
    border-radius: 0;
    font-size: 13px;
    font-weight: normal;
    margin-left: 5px;
  }
</style>

<script>
// 处理分类名称中的"-【内容】"格式，将【内容】用红色背景显示，不显示-【】
function processCategoryNames() {
  // 获取所有分类链接
  const categoryLinks = document.querySelectorAll('.firstgroup_item a, .secondgroup_item a');
  
  categoryLinks.forEach(link => {
    const text = link.textContent.trim();
    // 只处理-【内容】格式，不处理单纯的-分隔
    const match = text.match(/^(.*?)\-\【(.*?)\】(.*?)$/);
    if (match) {
      const prefix = match[1] + match[3]; // 合并前缀和后缀
      const suffix = match[2]; // 提取【】中的内容
      link.innerHTML = `${prefix}<span class="category-name-suffix">${suffix}</span>`;
    }
  });
}

// 处理商品标语显示
function processProductNames() {
  // 获取标语显示模块
  const taglineContainer = document.getElementById('active-product-tagline');
  
  // 获取所有分类项
  const categoryItems = document.querySelectorAll('.firstgroup_item, .secondgroup_item');
  
  categoryItems.forEach(item => {
    // 对于激活状态的项，显示其标语在新模块中
    if (item.classList.contains('active')) {
      if (taglineContainer) {
        const tagline = item.getAttribute('data-tagline') || '';
        if (tagline.trim()) {
          taglineContainer.innerHTML = tagline;
          taglineContainer.style.display = 'block';
        } else {
          taglineContainer.style.display = 'none';
        }
      }
    }
  });
  
  // 添加点击事件监听，当点击分类项时更新标语和样式
  categoryItems.forEach(item => {
    item.addEventListener('click', function(e) {
      // 移除所有项的激活状态和白色文字样式
      categoryItems.forEach(i => {
        i.classList.remove('active');
        const link = i.querySelector('a');
        if (link) {
          link.classList.remove('text-white');
        }
      });
      // 添加当前项的激活状态和白色文字样式
      item.classList.add('active');
      const currentLink = item.querySelector('a');
      if (currentLink) {
        currentLink.classList.add('text-white');
      }
      
      // 获取当前项的标语
      const tagline = item.getAttribute('data-tagline') || '';
      
      // 更新标语显示
      if (taglineContainer) {
        if (tagline.trim()) {
          taglineContainer.innerHTML = tagline;
          taglineContainer.style.display = 'block';
        } else {
          taglineContainer.style.display = 'none';
        }
      }
    });
  });
}

// 页面加载完成后执行
function init() {
  processCategoryNames();
  processProductNames();
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', init);
} else {
  init();
}
</script>