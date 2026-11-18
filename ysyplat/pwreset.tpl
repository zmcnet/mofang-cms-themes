<link href="/themes/clientarea/ysyplat/assets/css/icons.min.css?v={`$Ver}" rel="stylesheet" type="text/css" />
<link href="/themes/clientarea/ysyplat/assets_custom/css/bento.css?v={$Ver}" rel="stylesheet">
<script src="/themes/clientarea/ysyplat/assets_custom/js/geetest-config.js?v={$Ver}"></script>
<script src="/themes/clientarea/ysyplat/assets/js/public.js?v={$Ver}"></script>

<style>html,body{margin:0;padding:0}body{font-family:'Inter','Noto Sans SC',sans-serif}</style>
<svg style="position:absolute;width:0;height:0;overflow:hidden"><filter id="glass-distortion"><feTurbulence type="fractalNoise" baseFrequency="0.02" numOctaves="3" result="noise"/><feDisplacementMap in="SourceGraphic" in2="noise" scale="4" xChannelSelector="R" yChannelSelector="G"/></filter></svg>

{if $ErrorMsg}<div style="position:fixed;top:1rem;right:1rem;z-index:9999;background:rgba(239,68,68,0.9);backdrop-filter:blur(12px);border-radius:1rem;padding:0.8rem 1.2rem;color:#fff;font-size:0.9rem;box-shadow:0 8px 24px rgba(239,68,68,0.3);"><i class="fas fa-exclamation-circle mr-2"></i>{$ErrorMsg}</div>{/if}
{if $SuccessMsg}<div style="position:fixed;top:1rem;right:1rem;z-index:9999;background:rgba(16,185,129,0.9);backdrop-filter:blur(12px);border-radius:1rem;padding:0.8rem 1.2rem;color:#fff;font-size:0.9rem;box-shadow:0 8px 24px rgba(16,185,129,0.3);"><i class="fas fa-check-circle mr-2"></i>{$SuccessMsg}</div>{/if}

<script>var mk='{$Setting.msfntk}';</script>

{if $Setting.login_header}<div style="text-align:center;padding:0.5rem;background:rgba(255,255,255,0.05);color:rgba(255,255,255,0.6);font-size:0.85rem;">{$Setting.login_header}</div>{/if}

<div class="ysy-bg" style="display:flex;align-items:center;justify-content:center;min-height:100vh;padding:1rem;">
  <div class="ysy-bento" style="max-width:1000px;width:100%;grid-template-columns:1fr 1fr;align-items:center;">
    <div class="ysy-fade-up delay-1" style="padding:1rem;">
      <div class="ysy-label-en">reset password</div>
      <div class="ysy-hero" style="margin:0.5rem 0 1rem;font-size:clamp(2rem,3.5vw,3.5rem);">RESET<br>PASSWORD</div>
      <p style="color:rgba(255,255,255,0.55);font-size:clamp(0.85rem,1.1vw,0.95rem);line-height:1.7;">请通过手机或邮箱找回密码<br><span style="color:rgba(255,255,255,0.3);font-size:0.8rem;">Retrieve via email or phone</span></p>
    </div>
    <div class="ysy-fade-up delay-3">
      <div class="liquidGlass-wrapper" style="cursor:default;">
        <div class="liquidGlass-effect"></div><div class="liquidGlass-tint"></div><div class="liquidGlass-shine"></div>
        <div class="liquidGlass-text">
          <div class="ysy-card" style="padding:2.5rem;">
            <div style="display:flex;align-items:center;gap:0.6rem;margin-bottom:1.2rem;">
              {if $Setting.web_logo}<img src="{$Setting.web_logo}" style="height:28px;">{/if}
              <span style="color:#fff;font-size:1.1rem;font-weight:700;">{$Lang.reset_password|default='重置密码'}</span>
            </div>
            <ul class="nav nav-tabs" style="border-bottom:1px solid rgba(255,255,255,0.1);margin-bottom:1.2rem;display:flex;gap:1.5rem;list-style:none;padding:0;">
              {if $Pwreset.allow_login_phone}
              <li><a class="nav-link active" data-toggle="tab" href="#phone" role="tab" style="color:rgba(255,255,255,0.5)!important;background:transparent!important;border:none!important;padding:0.5rem 0.2rem!important;font-size:0.9rem;position:relative;display:block;">{$Lang.mobile_phone_retrieval}<span style="position:absolute;bottom:-1px;left:0;right:0;height:2px;background:#fff;border-radius:1px;"></span></a></li>
              {/if}
              {if $Pwreset.allow_login_email}
              <li><a class="nav-link {if $Pwreset.allow_login_email && !$Pwreset.allow_login_phone}active{/if}" data-toggle="tab" href="#email" role="tab" style="color:rgba(255,255,255,0.5)!important;background:transparent!important;border:none!important;padding:0.5rem 0.2rem!important;font-size:0.9rem;display:block;">{$Lang.email_retrieval}</a></li>
              {/if}
            </ul>
            <div class="tab-content">
              {if $Pwreset.allow_login_email}
              <div id="email" class="tab-pane {if $Pwreset.allow_login_email && !$Pwreset.allow_login_phone}active{/if}">
                <form method="post" action="/pwreset?action=email">
                  <div class="form-group" style="margin-bottom:0.8rem;"><label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.mailbox}</label><input type="text" class="ysy-input" name="email" placeholder="{$Lang.please_input_email}" required></div>
                  {if $Verify.allow_email_forgetpwd_captcha==1}{include file="includes/verify" type="allow_email_forgetpwd_captcha" positon="top"}{/if}
                  <div class="form-group" style="margin-bottom:0.8rem;"><label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.verification_code}</label><div style="display:flex;gap:0.5rem;"><input type="text" class="ysy-input" name="code" placeholder="{$Lang.please_enter_code}" required><button class="ysy-btn ysy-btn--ghost" type="button" onclick="getCode(this,'reset_email_send','allow_email_forgetpwd_captcha')" style="white-space:nowrap;padding:0.85rem 1rem;">{$Lang.get_code}</button></div></div>
                  <div class="form-group" style="margin-bottom:0.8rem;"><label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.password}</label><input type="password" class="ysy-input" name="password" placeholder="{$Lang.please_enter_password}" required></div>
                  <div class="form-group" style="margin-bottom:0.8rem;"><label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.confirm_password}</label><input type="password" class="ysy-input" name="checkPassword" placeholder="{$Lang.please_password_again}" required></div>
                  <button class="ysy-btn ysy-btn--primary" style="width:100%;" type="submit">{$Lang.reset}</button>
                </form>
              </div>
              {/if}
              {if $Pwreset.allow_login_phone}
              <div id="phone" class="tab-pane active">
                <form method="post" action="/pwreset?action=phone">
                  <div class="form-group" style="margin-bottom:0.8rem;"><label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.phone_number}</label><div style="display:flex;gap:0.5rem;">{if $Pwreset.allow_login_register_sms_global==1}<select class="ysy-input" style="width:auto;flex-shrink:0;" name="phone_code">{foreach $SmsCountry as $list}<option value="{$list.phone_code}" style="color:#000;">{$list.link}</option>{/foreach}</select>{/if}<input type="text" class="ysy-input" name="phone" placeholder="{$Lang.please_enter_your_mobile_phone_number}" required></div></div>
                  {if $Verify.allow_phone_forgetpwd_captcha==1}{include file="includes/verify" type="allow_phone_forgetpwd_captcha" positon="top"}{/if}
                  <div class="form-group" style="margin-bottom:0.8rem;"><label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.verification_code}</label><div style="display:flex;gap:0.5rem;"><input type="text" class="ysy-input" name="code" placeholder="{$Lang.please_enter_code}" required><button class="ysy-btn ysy-btn--ghost" type="button" onclick="getCode(this,'reset_phone_send','allow_phone_forgetpwd_captcha')" style="white-space:nowrap;padding:0.85rem 1rem;">{$Lang.get_code}</button></div></div>
                  <div class="form-group" style="margin-bottom:0.8rem;"><label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.password}</label><input type="password" class="ysy-input" name="password" placeholder="{$Lang.please_enter_password}" required></div>
                  <div class="form-group" style="margin-bottom:0.8rem;"><label style="color:rgba(255,255,255,0.7);font-size:0.82rem;">{$Lang.confirm_password}</label><input type="password" class="ysy-input" name="checkPassword" placeholder="{$Lang.please_password_again}" required></div>
                  <button class="ysy-btn ysy-btn--primary" style="width:100%;" type="submit">{$Lang.reset}</button>
                </form>
              </div>
              {/if}
            </div>
            <div style="margin-top:1.2rem;text-align:center;color:rgba(255,255,255,0.4);font-size:0.85rem;">{$Lang.there_already_account} <a href="login" style="color:#a5b4fc;text-decoration:none;font-weight:600;">{$Lang.sign_in}</a></div>
            <div id="ysy-geetest" class="ysy-geetest-wrap" style="margin-top:0.5rem;"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

{if $Setting.login_footer}<div style="text-align:center;padding:0.5rem;background:rgba(255,255,255,0.05);color:rgba(255,255,255,0.4);font-size:0.8rem;">{$Setting.login_footer}</div>{/if}
<script>
if(typeof YSY_GEETEST_CONFIG!=='undefined'&&YSY_GEETEST_CONFIG.captchaId){var s=document.createElement('script');s.src='https://static.geetest.com/v4/gt4.js';s.onload=function(){initGeetest4({captchaId:YSY_GEETEST_CONFIG.captchaId,product:YSY_GEETEST_CONFIG.product,language:YSY_GEETEST_CONFIG.language},function(captcha){captcha.appendTo('#ysy-geetest');window.__ysy_geetest=captcha;$('form').on('submit',function(e){if(captcha.isReady&&!captcha.isSuccess){e.preventDefault();captcha.showCaptcha();return false}});captcha.onSuccess(function(){var r=captcha.getValidate();$('form').append('<input type="hidden" name="lot_number" value="'+r.lot_number+'">');$('form').append('<input type="hidden" name="captcha_output" value="'+r.captcha_output+'">');$('form').append('<input type="hidden" name="pass_token" value="'+r.pass_token+'">');$('form').append('<input type="hidden" name="gen_time" value="'+r.gen_time+'">')})})};document.head.appendChild(s)}
</script>
