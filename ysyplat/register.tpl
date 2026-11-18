<link href="/themes/clientarea/ysyplat/assets/css/icons.min.css?v={`$Ver}" rel="stylesheet" type="text/css" />
<link href="/themes/clientarea/ysyplat/assets_custom/css/bento.css?v={$Ver}" rel="stylesheet">
<script src="/themes/clientarea/ysyplat/assets_custom/js/geetest-config.js?v={$Ver}"></script>
<script src="/themes/clientarea/ysyplat/assets/js/crypto-js.min.js" type="text/javascript"></script>
<script src="/themes/clientarea/ysyplat/assets/js/public.js?v={$Ver}"></script>

<style>
  html, body { margin: 0; padding: 0; }
  body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'PingFang SC', 'Microsoft YaHei', sans-serif; }
</style>

<svg style="position:absolute;width:0;height:0;overflow:hidden">
  <filter id="glass-distortion">
    <feTurbulence type="fractalNoise" baseFrequency="0.02" numOctaves="3" result="noise"/>
    <feDisplacementMap in="SourceGraphic" in2="noise" scale="4" xChannelSelector="R" yChannelSelector="G"/>
  </filter>
</svg>

{if $ErrorMsg}
<div style="position:fixed;top:1rem;right:1rem;z-index:9999;background:rgba(239,68,68,0.9);backdrop-filter:blur(12px);border-radius:1rem;padding:0.8rem 1.2rem;color:#fff;font-size:0.9rem;box-shadow:0 8px 24px rgba(239,68,68,0.3);">
  <i class="fas fa-exclamation-circle mr-2"></i>{$ErrorMsg}
</div>
{/if}
{if $SuccessMsg}
<div style="position:fixed;top:1rem;right:1rem;z-index:9999;background:rgba(16,185,129,0.9);backdrop-filter:blur(12px);border-radius:1rem;padding:0.8rem 1.2rem;color:#fff;font-size:0.9rem;box-shadow:0 8px 24px rgba(16,185,129,0.3);">
  <i class="fas fa-check-circle mr-2"></i>{$SuccessMsg}
</div>
{/if}

<script>
    var mk = '{$Setting.msfntk}';
</script>

{if $Setting.login_header}
<div style="text-align:center;padding:0.5rem;background:rgba(255,255,255,0.05);color:rgba(255,255,255,0.6);font-size:0.85rem;">{$Setting.login_header}</div>
{/if}

<div class="ysy-bg" style="display:flex;align-items:center;justify-content:center;min-height:100vh;padding:1rem;">
  <div class="ysy-bento" style="max-width:1200px;width:100%;grid-template-columns:1fr 1fr;align-items:center;">

    <!-- 左侧品牌 -->
    <div class="ysy-fade-up delay-1" style="padding:1rem;">
      <div class="ysy-label-en">join ysyplat · create account</div>
      <div class="ysy-hero" style="margin:0.5rem 0 1rem;font-size:clamp(2rem,4vw,4rem);">
        GET STARTED
      </div>
      <p style="color:rgba(255,255,255,0.6);font-size:clamp(0.85rem,1.2vw,1rem);line-height:1.7;">
        创建您的账户，开启云端之旅<br>
        <span style="color:rgba(255,255,255,0.3);font-size:0.8rem;">Create your account and start your cloud journey</span>
      </p>
      <div style="margin-top:2rem;display:flex;flex-direction:column;gap:0.8rem;">
        <div style="display:flex;align-items:center;gap:0.8rem;color:rgba(255,255,255,0.6);font-size:0.9rem;">
          <i class="fas fa-shield-alt" style="color:#10b981;width:20px;"></i> 企业级安全加密
        </div>
        <div style="display:flex;align-items:center;gap:0.8rem;color:rgba(255,255,255,0.6);font-size:0.9rem;">
          <i class="fas fa-bolt" style="color:#f5a623;width:20px;"></i> 毫秒级部署响应
        </div>
        <div style="display:flex;align-items:center;gap:0.8rem;color:rgba(255,255,255,0.6);font-size:0.9rem;">
          <i class="fas fa-headset" style="color:#6366f1;width:20px;"></i> 7×24 小时技术支持
        </div>
      </div>
    </div>

    <!-- 右侧注册卡片 -->
    <div class="ysy-fade-up delay-3">
      <div class="liquidGlass-wrapper" style="cursor:default;">
        <div class="liquidGlass-effect"></div>
        <div class="liquidGlass-tint"></div>
        <div class="liquidGlass-shine"></div>
        <div class="liquidGlass-text">
          <div class="ysy-card" style="padding:2.5rem;max-height:90vh;overflow-y:auto;">
            
            <div style="display:flex;align-items:center;gap:0.6rem;margin-bottom:1.2rem;">
              {if $Setting.web_logo}<img src="{$Setting.web_logo}" style="height:28px;">{/if}
              <span style="color:#fff;font-size:1.1rem;font-weight:700;">{$Lang.register}</span>
            </div>

            <ul class="ysy-auth__tabs" style="border-bottom-color:rgba(255,255,255,0.1);margin-bottom:1.2rem;">
              {if $Register.allow_register_phone}
                <li class="nav-item">
                  <a class="nav-link {if $Get.action=="phone" || !$Get.action}active{/if}" data-toggle="tab" href="#phone" role="tab" style="color:rgba(255,255,255,0.5)!important;background:transparent!important;border:none!important;padding:0.5rem 0.2rem!important;">{$Lang.mobile_registration}</a>
                </li>
              {/if}
              {if $Register.allow_register_email}
                <li class="nav-item">
                  <a class="nav-link {if ($Register.allow_register_email && !$Register.allow_register_phone) || $Get.action=="email"}active{/if}" data-toggle="tab" href="#email" role="tab" style="color:rgba(255,255,255,0.5)!important;background:transparent!important;border:none!important;padding:0.5rem 0.2rem!important;">{$Lang.email_registration}</a>
                </li>
              {/if}
            </ul>

            <div class="tab-content">
              {if $Register.allow_register_email}
              <div id="email" class="tab-pane {if ($Register.allow_register_email && !$Register.allow_register_phone) || $Get.action=="email"}active{/if}" role="tabpanel">
                <form class="needs-validation" novalidate method="post" action="/register?action=email" onsubmit="encryptPass('phonePwd');encryptPass('phonePwdCheck');">
                  <div class="form-group" style="margin-bottom:0.8rem;">
                    <label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.mailbox}</label>
                    <input type="text" class="ysy-input" id="emailInp" name="email" placeholder="{$Lang.please_input_email}" value="{$Post.email}" required>
                  </div>
                  {if $Verify.allow_register_email_captcha==1}
                  {include file="includes/verify" type="allow_register_email_captcha" positon="top"}
                  {/if}
                  {if $Register.allow_email_register_code==1}
                  <div class="form-group" style="margin-bottom:0.8rem;">
                    <label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.verification_code}</label>
                    <div style="display:flex;gap:0.5rem;">
                      <input type="text" class="ysy-input" id="code" name="code" placeholder="{$Lang.please_enter_code}" value="{$Post.code}" required>
                      <button class="ysy-btn ysy-btn--ghost" type="button" onclick="getCode(this,'register_email_send','allow_register_email_captcha')" style="white-space:nowrap;padding:0.85rem 1rem;">{$Lang.get_code}</button>
                    </div>
                  </div>
                  {/if}
                  <div class="form-group" style="margin-bottom:0.8rem;">
                    <label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.password}</label>
                    <input type="password" class="ysy-input" name="password" id="phonePwd" placeholder="{$Lang.please_enter_password}" required>
                  </div>
                  <div class="form-group" style="margin-bottom:0.8rem;">
                    <label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.confirm_password}</label>
                    <input type="password" class="ysy-input" name="checkPassword" id="phonePwdCheck" placeholder="{$Lang.please_password_again}" required>
                  </div>
                  {foreach $Register.login_register_custom_require as $custom}
                  <div class="form-group" style="margin-bottom:0.8rem;">
                    <label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Register[login_register_custom_require_list][$custom.name]}</label>
                    <input type="{if $custom.name=='password'}password{else}text{/if}" class="ysy-input" name="{$custom.name}" id="{$custom.name}" value="{$Post[$custom.name]}">
                  </div>
                  {/foreach}
                  {foreach $Register.fields as $k => $list}
                  <div class="form-group" style="margin-bottom:0.8rem;">
                    <label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$list.fieldname}</label>
                    {if $list.fieldtype == 'dropdown'}
                      <select name="fields[{$list.id}]" class="ysy-input">
                        {foreach $list.dropdown_option as $key => $val}
                          <option value="{$key}" style="color:#000;">{$val}</option>
                        {/foreach}
                      </select>
                    {elseif $list.fieldtype == 'password'}
                      <input name="fields[{$list.id}]" type="password" class="ysy-input" placeholder="{$Lang.custom_password_box}" />
                    {elseif $list.fieldtype == 'text' || $list.fieldtype == 'link'}
                      <input name="fields[{$list.id}]" type="text" class="ysy-input" placeholder="{$list.fieldname}" />
                    {elseif $list.fieldtype == 'tickbox'}
                      <label style="color:rgba(255,255,255,0.7);font-size:0.82rem;display:flex;align-items:center;gap:0.5rem;">
                        <input type="checkbox" name="fields[{$list.id}]" style="accent-color:#6366f1;"> {$list.fieldname}
                      </label>
                    {elseif $list.fieldtype == 'textarea'}
                      <textarea name="fields[{$list.id}]" cols="30" rows="3" class="ysy-input" style="border-radius:1rem;"></textarea>
                    {/if}
                  </div>
                  {/foreach}
                  {if $setsaler == '2'}
                  <div class="form-group" style="margin-bottom:0.8rem;">
                    <label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.sales_representative}</label>
                    <select name="sale_id" class="ysy-input">
                      <option value="0" style="color:#000;">{$Lang.nothing}</option>
                      {foreach $saler as $list}
                      <option {if $list.id==$Post.id}selected{/if} value="{$list.id}" style="color:#000;">{$list.user_nickname}</option>
                      {/foreach}
                    </select>
                  </div>
                  {/if}
                  <div class="mt-2">
                    <button class="ysy-btn ysy-btn--primary" style="width:100%;" type="submit" onclick="if(!beforeSubmit(this)){ return false;}">{$Lang.register}</button>
                  </div>
                </form>
              </div>
              {/if}
              {if $Register.allow_register_phone}
              <div id="phone" class="tab-pane {if $Get.action=="phone" || !$Get.action}active{/if}" role="tabpanel">
                <form class="needs-validation" novalidate method="post" action="/register?action=phone" onsubmit="encryptPass('emailPwd');encryptPass('emailPwdCheck');">
                  <div class="form-group" style="margin-bottom:0.8rem;">
                    <label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.phone_number}</label>
                    <div style="display:flex;gap:0.5rem;">
                      {if $Register.allow_login_register_sms_global==1}
                      <select class="ysy-input" style="width:auto;flex-shrink:0;" name="phone_code" id="phoneCodeSel">
                        {foreach $SmsCountry as $list}
                        <option value="{$list.phone_code}" {if $list.phone_code=="+86"}selected{/if} style="color:#000;">{$list.link}</option>
                        {/foreach}
                      </select>
                      {/if}
                      <input type="text" class="ysy-input" id="phoneInp" name="phone" placeholder="{$Lang.please_enter_your_mobile_phone_number}" value="{$Post.phone}" required>
                    </div>
                  </div>
                  {if $Verify.allow_register_phone_captcha==1}
                  {include file="includes/verify" type="allow_register_phone_captcha" positon="top"}
                  {/if}
                  <div class="form-group" style="margin-bottom:0.8rem;">
                    <label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.verification_code}</label>
                    <div style="display:flex;gap:0.5rem;">
                      <input type="text" class="ysy-input" id="code" name="code" placeholder="{$Lang.please_enter_code}" value="{$Post.code}" required>
                      <button class="ysy-btn ysy-btn--ghost" type="button" onclick="getCode(this,'register_phone_send','allow_register_phone_captcha')" style="white-space:nowrap;padding:0.85rem 1rem;">{$Lang.get_code}</button>
                    </div>
                  </div>
                  <div class="form-group" style="margin-bottom:0.8rem;">
                    <label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.password}</label>
                    <input type="password" class="ysy-input" name="password" id="emailPwd" placeholder="{$Lang.please_enter_password}" required>
                  </div>
                  <div class="form-group" style="margin-bottom:0.8rem;">
                    <label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.confirm_password}</label>
                    <input type="password" class="ysy-input" name="checkPassword" id="emailPwdCheck" placeholder="{$Lang.please_password_again}" required>
                  </div>
                  {foreach $Register.login_register_custom_require as $custom}
                  <div class="form-group" style="margin-bottom:0.8rem;">
                    <label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Register[login_register_custom_require_list][$custom.name]}</label>
                    <input type="{if $custom.name=='password'}password{else}text{/if}" class="ysy-input" name="{$custom.name}" id="{$custom.name}" value="{$Post[$custom.name]}">
                  </div>
                  {/foreach}
                  {foreach $Register.fields as $k => $list}
                  <div class="form-group" style="margin-bottom:0.8rem;">
                    <label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$list.fieldname}</label>
                    {if $list.fieldtype == 'dropdown'}
                      <select name="fields[{$list.id}]" class="ysy-input">
                        {foreach $list.dropdown_option as $key => $val}
                        <option value="{$key}" style="color:#000;">{$val}</option>
                        {/foreach}
                      </select>
                    {elseif $list.fieldtype == 'password'}
                      <input name="fields[{$list.id}]" type="password" class="ysy-input" placeholder="{$Lang.custom_password_box}" />
                    {elseif $list.fieldtype == 'text' || $list.fieldtype == 'link'}
                      <input name="fields[{$list.id}]" type="text" class="ysy-input" placeholder="{$list.fieldname}" />
                    {elseif $list.fieldtype == 'tickbox'}
                      <label style="color:rgba(255,255,255,0.7);display:flex;align-items:center;gap:0.5rem;font-size:0.85rem;">
                        <input type="checkbox" name="fields[{$list.id}]" style="accent-color:#6366f1;"> {$list.fieldname}
                      </label>
                    {elseif $list.fieldtype == 'textarea'}
                      <textarea name="fields[{$list.id}]" cols="30" rows="3" class="ysy-input" style="border-radius:1rem;"></textarea>
                    {/if}
                  </div>
                  {/foreach}
                  {if $setsaler == '2'}
                  <div class="form-group" style="margin-bottom:0.8rem;">
                    <label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.sales_representative}</label>
                    <select name="sale_id" class="ysy-input">
                      <option value="0" style="color:#000;">{$Lang.nothing}</option>
                      {foreach $saler as $list}
                      <option value="{$list.id}" style="color:#000;">{$list.user_nickname}</option>
                      {/foreach}
                    </select>
                  </div>
                  {/if}
                  <div class="mt-2">
                    <button class="ysy-btn ysy-btn--primary" style="width:100%;" type="submit" onclick="if(!beforeSubmit(this)) {return false;}">{$Lang.register}</button>
                  </div>
                </form>
              </div>
              {/if}
            </div>

            <!-- 隐私协议 -->
            <div style="margin-top:1rem;text-align:center;font-size:0.78rem;color:rgba(255,255,255,0.4);">
              <input type="checkbox" id="agreePrivacy" style="accent-color:#6366f1;">
              <span>
                {$Lang.have_read_agree}
                <a href="{$Setting.web_tos_url}" target="_blank" style="color:#a5b4fc;">{$Lang.terms_service}</a>
                {$Lang.ands}
                <a href="{$Setting.web_privacy_url}" target="_blank" style="color:#a5b4fc;">{$Lang.privacy_policy}</a>
              </span>
            </div>

            <div style="margin-top:1rem;text-align:center;color:rgba(255,255,255,0.4);font-size:0.85rem;">
              {$Lang.there_already_account} <a href="login" style="color:#a5b4fc;text-decoration:none;font-weight:600;">{$Lang.sign_in}</a>
            </div>

            <!-- 极验 -->
            <div id="ysy-geetest" class="ysy-geetest-wrap" style="margin-top:0.5rem;"></div>

          </div>
        </div>
      </div>
    </div>

  </div>
</div>

{if $Setting.login_footer}
<div style="text-align:center;padding:0.5rem;background:rgba(255,255,255,0.05);color:rgba(255,255,255,0.4);font-size:0.8rem;">{$Setting.login_footer}</div>
{/if}

<script src="/themes/clientarea/ysyplat/assets/js/public.js"></script>
<script>
    function beforeSubmit(_this)
    {
        var is_checked = $('#agreePrivacy:checked')
        if(is_checked.length == 0)
        {
            toastr.error('{$Lang.check_privacy}');
            return false;
        }
        $(_this).parents('form').submit();
    }

    // 极验4.0
    if (typeof YSY_GEETEST_CONFIG !== 'undefined' && YSY_GEETEST_CONFIG.captchaId) {
        var s = document.createElement('script');
        s.src = 'https://static.geetest.com/v4/gt4.js';
        s.onload = function() {
            initGeetest4({
                captchaId: YSY_GEETEST_CONFIG.captchaId,
                product: YSY_GEETEST_CONFIG.product,
                language: YSY_GEETEST_CONFIG.language,
            }, function(captcha) {
                captcha.appendTo('#ysy-geetest');
                window.__ysy_geetest = captcha;
                $('form').on('submit', function(e) {
                    if (captcha.isReady && !captcha.isSuccess) {
                        e.preventDefault();
                        captcha.showCaptcha();
                        return false;
                    }
                });
                captcha.onSuccess(function() {
                    var r = captcha.getValidate();
                    $('form').append('<input type="hidden" name="lot_number" value="' + r.lot_number + '">');
                    $('form').append('<input type="hidden" name="captcha_output" value="' + r.captcha_output + '">');
                    $('form').append('<input type="hidden" name="pass_token" value="' + r.pass_token + '">');
                    $('form').append('<input type="hidden" name="gen_time" value="' + r.gen_time + '">');
                });
            });
        };
        document.head.appendChild(s);
    }
</script>
