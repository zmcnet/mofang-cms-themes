{include file="includes/cancelrequire"}
{include file="includes/pop"}
<script src="/themes/clientarea/ysyplat/assets/libs/echarts/echarts.min.js?v={$Ver}"></script>
<script src="/themes/clientarea/ysyplat/assets/libs/clipboard/clipboard.min.js?v={$Ver}"></script>
<script src="/themes/clientarea/ysyplat/assets/libs/moment/moment.js?v={$Ver}"></script>
<link rel="stylesheet" href="/themes/clientarea/ysyplat/assets/libs/bootstrap-select/css/bootstrap-select.min.css?v={$Ver}">
<script src="/themes/clientarea/ysyplat/assets/libs/bootstrap-select/js/bootstrap-select.min.js?v={$Ver}"></script>

<style>
  /* === 控制台面板 === */
  .svr-console { display:flex; flex-direction:column; gap:16px; }

  /* 头部卡片 */
  .svr-header { background:#fff; border:1px solid #ede9fe; border-radius:14px; box-shadow:0 2px 12px rgba(0,0,0,0.04); overflow:hidden; }
  .svr-header-top { display:flex; align-items:stretch; flex-wrap:wrap; }
  .svr-header-info { flex:1; padding:20px 24px; min-width:240px; }
  .svr-header-info h2 { font-size:1.25rem; font-weight:700; color:#1e1b2e; margin:0 0 6px; display:flex; align-items:center; gap:8px; flex-wrap:wrap; }
  .svr-header-info .domain { font-size:0.88rem; color:#6b6786; margin-bottom:6px; }
  .svr-header-info .domain a { color:#6366f1; text-decoration:none; }
  .svr-header-info .domain a:hover { color:#4f46e5; }

  .svr-header-stats { display:flex; gap:0; flex-wrap:wrap; }
  .svr-stat { flex:1; min-width:100px; padding:16px 20px; border-left:1px solid #f0ecff; }
  .svr-stat:first-child { border-left:none; }
  .svr-stat-label { font-size:0.72rem; color:#9ca3af; text-transform:uppercase; letter-spacing:0.5px; margin-bottom:4px; }
  .svr-stat-value { font-size:1rem; font-weight:600; color:#1e1b2e; }
  .svr-stat-value .bx { font-size:1.1rem; }
  .svr-stat-value .bx-copy { color:#9ca3af; cursor:pointer; margin-left:4px; font-size:0.85rem; }
  .svr-stat-value .bx-copy:hover { color:#6366f1; }

  /* 操作按钮区 */
  .svr-actions { display:flex; gap:8px; flex-wrap:wrap; padding:12px 24px; border-top:1px solid #f0ecff; background:#faf9ff; }
  .svr-btn { display:inline-flex; align-items:center; gap:5px; padding:7px 14px; border-radius:7px; font-size:0.82rem; font-weight:500; cursor:pointer; transition:all 0.2s; border:1px solid transparent; text-decoration:none; }
  .svr-btn--primary { background:linear-gradient(135deg,#6366f1,#8b5cf6); color:#fff; border:none; box-shadow:0 3px 10px rgba(99,102,241,0.25); }
  .svr-btn--primary:hover { background:linear-gradient(135deg,#5457e5,#7c3aed); color:#fff; }
  .svr-btn--outline { background:#fff; color:#6366f1; border-color:#c7d2fe; }
  .svr-btn--outline:hover { background:#f5f3ff; border-color:#6366f1; }
  .svr-btn--danger { background:#fff; color:#ef4444; border-color:#fecaca; }
  .svr-btn--danger:hover { background:#fef2f2; border-color:#ef4444; }
  .svr-btn--success { background:#fff; color:#10b981; border-color:#a7f3d0; }
  .svr-btn--success:hover { background:#ecfdf5; border-color:#10b981; }
  .svr-btn .bx { font-size:1rem; }

  /* 控制下拉菜单 */
  .svr-dropdown { position:relative; display:inline-block; }
  .svr-dropdown-menu { display:none; position:absolute; top:100%; left:0; z-index:50; min-width:150px; background:#fff; border:1px solid #e5e3f0; border-radius:10px; box-shadow:0 8px 30px rgba(0,0,0,0.1); padding:6px 0; margin-top:4px; }
  .svr-dropdown-menu.show { display:block; }
  .svr-dropdown-menu a { display:block; padding:7px 14px; font-size:0.82rem; color:#4b4662; text-decoration:none; transition:all 0.15s; }
  .svr-dropdown-menu a:hover { background:#f5f3ff; color:#6366f1; }

  /* 面板卡片 */
  .svr-card { background:#fff; border:1px solid #ede9fe; border-radius:14px; box-shadow:0 2px 10px rgba(0,0,0,0.03); overflow:hidden; }
  .svr-card-header { padding:14px 20px; border-bottom:1px solid #f0ecff; display:flex; align-items:center; justify-content:space-between; }
  .svr-card-header h4 { font-size:0.95rem; font-weight:600; color:#1e1b2e; margin:0; }
  .svr-card-body { padding:16px 20px; }
  .svr-card-body p { font-size:0.85rem; color:#4b4662; margin:0 0 6px; }
  .svr-card-body .text-gray { color:#6b6786; font-size:0.82rem; }

  /* 进度条 */
  .svr-progress { height:8px; background:#f0ecff; border-radius:4px; overflow:hidden; }
  .svr-progress-bar { height:100%; border-radius:4px; background:linear-gradient(90deg,#6366f1,#8b5cf6); transition:width 0.5s; }

  /* 流量条 */
  .svr-flow-indicator { display:flex; align-items:center; gap:8px; margin:8px 0; }
  .svr-flow-dot { width:8px; height:8px; border-radius:50%; }

  /* 开关 */
  .svr-switch { display:inline-flex; align-items:center; gap:8px; }
  .svr-switch input { width:36px; height:20px; }

  /* 响应式 */
  @media(max-width:768px){
    .svr-header-stats { flex-direction:column; }
    .svr-stat { border-left:none; border-top:1px solid #f0ecff; padding:12px 16px; }
    .svr-stat:first-child { border-top:none; }
    .svr-header-info { padding:16px; }
    .svr-actions { padding:10px 16px; }
  }

  /* 电源状态 */
  .powerimg { width:42px; height:42px; border-radius:50%; display:flex; align-items:center; justify-content:center; }
  .powerimg.on { background:#ecfdf5; color:#10b981; }
  .powerimg.off { background:#fef2f2; color:#ef4444; }
  .powerimg.loading { background:#f5f3ff; color:#6366f1; }

  /* 内联样式覆盖 */
  .left_wrap_btn { display:inline-block; padding:5px 12px; background:linear-gradient(135deg,#6366f1,#8b5cf6); color:#fff; border-radius:6px; border:none; font-size:0.78rem; cursor:pointer; }
  .custom-button { background:linear-gradient(135deg,#6366f1,#8b5cf6); color:#fff; border:none; border-radius:6px; font-size:0.82rem; padding:7px 12px; }
  .left_wrap_btn:hover,.custom-button:hover { background:linear-gradient(135deg,#5457e5,#7c3aed); }
  .restall-btn { border-radius:20px; }

  .xf-bg { display:none; position:absolute; background:#fff; padding:8px 12px; border-radius:6px; top:-36px; left:0; box-shadow:0 3px 12px rgba(0,0,0,0.12); font-size:0.75rem; color:#333; z-index:10; }
  .xf-bg-text { color:#333; word-break:break-all; }
</style>

<div class="container-fluid svr-console">

  <!-- 头部卡片 -->
  <div class="svr-header">
    <div class="svr-header-top">
      <div class="svr-header-info">
        <h2>
          {if $Detail.module_power_status == '1'}
          <div class="powerimg loading" id="powerBox"><span class="bx bx-loader bx-spin"></span></div>
          {else}
          <div class="powerimg" id="statusBox"></div>
          {/if}
          <span>{$Detail.host_data.productname}</span>
          <span class="badge badge-pill ml-1 py-1 status-{$Detail.host_data.domainstatus|strtolower}" style="font-size:0.7rem;">{$Detail.host_data.domainstatus_desc}</span>
        </h2>
        <div class="domain">
          <span>{$Detail.host_data.domain}</span>
        </div>
        <div style="display:flex;gap:16px;margin-top:8px;flex-wrap:wrap;">
          <div style="color:#6b6786;font-size:0.8rem;">
            <span class="text-gray">{$Lang.operating_system}</span>
            <span style="font-weight:600;color:#1e1b2e;">{$Detail.host_data.os}</span>
            {if in_array('reinstall', array_column($Detail.module_button.control, 'func')) && $Detail.host_data.domainstatus=="Active"}
            <button type="button" class="service_module_button left_wrap_btn fs-12 restall-btn ml-2" data-func="reinstall" data-type="default"
              onclick="service_module_button($(this), '{$Think.get.id}', '{$Detail.host_data.type}')">{$Lang.reinstall_system}</button>
            {/if}
          </div>
          <div style="color:#6b6786;font-size:0.8rem;">
            <span class="text-gray">{$Lang.ip_address}</span>
            <span style="font-weight:600;color:#1e1b2e;" id="copyIPContent">
              {if $Detail.host_data.dedicatedip}{$Detail.host_data.dedicatedip}{else}-{/if}
            </span>
          </div>
        </div>
      </div>
      <div class="svr-header-stats">
        {foreach $Detail.config_options as $item}
        {if $item.option_type == '6'||$item.option_type == '8'}
        <div class="svr-stat">
          <div class="svr-stat-label">{$item.name}</div>
          <div class="svr-stat-value">{$item.sub_name}</div>
        </div>
        {/if}
        {/foreach}
      </div>
    </div>

    <!-- 操作按钮 -->
    {if $Detail.module_button.control && $Detail.host_data.domainstatus=="Active"}
    <div class="svr-actions">
      {foreach $Detail.module_button.control as $item}
      {if $item.func != 'crack_pass' && $item.func != 'reinstall'}
      <a class="svr-btn svr-btn--outline service_module_button" href="javascript:void(0);"
        onclick="service_module_button($(this), '{$Think.get.id}', '{$Detail.host_data.type}')"
        data-func="{$item.func}" data-type="{$item.type}" data-desc="{$item.desc ?: $item.name}">
        <i class="bx bx-dots-horizontal-rounded"></i> {$item.name}
      </a>
      {/if}
      {/foreach}
      {if $Detail.module_button.console}
      {foreach $Detail.module_button.console as $item}
      <a class="svr-btn svr-btn--primary service_module_button" href="javascript:void(0);"
        onclick="service_module_button($(this), '{$Think.get.id}', '{$Detail.host_data.type}')"
        data-func="{$item.func}" data-type="{$item.type}" data-desc="">
        <i class="bx bx-desktop"></i> {$item.name}
      </a>
      {/foreach}
      {/if}
      {if $Detail.host_data.domainstatus == 'Active' && $Detail.host_data.cancel_control}
      {if $Cancel.host_cancel}
      <button class="svr-btn svr-btn--danger" id="cancelStopBtn"
        onclick="cancelStop('{$Cancel.host_cancel.type}', '{$Think.get.id}')">{$Lang.cancel_out}</button>
      {else}
      <button class="svr-btn svr-btn--danger" data-toggle="modal" data-target=".cancelrequire">{$Lang.apply_out}</button>
      {/if}
      {/if}
      {php}$hooks=hook('template_after_servicedetail_suspended',['hostid'=>$Detail['host_data']['id']]);{/php}
      {if $hooks}{foreach $hooks as $item}{$item}{/foreach}{/if}
    </div>
    {/if}
  </div>

  <!-- 信息卡片行 -->
  <div class="row" style="margin:0 -8px;">
    <!-- 登录信息 -->
    {if $Detail.host_data.domainstatus == 'Active'}
    <div class="col-md-4" style="padding:8px;">
      <div class="svr-card">
        <div class="svr-card-header">
          <h4><i class="bx bx-user" style="color:#6366f1;"></i> {$Lang.login_information}</h4>
        </div>
        <div class="svr-card-body">
          <p>{$Lang.user_name}：<strong>{$Detail.host_data.username}</strong></p>
          <p>{$Lang.password}：
            {if $Detail.host_data.password == ''}<span class="text-gray">-</span>
            {else}<span id="copyPwdContent" class="btnCopyPwd" style="color:#6366f1;cursor:pointer;">{$Detail.host_data.password}</span>{/if}
            {if in_array('crack_pass', array_column($Detail.module_button.control, 'func')) && $Detail.host_data.domainstatus=="Active"}
            <button type="button" class="service_module_button left_wrap_btn" data-func="crack_pass" data-type="default"
              onclick="service_module_button($(this), '{$Think.get.id}', '{$Detail.host_data.type}')" style="float:right;">{$Lang.reset_password}</button>
            {/if}
          </p>
          <p>{$Lang.port}：{if $Detail.host_data.port == '0'}{$Lang.defaults}{else}{$Detail.host_data.port}{/if}</p>
        </div>
      </div>
    </div>
    {/if}

    <!-- 流量 -->
    {if ($Detail.host_data.domainstatus == 'Active' || ($Detail.host_data.domainstatus == 'Suspended' && $Detail.host_data.suspendreason_type == 'flow')) && $Detail.host_data.bwlimit > 0}
    <div class="col-md-4" style="padding:8px;">
      <div class="svr-card">
        <div class="svr-card-header">
          <h4><i class="bx bx-transfer" style="color:#6366f1;"></i> {$Lang.flow|default='流量'}</h4>
          <button type="button" class="svr-btn svr-btn--success" id="orderFlowBtn" onclick="orderFlow($(this), '{$Think.get.id}')">{$Lang.order_flow}</button>
        </div>
        <div class="svr-card-body">
          <div class="svr-flow-indicator">
            <span class="svr-flow-dot" style="background:#f0ad4e;"></span> {$Lang.used_flow}：<span id="usedFlowSpan">-</span>
            <span class="svr-flow-dot" style="background:#34c38f;"></span> {$Lang.residual_flow}：<span id="remainingFlow">-</span>
          </div>
          <div class="svr-progress">
            <div class="svr-progress-bar" id="totalProgress" style="width:100%;"></div>
          </div>
        </div>
      </div>
    </div>
    {/if}

    <!-- 订购价格 -->
    <div class="col-md-4" style="padding:8px;">
      <div class="svr-card">
        <div class="svr-card-header">
          <h4><i class="bx bx-purchase-tag" style="color:#6366f1;"></i> {$Lang.first_order_price}</h4>
          <span class="text-gray" style="font-size:0.78rem;">{if $Detail.host_data.format_nextduedate.msg != '不到期'}{$Detail.host_data.format_nextduedate.msg}{/if}</span>
        </div>
        <div class="svr-card-body">
          <h3 style="color:#6366f1;font-weight:700;margin:0 0 8px;">{$Detail.host_data.firstpaymentamount_desc?$Detail.host_data.firstpaymentamount_desc:'-'}</h3>
          {if $Renew.host.billingcycle != 'onetime' && $Renew.host.status == 'Paid' && $Renew.host.billingcycle != 'free'}
          <div class="svr-switch" style="margin-bottom:8px;">
            <span class="text-gray">{$Lang.automatic_balance_renewal}</span>
            <div class="custom-control custom-switch custom-switch-md" dir="ltr">
              <input type="checkbox" class="custom-control-input" id="automaticRenewal"
                onchange="automaticRenewal('{$Think.get.id}')" {if $Detail.host_data.initiative_renew !=0}checked{/if}>
              <label class="custom-control-label" for="automaticRenewal"></label>
            </div>
          </div>
          <div style="display:flex;gap:8px;flex-wrap:wrap;">
            {if $Detail.host_data.billingcycle != 'free' && $Detail.host_data.billingcycle != 'onetime' && ($Detail.host_data.domainstatus == 'Active' || $Detail.host_data.domainstatus == 'Suspended')}
            {if $Detail.host_data.status == 'Paid'}
            <button type="button" class="svr-btn svr-btn--primary" onclick="renew($(this), '{$Think.get.id}')">{$Lang.renew}</button>
            {/if}
            {if $Detail.host_data.status == 'Unpaid'}
            <a href="viewbilling?id={$Detail.host_data.invoice_id}" class="svr-btn svr-btn--primary">{$Lang.renew}</a>
            {/if}
            {/if}
          </div>
          {/if}
          <div class="text-gray" style="font-size:0.78rem;">
            <p>{$Lang.subscription_date}：{$Detail.host_data.regdate|date="Y-m-d H:i"}</p>
            <p>{$Lang.payment_cycle}：{$Detail.host_data.billingcycle_desc}</p>
            <p>{$Lang.due_date}：{if $Detail.host_data.billingcycle == 'free' || $Detail.host_data.billingcycle == 'onetime'}{$Detail.host_data.format_nextduedate.msg}{else}{$Detail.host_data.nextduedate|date="Y-m-d H:i"}{/if}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  // 电源状态
  var statusBox = document.getElementById('statusBox');
  var powerStatus = '{$Detail.module_power_status}';
  if (statusBox) {
    if (powerStatus === '1') {
      statusBox.innerHTML = '<span class="bx bx-loader bx-spin" style="color:#6366f1;font-size:1.3rem;"></span>';
      statusBox.className = 'powerimg loading';
    } else if (powerStatus === '0') {
      statusBox.innerHTML = '<span class="bx bx-power-off" style="color:#ef4444;font-size:1.3rem;"></span>';
      statusBox.className = 'powerimg off';
    } else {
      statusBox.innerHTML = '<span class="bx bx-check-circle" style="color:#10b981;font-size:1.3rem;"></span>';
      statusBox.className = 'powerimg on';
    }
  }
</script>`n<!-- 标签页和配置 -->`n<div class="svr-card" style="margin-top:16px">`n<div class="svr-card-body">`n<div class="row">
            <!-- <div class="col-12 my-2">
              <div class="d-flex justify-content-between align-items-center">
                <span>{$Lang.first_order_price}</span>
                {if $Detail.host_data.billingcycle != 'free' && $Detail.host_data.billingcycle != 'onetime' &&
                ($Detail.host_data.domainstatus == 'Active' || $Detail.host_data.domainstatus == 'Suspended')}
                {if $Detail.host_data.status == 'Paid'}
                <button type="button" class="btn btn-primary btn-sm waves-effect waves-light" id="renew"
                  onclick="renew($(this), '{$Think.get.id}')">{$Lang.immediate_renewal}</button>
                {/if}
                {if $Detail.host_data.status == 'Unpaid'}
                <a href="viewbilling?id={$Detail.host_data.invoice_id}">
                  <button type="button" class="btn btn-primary btn-sm waves-effect waves-light"
                    id="renewpay">{$Lang.immediate_renewal}</button>
                </a>
                {/if}
                {/if}
              </div>
            </div> -->

            <div class="col-12 mb-2">
              <div class="bg-light card-body bg-gray pre-money-box">
                <p class="text-gray">
                  {$Lang.first_order_price}
                  <span class="fr">{if $Detail.host_data.format_nextduedate.msg == '不到期'}  {else}
                    {$Detail.host_data.format_nextduedate.msg} {/if}</span>
                </p>
                <section class="d-flex align-items-center">
                  <h3 class="mb-0 mr-2 dc">
                    {$Detail.host_data.firstpaymentamount_desc?$Detail.host_data.firstpaymentamount_desc:'-'}</h3>
                  <!-- <span class="badge
                      {$Detail.host_data.format_nextduedate.class}">{if $Detail.host_data.format_nextduedate.msg == '不到期'} - {else} {$Detail.host_data.format_nextduedate.msg} {/if}</span> -->
                </section>

                {if $Renew.host.billingcycle != 'onetime' && $Renew.host.status == 'Paid' && $Renew.host.billingcycle !=
                'free'}
                <section class="d-flex align-items-center flex-wrap">
                  <span>{$Lang.automatic_balance_renewal}</span>
                  <div class="custom-control custom-switch custom-switch-md mb-4 ml-2" dir="ltr">
                    <input type="checkbox" class="custom-control-input" id="automaticRenewal"
                      onchange="automaticRenewal('{$Think.get.id}')" {if $Detail.host_data.initiative_renew !=0}checked
                      {/if}> <label class="custom-control-label" for="automaticRenewal"></label>
                  </div>
                  {if $Detail.host_data.billingcycle != 'free' && $Detail.host_data.billingcycle != 'onetime' &&
                  ($Detail.host_data.domainstatus == 'Active' || $Detail.host_data.domainstatus == 'Suspended')}
                  {if $Detail.host_data.status == 'Paid'}
                  <button type="button" class="btn btn-success btn-sm waves-effect waves-light rsb" id="renew"
                    onclick="renew($(this), '{$Think.get.id}')">{$Lang.renew}</button>
                  {/if}
                  {if $Detail.host_data.status == 'Unpaid'}
                  <a href="viewbilling?id={$Detail.host_data.invoice_id}">
                    <button type="button" class="btn btn-success btn-sm waves-effect waves-light rsb"
                      id="renewpay">{$Lang.renew}</button>
                  </a>
                  {/if}
                  {/if}

                  {if $Detail.host_data.domainstatus == 'Active' && $Detail.host_data.cancel_control}
                  <span>
                    {if $Cancel.host_cancel}
                    <!-- <button class="btn btn-danger mb-1 h-100" id="cancelStopBtn"
                          onclick="cancelStop('{$Cancel.host_cancel.type}', '{$Think.get.id}')">{if $Cancel.host_cancel.type
                          ==
                          'Immediate'}{$Lang.stop_now}{else}{$Lang.stop_when_due}{/if}</button> -->
                    <button class="btn btn-primary btn-sm rsb ml-2" id="cancelStopBtn" data-container="body"
                      data-toggle="popover" data-placement="top" data-trigger="hover"
                      data-content="将于{{$Detail.host_data.deletedate|date='Y-m-d'}}自动删除"
                      onclick="cancelStop('{$Cancel.host_cancel.type}', '{$Think.get.id}')">{$Lang.cancel_out}</button>
                    {else}
                    <button class="btn btn-danger btn-sm rsb ml-2" data-toggle="modal"
                      data-target=".cancelrequire">{$Lang.apply_out}</button>
                    {/if}
                  </span>
                  {/if}
                </section>
                {/if}


                <section class="text-gray">

                  <p>{$Lang.subscription_date}：{$Detail.host_data.regdate|date="Y-m-d H:i"}</p>

                  <p>{$Lang.payment_cycle}：{$Detail.host_data.billingcycle_desc}</p>

                  {if $Detail.host_data.billingcycle == 'free' || $Detail.host_data.billingcycle == 'onetime'}
                  <p>{$Lang.due_date}：{if $Detail.host_data.format_nextduedate.msg == '不到期'} - {else}
                    {$Detail.host_data.format_nextduedate.msg} {/if}</p>
                  {else}
                  <p>{$Lang.due_date}：{$Detail.host_data.nextduedate|date="Y-m-d H:i"}</p>
                  {/if}

                </section>

              </div>

            </div>
          </div>


          <!-- 远程地址 建站解析 -->
          {if $Detail.dcimcloud && ($Detail.dcimcloud.nat_acl || $Detail.dcimcloud.nat_web)}
          <div class="bg-primary rounded-sm d-flex flex-column justify-content-center text-white py-2 px-1 mb-2">
            {if $Detail.dcimcloud.nat_acl}
            <div class="d-flex justify-content-between align-items-center">
              <span>
                <label>{$Lang.remote_address}：</label>
                <span id="nat_aclBox">{$Detail.dcimcloud.nat_acl}</span>
              </span>
              <span>
                <i class="bx bx-copy pointer text-white btn-copy" id="btnCopyaclBox" data-clipboard-action="copy"
                  data-clipboard-target="#nat_aclBox"></i>
              </span>
            </div>
            {/if}
            {if $Detail.dcimcloud.nat_web}
            <div class="d-flex justify-content-between align-items-center">
              <span>
                <label>{$Lang.ip_address}建站解析：</label>
                <span id="nat_webBox">{$Detail.dcimcloud.nat_web}</span>
              </span>
              <span>
                <i class="bx bx-copy pointer text-white btn-copy" id="btnCopywebBox" data-clipboard-action="copy"
                  data-clipboard-target="#nat_webBox"></i>
              </span>
            </div>
            {/if}
          </div>
          {/if}
          <!-- 配置项 -->
          <div class="row">
            {foreach $Detail.config_options as $item}
            {if $item.option_type == '5'||$item.option_type == '6'||$item.option_type == '8'}
            {else}
            <div class="col-md-12 mb-2 configuration configuration_list">
              <div data-toggle="popover" data-placement="top" data-trigger="hover"
                data-content="{$item.name}：{$item.sub_name}" class="bg-light card-body py-2 bg-gray row">
                <p class="text-gray col-md-6 plr-0 text-nowrap">
                  {$item.name}
                </p>
                <p class="mb-0 col-md-6 plr-0 text-nowrap text-right pl-2">
                  {if $item.option_type===12}
                  <img src="/upload/common/country/{$item.code}.png" width="20px">
                  {/if}
                  {$item.sub_name}
                </p>
              </div>
            </div>
            {/if}

            {/foreach}

            {foreach $Detail.custom_field_data as $item}
            {if $item.showdetail == 1}
            <div class="col-md-12 mb-2 configuration configuration_list">
              <div data-toggle="popover" data-placement="top" data-trigger="hover"
                data-content="{$item.fieldname}：{$item.value}" class="bg-light card-body py-2 bg-gray row">
                <p class="text-gray col-md-6 plr-0 text-nowrap">{$item.fieldname}</p>
                <p class="mb-0 col-md-6 plr-0 text-nowrap text-right pl-2">
                  {$item.value}
                </p>
              </div>
            </div>
            {/if}
            {/foreach}
            <div onclick="isShowConfiguration()" class="configuration-btn-down isClick">查看更多信息</div>
            <div class="col-12 mb-2">

              <div data-toggle="popover" data-placement="top" data-trigger="hover"
                data-content="{$Lang.remarks_infors}：{$Detail.host_data.remark?$Detail.host_data.remark:'-'}"
                class="bg-light card-body bg-gray row">

                <p class="text-gray col-md-3 plr-0 text-nowrap">{$Lang.remarks_infors}</p>

                <p class="mb-0 col-md-9 plr-0 text-nowrap">{$Detail.host_data.remark?$Detail.host_data.remark:'-'}
                  <span class="bx bx-edit-alt pointer ml-2" data-toggle="modal" data-target="#modifyRemarkModal"></span>
                </p>

              </div>

            </div>
          </div>

        </div>

      </div>

    </div>

    <div class="col-md-9">

      <div class="card">

        <div class="card-body">

          <ul class="nav nav-tabs nav-tabs-custom" role="tablist">

            {if $Detail.module_chart}

            <li class="nav-item" id="chartLi">

              <a class="nav-link active" data-toggle="tab" href="#home1" role="tab">

                <!-- <span class="d-block d-sm-none"><i class="fas fa-home"></i></span> -->

                <span>{$Lang.charts}</span>

              </a>

            </li>

            {/if}

            {if $Detail.host_data.allow_upgrade_config || $Detail.host_data.allow_upgrade_product}

            <li class="nav-item">

              <a class="nav-link {if !$Detail.module_chart}active{/if}" data-toggle="tab" href="#profile1" role="tab">

                <!-- <span class="d-block d-sm-none"><i class="far fa-user"></i></span> -->

                <span>{$Lang.upgrade_downgrade}</span>

              </a>

            </li>

            {/if}

            {if $Detail.download_data}

            <li class="nav-item">

              <a class="nav-link {if !$Detail.module_chart && !$Detail.host_data.allow_upgrade_config && !$Detail.host_data.allow_upgrade_product}active{/if}"
                data-toggle="tab" href="#messages1" role="tab">

                <!-- <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span> -->

                <span>{$Lang.file_download}</span>

              </a>

            </li>

            {/if}

            {if $Detail.host_data.show_traffic_usage}
            <li class="nav-item" id="usedLi">

              <a class="nav-link {if !$Detail.module_chart && !$Detail.host_data.allow_upgrade_config && !$Detail.host_data.allow_upgrade_product && !$Detail.download_data}active{/if}"
                data-toggle="tab" href="#dosage" role="tab">

                <!-- <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span> -->

                <span>{$Lang.consumption}</span>

              </a>

            </li>
            {/if}

            {foreach $Detail.module_client_area as $key=>$item}

            <li class="nav-item">

              <a class="nav-link  {if $key==0 && !$Detail.module_chart && !$Detail.host_data.allow_upgrade_config && !$Detail.host_data.allow_upgrade_product && !$Detail.download_data}active{/if}" data-toggle="tab" href="#module_client_area_{$item.key}" role="tab">

                <!-- <span class="d-block d-sm-none"><i class="fas fa-cog"></i></span> -->

                <span>{$item.name}</span>

              </a>

            </li>

            {/foreach}

            <li class="nav-item">

              <a class="nav-link {if !$Detail.module_chart && !$Detail.host_data.allow_upgrade_config && !$Detail.host_data.allow_upgrade_product && !$Detail.download_data && !$Detail.host_data.show_traffic_usage}active{/if}"
                data-toggle="tab" href="#settings1" role="tab">

                <!-- <span class="d-block d-sm-none"><i class="fas fa-cog"></i></span> -->

                <span>{$Lang.journal}</span>

              </a>

            </li>

            <li class="nav-item">

              <a class="nav-link" data-toggle="tab" href="#finance" role="tab">

                <!-- <span class="d-block d-sm-none"><i class="fas fa-cog"></i></span> -->

                <span>{$Lang.finance}</span>

              </a>

            </li>

          </ul>



          <!-- Tab panes -->

          <div class="tab-content p-3 text-muted" style="min-height: 550px;">

            {if $Detail.module_chart}

            <div class="tab-pane active" id="home1" role="tabpanel">

              {include file="includes/chart"}

            </div>

            {/if}

            {if $Detail.host_data.allow_upgrade_config || $Detail.host_data.allow_upgrade_product}
            <div class="tab-pane {if !$Detail.module_chart}active{/if}" id="profile1" role="tabpanel">

              <div class="container-fluid">
                {if $Detail.host_data.allow_upgrade_product}
                <div class="row mb-3">

                  <div class="col-12">

                    <div class="bg-light  rounded card-body">

                      <div class="row">

                        <div class="col-sm-3">
                          <h5>{$Lang.upgrade_downgrade}</h5>
                        </div>

                        <div class="col-sm-6">



                          <span>{$Lang.upgrade_downgrade_two}</span>

                        </div>

                        <div class="col-sm-3">

                          <button type="button" class="btn btn-primary waves-effect waves-light float-right"
                            id="upgradeProductBtn"
                            onclick="upgradeProduct($(this), '{$Think.get.id}')">{$Lang.upgrade_downgrade}</button>

                        </div>

                      </div>

                    </div>

                  </div>

                </div>
                {/if}
                {if $Detail.host_data.allow_upgrade_config}
                <div class="row mb-3">

                  <div class="col-12">

                    <div class="bg-light  rounded card-body">

                      <div class="row">

                        <div class="col-sm-3">

                          <h5>{$Lang.upgrade_downgrade_options}</h5>

                        </div>

                        <div class="col-sm-6">

                          <span>{$Lang.upgrade_downgrade_description}</span>

                        </div>

                        <div class="col-sm-3">

                          <button type="button" class="btn btn-primary waves-effect waves-light float-right"
                            id="upgradeConfigBtn"
                            onclick="upgradeConfig($(this), '{$Think.get.id}')">
                            
                            {$Lang.upgrade_downgrade_options}
                          </button>

                        </div>

                      </div>

                    </div>

                  </div>

                </div>
                {/if}

              </div>

            </div>
            {/if}

            {if $Detail.download_data}

            <div
              class="tab-pane {if !$Detail.module_chart && !$Detail.host_data.allow_upgrade_config && !$Detail.host_data.allow_upgrade_product}active{/if}"
              id="messages1" role="tabpanel">

              {include file="servicedetail/servicedetail-download"}

            </div>

            {/if}

            

            {foreach $Detail.module_client_area as $key=>$item}

            <div class="tab-pane {if $key==0 && !$Detail.module_chart && !$Detail.download_data && !$Detail.host_data.allow_upgrade_config && !$Detail.host_data.allow_upgrade_product}active{/if}" role="tabpanel" id="module_client_area_{$item.key}">
              <div style="min-height: 550px;width:100%">
                <script>
                  $.ajax({
                    url : '/provision/custom/content?id={$Think.get.id}&key={$item.key}'
                    ,type : 'get'
                    ,success : function(res) {
                        $('#module_client_area_{$item.key} > div').html(res);
                    }
                  })
                </script>
              </div>
              <!-- <iframe src="/provision/custom/content?id={$Think.get.id}&key={$item.key}"
                onload="this.height=$($('.main-content .card-body')[1]).height()-72" frameborder="0"
                width="100%"></iframe> -->
              <!-- <iframe src="/provision/custom/content?id={$Think.get.id}&key={$item.key}"
                frameborder="0" width="100%" style="min-height: 550px;"></iframe> -->

            </div>

            {/foreach}

            {if $Detail.host_data.show_traffic_usage}
            <div
              class="tab-pane {if !$Detail.module_chart && !$Detail.host_data.allow_upgrade_config && !$Detail.host_data.allow_upgrade_product && !$Detail.download_data}active{/if}"
              id="dosage" role="tabpanel">

              <div class="row d-flex align-items-center">

                <div class="col-md-3">

                  <input class="form-control" type="date" id="startingTime">

                </div>

                <span>{$Lang.reach}</span>

                <div class="col-md-3">

                  <input class="form-control" type="date" id="endTime">

                </div>

              </div>

              <div class="w-100 h-100">

                <div style="height: 500px" class="chart_content_box w-100" id="usedChartBox"></div>

              </div>

            </div>
            {/if}
            <div
              class="tab-pane {if !$Detail.module_chart && !$Detail.host_data.allow_upgrade_config && !$Detail.host_data.allow_upgrade_product && !$Detail.download_data && !$Detail.host_data.show_traffic_usage && !$Detail.module_client_area}active{/if}"
              id="settings1" role="tabpanel">

              <!-- 日志 -->

            </div>
            <div class="tab-pane" id="finance" role="tabpanel">

              <!-- 财务 -->

            </div>

          </div>

        </div>

      </div>

    </div>

  </div>

</div>

<!-- 电源状态 -->
<script>
  var showPowerStatus = '{$Detail.module_power_status}';
  var powerStatus = {
    status: '',
    des: ''
  }

  $(function () {
    if (showPowerStatus == '1') {
      getPowerStatus('{$Think.get.id}')
    }

    $('#powerBox').on('click', function () {
      getPowerStatus('{$Think.get.id}')
    });
  })

  // 获取电源状态
  function getPowerStatus() {

    $('#powerStatusIcon').removeClass()
    $('#powerStatusIcon').addClass('bx bx-loader')

    $.ajax({
      type: "POST",
      url: '/provision/default',
      data: {
        id: '{$Think.get.id}',
        func: 'status'
      },
      success: function (data) {
        $('#powerStatusIcon').attr('data-content', data.data ? data.data.des : data.msg)
        $('#powerStatusIcon').removeClass()
        if (data.status != 200) {
          powerStatus.status = 'unknown'
          powerStatus.des = data.msg
          $('#powerStatusIcon').addClass('sprite unknown')
        } else {
          powerStatus.status = data.data ? data.data.status : 'unknown'
          powerStatus.des = data.data ? data.data.des : '{$Lang.unknown}'
          // 

          if (powerStatus.status === 'process') {
            $('#powerStatusIcon').addClass('bx bx-loader')
          } else if (powerStatus.status === 'on') {
            $('#powerStatusIcon').addClass('sprite start')
          } else if (powerStatus.status === 'off') {
            $('#powerStatusIcon').addClass('sprite closed')
          } else if (powerStatus.status === 'waiting') {
            $('#powerStatusIcon').addClass('sprite waitOn')
          } else if (powerStatus.status === 'suspend') {
            $('#powerStatusIcon').addClass('sprite pause')
          } else if (powerStatus.status === 'wait_reboot' || powerStatus.status === 'wait') {
            $('#powerStatusIcon').addClass('sprite waiting')
          } else if (powerStatus.status === 'cold_migrate') {
            $('#powerStatusIcon').addClass('iconfont icon-shujuqianyi')
          } else if (powerStatus.status === 'hot_migrate') {
            $('#powerStatusIcon').addClass('iconfont icon-shujuqianyi')
          } else {
            $('#powerStatusIcon').addClass('sprite unknown')
          }

          if (data.data.status !== 'process') { // 状态改变, 清除定时器
            clearInterval(timeInterval)
          }
        }

      }
    });
  }

  var timeOut = null
  var timeInterval = null
</script>
<script>
  var showPWd = true
  $(function () {
    $(".nav-tabs-custom").find('.nav-item').find("a").removeClass('active')
    $(".nav-tabs-custom").find('.nav-item').eq(0).find("a").addClass('active')
    // 暂停状态悬浮原因
    $('.container-fluid').on('mouseover', '.status-suspended', function () {
      $('.xf-bg').show();
    })
    $('.container-fluid').on('mouseout', '.status-suspended', function () {
      $('.xf-bg').hide();
    })
    let ips = {:json_encode($Detail.host_data.assignedips)};
    if(ips.length<2) {
      // 复制IP
      var clipboard1 = new ClipboardJS('#copyIPContent', {
        text: function (trigger) {
          return $('#copyIPContent').text()
        }
      });
      clipboard1.on('success', function (e) {
        toastr.success('{$Lang.copy_succeeded}');
      })
    }
    // 一个ip时，不弹框，复制ip
    var clipboard = new ClipboardJS('.copyOneIp', {
      text: function (trigger) {
        return $('#copyOneIp').text()
      }
    });
    clipboard.on('success', function (e) {
      toastr.success('{$Lang.copy_succeeded}');
    })

    // 查看密码
    // $('#copyPwdContent').hide()
    $('#hidePwdBox').hide()

    // 复制密码
    var clipboard2 = new ClipboardJS('.btnCopyPwd', {
      text: function (trigger) {
        return $('#copyPwdContent').text()
      }
    });
    clipboard2.on('success', function (e) {
      toastr.success('{$Lang.copy_succeeded}');
    })
  })

  function togglePwd() {
    showPWd = !showPWd

    if (showPWd) {
      $('#copyPwdContent').show()
      $('#hidePwdBox').hide()
    }
    if (!showPWd) {
      $('#copyPwdContent').hide()
      $('#hidePwdBox').show()
    }
  }
  //点击更多信息
  function isShowConfiguration(first = true) {
    let time = 0
    if (first) {
      time = 500
    }
    for (let i = 0; i < 99; i++) {
      if (i > 3) {
        $('.configuration').eq(i).toggle(time)
      }
    }
    $('.configuration-btn-down').toggleClass('isClick')
    $('.configuration-btn-down').html('查看更多信息')
    $('.configuration-btn-down.isClick').html('收起更多信息')
    if($('.configuration_list').length < 4) {
      $('.configuration-btn-down').hide()
    }
  }
  isShowConfiguration(false)
  // 远程地址 建站解析
  // 复制授权码
  var clipboardnat_aclBox = new ClipboardJS('#btnCopyaclBox', {
    text: function (trigger) {
      return $('#nat_aclBox').text()
    }
  });
  clipboardnat_aclBox.on('success', function (e) {
    toastr.success('{$Lang.copy_succeeded}');
  })

  // 复制授权码
  var clipboardnat_webBox = new ClipboardJS('#btnCopywebBox', {
    text: function (trigger) {
      return $('#nat_webBox').text()
    }
  });
  clipboardnat_webBox.on('success', function (e) {
    toastr.success('{$Lang.copy_succeeded}');
  })
</script>


<script>
  // 用量tabs

  let usedChart = null

  let usedStartTime

  let usedEndTime



  $(document).ready(function () {
    chartOption()

    if ($('#startingTime,#endTime').length > 0) getData()

    window.addEventListener('resize', function () {

      usedChart.resize()

    })



    $('#usedLi').on('click', function () {

      setTimeout(() => {

        usedChart.resize()

      }, 0);

    });


    $('#startingTime,#endTime').change(function () {

      usedStartTime = $('#startingTime').val()

      usedEndTime = $('#endTime').val()

      getData()

    });


    // 图表配置

    function chartOption() {
      if ($('#usedChartBox').length == 0) {
        return;
      }

      usedChart = echarts.init(document.getElementById('usedChartBox'))

      usedChart.setOption({

        backgroundColor: '#fff',

        title: {

          subtext: '',

          left: 'center',

          textAlign: 'left',

          subtextStyle: {

            lineHeight: 400

          }

        },

        tooltip: {

          backgroundColor: '#fff',

          padding: [10, 20, 10, 8],

          textStyle: {

            color: '#000',

            fontSize: 12

          },

          trigger: 'axis',

          axisPointer: {

            type: 'line',

            lineStyle: {

              color: '#7dcb8f'

            }

          },

          formatter: function (params, ticket, callback) {

            // 

            const res = `

                    <div>

                      <div>{$Lang.traffic_usage}：${params[0].value}GB </div>

                      <div>${params[0].axisValue}</div>

                    </div>

                    `

            return res

          },

          extraCssText: 'box-shadow: 0px 4px 13px 1px rgba(1, 24, 167, 0.1);'

        },

        grid: {

          left: '80',

          top: 20,

          x: 70,

          x2: 50,

          y2: 80

        },

        xAxis: {

          offset: 15,

          type: 'category',

          data: [],

          boundaryGap: false,

          axisTick: {

            show: false

          },

          // 改变x轴颜色

          axisLine: {

            lineStyle: {

              type: 'dashed',

              color: '#ddd',

              width: 1

            }

          },

          axisLabel: {

            show: true,

            textStyle: {

              color: '#999'

            }

          }

        },

        yAxis: {

          type: 'value',

          // 轴网格

          splitLine: {

            show: true,

            lineStyle: {

              color: '#ddd',

              type: 'dashed'

            }

          },

          axisTick: {

            show: false // 轴刻度不显示

          },

          axisLine: {

            show: false

          },

          axisLabel: {

            show: true,

            textStyle: {

              color: '#999'

            },

            formatter: '{value}GB'

          }

        },

        series: [{

          name: '用量',

          type: 'line',

          smooth: true,

          showSymbol: true,

          symbol: 'circle',

          symbolSize: 3,

          // data: ['1200', '1400', '1008', '1411', '1026', '1288', '1300', '800', '1100', '1000', '1118', '123456'],

          data: [],

          areaStyle: {

            normal: {

              color: '#d4d1da',

              opacity: 0.2

            }

          },

          itemStyle: {

            normal: {

              color: '#0061ff' // 主要线条的颜色

            }

          },

          lineStyle: {

            normal: {

              width: 4,

              shadowColor: 'rgba(0,0,0,0.4)',

              shadowBlur: 10,

              shadowOffsetY: 10

            }

          }

        }]

      })

    }



    // 获取数据

    async function getData() {

      usedChart.showLoading({

        text: '数据正在加载...',

        color: '#999',

        textStyle: {

          fontSize: 30,

          color: '#444'

        },

        effectOption: {

          backgroundColor: 'rgba(0, 0, 0, 0)'

        }

      })







      const obj = {

        id: '{$Think.get.id}',

        start: usedStartTime,

        end: usedEndTime

      }

      $.ajax({

        type: "get",

        url: '/host/trafficusage',

        data: obj,

        success: function (data) {



          usedChart.hideLoading()

          if (data.status !== 200) return false

          const xData = []

          const seriesData = [];

          (data.data || []).forEach(item => {

            xData.push(item.time)

            seriesData.push(item.value)

          })

          usedChart.setOption({

            title: {

              subtext: xData.length ? '' : '暂无数据'

            },

            xAxis: {

              data: xData

            },

            series: [{

              data: seriesData

            }]

          })

          // 如果初始查询没有时间, 则设置默认时间为返回数据的第一个和最后一个时间

          if (!usedStartTime || !usedEndTime) {

            if (data.data.length) {

              usedStartTime = new Date().getFullYear() + '-' + data.data[0].time

              usedEndTime = new Date().getFullYear() + '-' + data.data[data.data.length - 1].time

              $('#startingTime').val(new Date().getFullYear() + '-' + data.data[0].time);

              $('#endTime').val(new Date().getFullYear() + '-' + data.data[data.data.length - 1].time);

            }

          }

        }

      });

    }



    // 分辨率改变, 重绘图表

    function resize() {

      usedChart.resize()

    }



    // 时间选择改变

    function dateChange() {

      const startTimeStamp = new Date(usedStartTime).getTime()

      const endTimeStamp = new Date(usedEndTime).getTime()

      if (usedStartTime && usedEndTime && startTimeStamp < endTimeStamp) {

        getData()

      }

    }
  })
</script>



<script>
  // 获取基础数据

  const obj = {

    host_id: '{$Think.get.id}'

  }

  $.ajax({

    type: "get",

    url: '/host/dedicatedserver',

    data: obj,

    success: function (data) {

      const totalFlow = data.data.host_data.bwlimit // 总流量

      const usedFlow = data.data.host_data.bwusage.toFixed(1) // 已用流量

      const remainingFlow = (totalFlow - usedFlow).toFixed(1)

      let percentUsed = 100 - parseInt((usedFlow / totalFlow) * 100) || 0

      $('#totalProgress')
        .css('width', percentUsed + '%')
        .attr('aria-valuenow', percentUsed)
        .text(`${percentUsed}%`);

      $('#usedFlowSpan').text(`${usedFlow > 1024 ? ((usedFlow / 1024).toFixed(2) + 'TB') : (usedFlow + 'GB')}`);
      $('#remainingFlow').text(
        `${remainingFlow > 1024 ? ((remainingFlow / 1024).toFixed(2) + 'TB') : (remainingFlow + 'GB')}`);

      // 产品状态
      $('#statusBox').append(`<span class="sprite2 ${data.data.host_data.domainstatus}"></span>`)

    }

  });
</script>



<script>
  const logObj = {

    id: '{$Think.get.id}',

    action: 'log_page'

  }

  $.ajax({

    type: "get",

    url: '/servicedetail',

    data: logObj,

    success: function (data) {

      $(data).appendTo('#settings1');

    }

  });

  // 财务的append

  const financeObj = {

    id: '{$Think.get.id}',

    action: 'billing_page'

  }

  $.ajax({

    type: "get",

    url: '/servicedetail',

    data: financeObj,

    success: function (data) {

      $(data).appendTo('#finance');

    }

  });
</script>


<script>
  var clipboard = null
  var clipboardpoppwd = null
  var ips = {:json_encode($Detail.host_data.assignedips)};

  $(document).on('click', '#copyIPContent', function () {
    // if (ips.length<=1) {
    //         return
    //     }
    $('#popModal').modal('show')
    $('#popTitle').text('IP地址')
    var iplist = ''
    if (clipboard) {
      clipboard.destroy()
    }
    for(let item in ips) {
      iplist += `
        <div>
          <span class="copyIPContent${item}">${ips[item]}</span>
          <i class="bx bx-copy pointer text-primary ml-1 btn-copy btnCopyIP${item}" data-clipboard-action="copy" data-clipboard-target=".copyIPContent${item}"></i>
        </div>
      `

      // 复制IP
      clipboard = new ClipboardJS('.btnCopyIP'+item, {
        text: function (trigger) {
          return $('.copyIPContent'+item).text()
        },
        container: document.getElementById('popModal')
      });
      clipboard.on('success', function (e) {
        toastr.success('{$Lang.copy_succeeded}');
      })
    }

    $('#popContent').html(iplist)
  });


  // 复制用户密码
  $(document).on('click', '#logininfo', function () {
    $('#popModal').modal('show')
    $('#popTitle').text('登录信息')

    $('#popContent').html(`
      <div>{$Lang.user_name}：{$Detail.host_data.username}</div>
      <div>
        {$Lang.password}：<span id="poppwd">{$Detail.host_data.password}</span>
        <i class="bx bx-copy pointer text-primary ml-1 btn-copy" id="poppwdcopy" data-clipboard-action="copy" data-clipboard-target="#poppwd"></i>
      </div>
      <div>{$Lang.port}：{if $Detail.host_data.port == '0'}{$Lang.defaults}{else/}{$Detail.host_data.port}{/if}</div>
      <div>
        {if in_array('crack_pass', array_column($Detail.module_button.control, 'func')) && $Detail.host_data.domainstatus=="Active"}
        <button type="button" class="service_module_button ml-2 mt-2 left_wrap_btn fs-12" data-func="crack_pass"
          data-type="default"
          onclick="service_module_button($(this), '{$Think.get.id}', '{$Detail.host_data.type}')">{$Lang.reset_password}</button>
        {/if}
      </div>
    `)
  });


  $('#popModal').on('shown.bs.modal', function () {
    if (clipboardpoppwd) {
      clipboardpoppwd.destroy()
    }
    clipboardpoppwd = new ClipboardJS('#poppwdcopy', {
      text: function (trigger) {
        return $('#poppwd').text()
      },
      container: document.getElementById('popModal')
    });
    clipboardpoppwd.on('success', function (e) {
      toastr.success('{$Lang.copy_succeeded}');
    })
  })
</script>
`n</div>`n</div>