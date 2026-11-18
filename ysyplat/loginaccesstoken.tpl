<link href="/themes/clientarea/ysyplat/assets/css/icons.min.css?v={`$Ver}" rel="stylesheet" type="text/css" />
<link href="/themes/clientarea/ysyplat/assets_custom/css/bento.css?v={$Ver}" rel="stylesheet">
<script src="/themes/clientarea/ysyplat/assets_custom/js/geetest-config.js?v={$Ver}"></script>
<script src="/themes/clientarea/ysyplat/assets/js/public.js?v={$Ver}" type="text/javascript"></script>
<style>html,body{margin:0;padding:0}body{font-family:'Inter','Noto Sans SC',sans-serif}</style>
<svg style="position:absolute;width:0;height:0;overflow:hidden"><filter id="glass-distortion"><feTurbulence type="fractalNoise" baseFrequency="0.02" numOctaves="3" result="noise"/><feDisplacementMap in="SourceGraphic" in2="noise" scale="4" xChannelSelector="R" yChannelSelector="G"/></filter></svg>
{if $ErrorMsg}<div style="position:fixed;top:1rem;right:1rem;z-index:9999;background:rgba(239,68,68,0.9);backdrop-filter:blur(12px);border-radius:1rem;padding:0.8rem 1.2rem;color:#fff;font-size:0.9rem;box-shadow:0 8px 24px rgba(239,68,68,0.3);"><i class="fas fa-exclamation-circle mr-2"></i>{$ErrorMsg}</div>{/if}
{if $SuccessMsg}<div style="position:fixed;top:1rem;right:1rem;z-index:9999;background:rgba(16,185,129,0.9);backdrop-filter:blur(12px);border-radius:1rem;padding:0.8rem 1.2rem;color:#fff;font-size:0.9rem;box-shadow:0 8px 24px rgba(16,185,129,0.3);"><i class="fas fa-check-circle mr-2"></i>{$SuccessMsg}</div>{/if}
<script type="text/javascript">var mk='{$Setting.msfntk}';</script>
{if $Setting.login_header}<div style="text-align:center;padding:0.5rem;background:rgba(255,255,255,0.05);color:rgba(255,255,255,0.6);font-size:0.85rem;">{$Setting.login_header}</div>{/if}
<div class="ysy-bg" style="display:flex;align-items:center;justify-content:center;min-height:100vh;padding:1rem;">
  <div class="ysy-bento" style="max-width:1000px;width:100%;grid-template-columns:1fr 1fr;align-items:center;">
    <div class="ysy-fade-up delay-1" style="padding:1rem;">
      <div class="ysy-label-en">token login</div>
      <div class="ysy-hero" style="margin:0.5rem 0 1rem;font-size:clamp(2rem,3.5vw,3.5rem);">ACCESS<br>TOKEN</div>
      <p style="color:rgba(255,255,255,0.55);font-size:clamp(0.85rem,1.1vw,0.95rem);line-height:1.7;">使用访问令牌登录账户<br><span style="color:rgba(255,255,255,0.3);font-size:0.8rem;">Login with access token</span></p>
    </div>
    <div class="ysy-fade-up delay-3">
      <div class="liquidGlass-wrapper" style="cursor:default;">
        <div class="liquidGlass-effect"></div><div class="liquidGlass-tint"></div><div class="liquidGlass-shine"></div>
        <div class="liquidGlass-text">
          <div class="ysy-card" style="padding:2.5rem;">
            <div style="display:flex;align-items:center;gap:0.6rem;margin-bottom:1.2rem;">
              {if $Setting.web_logo}<img src="{$Setting.web_logo}" style="height:28px;">{/if}
              <span style="color:#fff;font-size:1.1rem;font-weight:700;">{$Lang.sign_in}</span>
            </div>
            <ul class="nav nav-tabs" style="border-bottom:1px solid rgba(255,255,255,0.1);margin-bottom:1.2rem;display:flex;gap:1.5rem;list-style:none;padding:0;">
              {if $Login.allow_login_email}<li><a class="nav-link {if $Get.action=="email" || !$Get.action}active{/if}" data-toggle="tab" href="#email" style="color:rgba(255,255,255,0.5)!important;background:transparent!important;border:none!important;padding:0.5rem 0.2rem!important;font-size:0.9rem;display:block;">{$Lang.email_login}</a></li>{/if}
              {if $Login.allow_login_phone==1}<li><a class="nav-link {if $Get.action=="phone"||$Get.action=="phone_code"}active{/if}" data-toggle="tab" href="#phone" style="color:rgba(255,255,255,0.5)!important;background:transparent!important;border:none!important;padding:0.5rem 0.2rem!important;font-size:0.9rem;display:block;">{$Lang.mobile_login}</a></li>{/if}
            </ul>
            <div class="tab-content">
              {if $Login.allow_login_email || $Login.allow_id}
              <div id="email" class="tab-pane {if $Get.action=="email" || !$Get.action}active{/if}">
                <form method="post" action="/loginAccessToken?action=email">
                  <input type="hidden" name="redirect_url" value="{$redirect_url}">
                  <div class="form-group" style="margin-bottom:0.8rem;"><label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{if $Login.allow_login_email}{$Lang.mailbox}{else}ID{/if}</label><input type="text" class="ysy-input" name="email" value="{$Post.email}" placeholder="{$Lang.please_enter_your}{if $Login.allow_login_email}{$Lang.mailbox}{/if}"></div>
                  <div class="form-group" style="margin-bottom:0.8rem;"><label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.password}</label><input type="password" class="ysy-input" name="password" placeholder="{$Lang.please_enter_password}"></div>
                  {if $Login.allow_login_email_captcha==1 && $Login.is_captcha==1}{include file="includes/verify" type="allow_login_email_captcha" positon="top"}{/if}
                  {if $Login.second_verify_action_home_login==1}<button class="ysy-btn ysy-btn--primary" style="width:100%;" type="button" onclick="loginBefore('email');">{$Lang.sign_in}</button>{else/}<button class="ysy-btn ysy-btn--primary" style="width:100%;" type="submit">{$Lang.sign_in}</button>{/if}
                </form>
              </div>
              {/if}
              {if $Login.allow_login_phone}
              <div id="phone" class="tab-pane {if $Get.action=="phone"||$Get.action=="phone_code"}active{/if}">
                <form method="post" action="/loginAccessToken?action=phone">
                  <input type="hidden" name="redirect_url" value="{$redirect_url}">
                  <div class="form-group" style="margin-bottom:0.8rem;"><label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.phone_number}</label><div style="display:flex;gap:0.5rem;">{if $Login.allow_login_register_sms_global==1}<select class="ysy-input" style="width:auto;flex-shrink:0;" name="phone_code">{foreach $SmsCountry as $list}<option value="{$list.phone_code}" style="color:#000;">{$list.link}</option>{/foreach}</select>{/if}<input type="text" class="ysy-input" name="phone" value="{$Post.phone}" placeholder="{$Lang.please_enter_your_mobile_phone_number}"></div></div>
                  <div class="form-group allow_login_phone_captcha" style="margin-bottom:0.8rem;"><label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.password}</label><input type="password" class="ysy-input" name="password" placeholder="{$Lang.please_enter_password}"></div>
                  {if $Login.allow_login_phone_captcha==1 && $Login.is_captcha==1}{include file="includes/verify" type="allow_login_phone_captcha" positon="top"}{/if}
                  {if $Login.allow_login_code_captcha==1 && $Login.is_captcha==1}{include file="includes/verify" type="allow_login_code_captcha" positon="top"}{/if}
                  <div class="form-group allow_login_code_captcha" style="margin-bottom:0.8rem;display:none;"><label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.verification_code}</label><div style="display:flex;gap:0.5rem;"><input type="text" class="ysy-input" name="code" value="{$Post.code}" placeholder="{$Lang.please_enter_code}"><button class="ysy-btn ysy-btn--ghost" type="button" onclick="getCode(this,'login_send','allow_login_code_captcha')" style="white-space:nowrap;padding:0.85rem 1rem;">{$Lang.get_code}</button></div></div>
                  <div style="display:flex;justify-content:space-between;margin:0.5rem 0;">
                    <span onclick="phoneCheckToken(this,'allow_login_phone_captcha')" style="color:#a5b4fc;font-size:0.82rem;cursor:pointer;">{$Lang.verification_code_login}</span>
                    <span onclick="phoneCheckToken(this,'allow_login_code_captcha')" style="color:#a5b4fc;font-size:0.82rem;cursor:pointer;display:none;">{$Lang.password_login}</span>
                  </div>
                  {if $Login.second_verify_action_home_login==1}<button class="ysy-btn ysy-btn--primary" style="width:100%;" type="button" onclick="loginBefore('phone');">{$Lang.sign_in}</button>{else/}<button class="ysy-btn ysy-btn--primary" style="width:100%;" type="submit">{$Lang.sign_in}</button>{/if}
                </form>
              </div>
              {/if}
            </div>
            {if $Oauth}
            <div style="margin-top:1.2rem;text-align:center;">
              <div style="display:flex;align-items:center;gap:1rem;color:rgba(255,255,255,0.3);font-size:0.75rem;margin-bottom:0.8rem;"><span style="flex:1;height:1px;background:rgba(255,255,255,0.08);"></span>{$Lang.use_other_login}<span style="flex:1;height:1px;background:rgba(255,255,255,0.08);"></span></div>
              <div style="display:flex;justify-content:center;gap:0.6rem;">{foreach $Oauth as $list}<a href="{$list.url}" target="blank" style="display:inline-flex;align-items:center;justify-content:center;width:40px;height:40px;border-radius:50%;background:rgba(255,255,255,0.08);border:1px solid rgba(255,255,255,0.1);">{$list.img}</a>{/foreach}</div>
            </div>
            {/if}
            <div id="ysy-geetest" class="ysy-geetest-wrap" style="margin-top:0.5rem;"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
{if $Setting.login_footer}<div style="text-align:center;padding:0.5rem;background:rgba(255,255,255,0.05);color:rgba(255,255,255,0.4);font-size:0.8rem;">{$Setting.login_footer}</div>{/if}
<script type="text/javascript">
function phoneCheckToken(button,phone){if(button)$(button).hide().siblings().show();if(phone=="allow_login_phone_captcha"){$("#phone form").attr("action","/loginAccessToken?action=phone_code");$(".allow_login_phone_captcha").hide().find("input").attr("disabled","disabled");$(".allow_login_code_captcha").show().find("input").removeAttr("disabled")}else if(phone=="allow_login_code_captcha"){$("#phone form").attr("action","/loginAccessToken?action=phone");$(".allow_login_code_captcha").hide().find("input").attr("disabled","disabled");$(".allow_login_phone_captcha").show().find("input").removeAttr("disabled")}}
{if $Get.action=="phone_code"}phoneCheckToken("","allow_login_phone_captcha"){else/}phoneCheckToken("","allow_login_code_captcha"){/if}
if(typeof YSY_GEETEST_CONFIG!=='undefined'&&YSY_GEETEST_CONFIG.captchaId){var s=document.createElement('script');s.src='https://static.geetest.com/v4/gt4.js';s.onload=function(){initGeetest4({captchaId:YSY_GEETEST_CONFIG.captchaId,product:YSY_GEETEST_CONFIG.product,language:YSY_GEETEST_CONFIG.language},function(captcha){captcha.appendTo('#ysy-geetest');window.__ysy_geetest=captcha;$('form').on('submit',function(e){if(captcha.isReady&&!captcha.isSuccess){e.preventDefault();captcha.showCaptcha();return false}});captcha.onSuccess(function(){var r=captcha.getValidate();$('form').append('<input type="hidden" name="lot_number" value="'+r.lot_number+'">');$('form').append('<input type="hidden" name="captcha_output" value="'+r.captcha_output+'">');$('form').append('<input type="hidden" name="pass_token" value="'+r.pass_token+'">');$('form').append('<input type="hidden" name="gen_time" value="'+r.gen_time+'">')})})};document.head.appendChild(s)}
</script>
