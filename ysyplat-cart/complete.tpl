<link rel="stylesheet" href="/themes/cart/ysyplat-cart/assets/css/cart.css?v={$Ver}">
<link rel="stylesheet" href="/themes/cart/ysyplat-cart/assets/css/complete.css?v={$Ver}">
<link rel="stylesheet" href="/themes/cart/ysyplat-cart/assets/css/icons.min.css?v={$Ver}">

<!-- ysyplat-cart 顶栏 -->
<div class="ysy-cart-topbar">
	<a href="{$Setting.web_jump_url}" class="ysy-cart-topbar__left">
		{if $Setting.web_logo}<span class="ysy-cart-topbar__logo"><img src="{$Setting.web_logo}" alt=""></span>{/if}
		<span class="ysy-cart-topbar__name">{$Setting.company_name}</span>
	</a>
	<div class="ysy-cart-topbar__right">
		<a href="/cart" class="ysy-cart-topbar__link"><i class="bx bx-cart-alt"></i>{$Lang.shopping_cart|default='购物车'}</a>
		{if $Userinfo}
		<a href="/clientarea" class="ysy-cart-topbar__link"><i class="bx bx-user"></i>{$Userinfo.user.username}</a>
		<a href="/logout" class="ysy-cart-topbar__link"><i class="bx bx-power-off"></i>{$Lang.log_out}</a>
		{else}
		<a href="/login" class="ysy-cart-topbar__link"><i class="bx bx-log-in"></i>{$Lang.sign_in}</a>
		<a href="/register" class="ysy-cart-topbar__link"><i class="bx bx-user-plus"></i>{$Lang.register_now}</a>
		{/if}
	</div>
</div>

<div class="ysy-complete">
  <div class="ysy-complete__icon">
    <i class="mdi mdi-check-circle-outline"></i>
  </div>
  <h2 class="ysy-complete__title">{$Lang.order_success|default='下单成功'}</h2>
  <p class="ysy-complete__desc">
    {$Lang.order_success_tip|default='您的订单已提交成功，请尽快完成支付。如需帮助请联系客服。'}
  </p>

  {if $Order}
  <div class="ysy-complete__info">
    <div class="ysy-complete__info-item">
      <div class="label">{$Lang.order_number|default='订单号'}</div>
      <div class="value">{$Order.id}</div>
    </div>
    <div class="ysy-complete__info-item">
      <div class="label">{$Lang.amount_payable|default='应付金额'}</div>
      <div class="value">{$Order.amount}</div>
    </div>
    <div class="ysy-complete__info-item">
      <div class="label">{$Lang.payment_status|default='支付状态'}</div>
      <div class="value">{$Order.status}</div>
    </div>
  </div>
  {/if}

  <div class="ysy-complete__actions">
    {if $Order && $Order.url}
    <a href="{$Order.url}" class="ysy-complete__btn ysy-complete__btn--primary">
      <i class="mdi mdi-credit-card-outline"></i>
      {$Lang.go_to_pay|default='前往支付'}
    </a>
    {/if}
    <a href="/clientarea" class="ysy-complete__btn ysy-complete__btn--primary">
      <i class="mdi mdi-account-circle-outline"></i>
      {$Lang.go_to_user_center|default='前往用户中心'}
    </a>
    <a href="/cart" class="ysy-complete__btn ysy-complete__btn--ghost">
      <i class="mdi mdi-cart-outline"></i>
      {$Lang.continue_shopping|default='继续购物'}
    </a>
  </div>
</div>
