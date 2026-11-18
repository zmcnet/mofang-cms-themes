<link href="/themes/clientarea/ysyplat/assets/css/icons.min.css?v={$Ver}" rel="stylesheet" type="text/css" />
<link href="/themes/clientarea/ysyplat/assets_custom/css/bento.css?v={$Ver}" rel="stylesheet">
<script src="/themes/clientarea/ysyplat/assets_custom/js/geetest-config.js?v={$Ver}"></script>
<script src="/themes/clientarea/ysyplat/assets/js/crypto-js.min.js" type="text/javascript"></script>
<script src="/themes/clientarea/ysyplat/assets/js/public.js?v={$Ver}" type="text/javascript"></script>

<style>
  html, body { margin: 0; padding: 0; height: 100%; }
  body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", "PingFang SC", "Microsoft YaHei", sans-serif; }
  .ysy-login-bg {
    position: fixed; inset: 0;
    background: #0a0a0f url(https://www.ysyplat.cn/upload/back.webp) center / cover no-repeat;
    display: flex; align-items: center; justify-content: center; padding: 1rem;
  }
  .ysy-login-bg::before {
    content: ''; position: absolute; inset: 0;
    background: radial-gradient(ellipse at center, rgba(10,10,15,0.4) 0%, rgba(10,10,15,0.85) 100%);
    pointer-events: none;
  }
  .ysy-login-center { position: relative; z-index: 1; width: 100%; max-width: 420px; }
  .ysy-login-brand { text-align: center; margin-bottom: 1.5rem; }
  .ysy-login-brand .ysy-hero { font-size: clamp(2rem,4vw,3rem); line-height: 1.1; }
  .ysy-login-brand p { color: rgba(255,255,255,0.6); font-size: 0.85rem; margin-top: 0.3rem; }
  .ysy-login-step { display: none; opacity: 0; }
  .ysy-login-step.active { display: flex; flex-direction: column; gap: 0.8rem; animation: ysyStepIn 0.4s ease forwards; }
  @keyframes ysyStepIn { from { opacity: 0; transform: translateX(20px); } to { opacity: 1; transform: translateX(0); } }
  .ysy-toast {
    position: fixed; top: 1.5rem; left: 50%; transform: translateX(-50%); z-index: 9999;
    padding: 0.7rem 1.5rem; border-radius: 3rem; font-size: 0.88rem;
    backdrop-filter: blur(12px); box-shadow: 0 8px 32px rgba(0,0,0,0.3);
  }
  .ysy-toast--error { background: rgba(239,68,68,0.9); color: #fff; }
  .ysy-toast--success { background: rgba(16,185,129,0.9); color: #fff; }
  /* 卡片内文字加深可读性 */
  .ysy-card label { color: rgba(255,255,255,0.8) !important; }
  .ysy-card .ysy-input { color: #fff; }
  .ysy-card .ysy-input::placeholder { color: rgba(255,255,255,0.4); }
  .ysy-card .form-control { background: rgba(255,255,255,0.08); border: 1px solid rgba(255,255,255,0.12); color: #fff; border-radius: 1rem; }
  .ysy-card .form-control:focus { background: rgba(255,255,255,0.12); border-color: rgba(255,255,255,0.3); color: #fff; }
  .ysy-card select.form-control option { background: #1a1a2e; color: #fff; }
  .ysy-card .input-group-append .btn { background: rgba(255,255,255,0.1); border: 1px solid rgba(255,255,255,0.12); color: #fff; border-radius: 0 1rem 1rem 0; }
  .ysy-card .input-group .form-control { border-radius: 1rem 0 0 1rem; }
  .ysy-card .input-group-append img { border-radius: 0 1rem 1rem 0; }
</style>

<svg style="position:absolute;width:0;height:0;overflow:hidden">
  <filter id="glass-distortion">
    <feTurbulence type="fractalNoise" baseFrequency="0.02" numOctaves="3" result="noise"/>
    <feDisplacementMap in="SourceGraphic" in2="noise" scale="4" xChannelSelector="R" yChannelSelector="G"/>
  </filter>
</svg>

{if $ErrorMsg}
<div class="ysy-toast ysy-toast--error" style="display:flex;align-items:center;gap:0.5rem;">
  <i class="fas fa-exclamation-circle"></i> {$ErrorMsg}
</div>
{/if}
{if $SuccessMsg}
<div class="ysy-toast ysy-toast--success" style="display:flex;align-items:center;gap:0.5rem;">
  <i class="fas fa-check-circle"></i> {$SuccessMsg}
</div>
{/if}

<script type="text/javascript">
  var mk = '{$Setting.msfntk}';
  var loginMethod = 'email';
</script>

<div class="ysy-login-bg">
  <div class="ysy-login-center ysy-fade-up">

    <div class="ysy-login-brand">
      <div class="ysy-hero">YSY PLAT</div>
      <p>新一代云服务平台 · Deploy in seconds</p>
    </div>

    <div class="liquidGlass-wrapper" style="cursor:default;">
      <div class="liquidGlass-effect"></div>
      <div class="liquidGlass-tint"></div>
      <div class="liquidGlass-shine"></div>
      <div class="liquidGlass-text">
        <div class="ysy-card" style="padding:2rem 1.8rem;">

          <!-- Step 1 -->
          <div id="loginStep1" class="ysy-login-step active">
            <div style="display:flex;align-items:center;gap:0.5rem;margin-bottom:0.3rem;">
              <span class="ysy-step__dot active" style="width:24px;height:6px;border-radius:3px;background:#fff;display:inline-block;"></span>
              <span style="color:rgba(255,255,255,0.5);font-size:0.75rem;">{$Lang.sign_in}</span>
            </div>
            <div style="display:flex;gap:0.4rem;margin-bottom:0.2rem;">
              <button class="ysy-btn ysy-btn--ghost" style="padding:0.3rem 0.8rem;font-size:0.8rem;border-radius:2rem;" onclick="loginMethod='email';document.getElementById('loginEmailInput').placeholder='{$Lang.please_input_email}';document.getElementById('loginEmailInput').type='email';">{$Lang.mailbox}</button>
              {if $Login.allow_login_phone}
              <button class="ysy-btn ysy-btn--ghost" style="padding:0.3rem 0.8rem;font-size:0.8rem;border-radius:2rem;" onclick="loginMethod='phone';document.getElementById('loginEmailInput').placeholder='{$Lang.please_enter_your_mobile_phone_number}';document.getElementById('loginEmailInput').type='text';">{$Lang.phone_number}</button>
              {/if}
            </div>
            <input type="text" id="loginEmailInput" class="ysy-input" placeholder="{$Lang.please_input_email}" autofocus>
            <button class="ysy-btn ysy-btn--primary" style="width:100%;margin-top:0.2rem;" onclick="loginGoStep2()">
              {$Lang.continue|default='继续'} <i class="fas fa-arrow-right"></i>
            </button>
            <div style="text-align:center;margin-top:0.6rem;color:rgba(255,255,255,0.5);font-size:0.82rem;">
              {$Lang.no_account_yet} <a href="/register" style="color:#c7d2fe;text-decoration:none;font-weight:600;">{$Lang.register_now}</a>
            </div>
          </div>

          <!-- Step 2 -->
          <div id="loginStep2" class="ysy-login-step">
            <button onclick="loginBackStep1()" style="color:rgba(255,255,255,0.6);cursor:pointer;font-size:0.82rem;border:none;background:none;display:inline-flex;align-items:center;gap:0.3rem;padding:0;">
              <i class="fas fa-arrow-left"></i> {$Lang.back|default='返回'}
            </button>
            <div style="display:flex;align-items:center;gap:0.5rem;">
              <span style="width:6px;height:6px;border-radius:50%;background:rgba(255,255,255,0.15);display:inline-block;"></span>
              <span style="width:24px;height:6px;border-radius:3px;background:#fff;display:inline-block;"></span>
              <span style="color:rgba(255,255,255,0.5);font-size:0.75rem;">{$Lang.password}</span>
            </div>
            <div style="color:rgba(255,255,255,0.6);font-size:0.82rem;" id="loginEmailDisplay"></div>

            <form id="loginForm" method="post" action="/login?action=email">
              <input type="hidden" name="email" id="loginEmailHidden">
              <div class="form-group" style="margin-bottom:0.4rem;">
                <label>{$Lang.password}</label>
                <input type="password" class="form-control" id="emailPwdInp" name="password" placeholder="{$Lang.please_enter_password}" autofocus>
              </div>
              {if $Login.allow_login_email_captcha==1 && $Login.is_captcha==1}
                {include file="includes/verify" type="allow_login_email_captcha" positon="top"}
              {/if}
              <div style="display:flex;justify-content:flex-end;margin:0.2rem 0 0.4rem;">
                <a href="/pwreset" style="color:rgba(255,255,255,0.5);font-size:0.78rem;text-decoration:none;">{$Lang.forget_the_password}</a>
              </div>
              {if $Login.second_verify_action_home_login==1}
                <button class="ysy-btn ysy-btn--primary" style="width:100%;" type="button" onclick="loginBefore('email');">{$Lang.sign_in}</button>
              {else/}
                <button class="ysy-btn ysy-btn--primary" style="width:100%;" type="submit">{$Lang.sign_in}</button>
              {/if}
            </form>

            <form id="loginFormPhone" method="post" action="/login?action=phone" style="display:none;">
              <input type="hidden" name="phone" id="loginPhoneHidden">
              <div class="form-group" style="margin-bottom:0.4rem;">
                <label>{$Lang.password}</label>
                <input type="password" class="form-control" id="phonePwdInp" name="password" placeholder="{$Lang.please_enter_password}">
              </div>
              {if $Login.allow_login_phone_captcha==1 && $Login.is_captcha==1}{include file="includes/verify" type="allow_login_phone_captcha" positon="top"}{/if}
              {if $Login.allow_login_code_captcha==1 && $Login.is_captcha==1}{include file="includes/verify" type="allow_login_code_captcha" positon="top"}{/if}
              <div class="form-group allow_login_code_captcha" style="display:none;margin-bottom:0.4rem;">
                <label>{$Lang.verification_code}</label>
                <div style="display:flex;gap:0.4rem;">
                  <input type="text" class="form-control" id="phoneCodeInp" name="code" placeholder="{$Lang.please_enter_code}">
                  <button class="ysy-btn ysy-btn--ghost" type="button" onclick="getCode(this,'login_send','allow_login_code_captcha')" style="white-space:nowrap;padding:0.6rem 0.8rem;font-size:0.78rem;">{$Lang.get_code}</button>
                </div>
              </div>
              <div style="display:flex;justify-content:space-between;margin:0.2rem 0;">
                <span onclick="phoneCheck(this,'allow_login_phone_captcha')" style="color:#c7d2fe;font-size:0.78rem;cursor:pointer;">{$Lang.verification_code_login}</span>
                <span onclick="phoneCheck(this,'allow_login_code_captcha')" style="color:#c7d2fe;font-size:0.78rem;cursor:pointer;display:none;">{$Lang.password_login}</span>
              </div>
              <button class="ysy-btn ysy-btn--primary" style="width:100%;" type="submit">{$Lang.sign_in}</button>
            </form>
          </div>

          <div id="ysy-geetest" class="ysy-geetest-wrap" style="margin-top:0.4rem;"></div>

          {if $Oauth}
          <div style="margin-top:1rem;text-align:center;">
            <div style="display:flex;align-items:center;gap:0.8rem;color:rgba(255,255,255,0.3);font-size:0.7rem;margin-bottom:0.5rem;">
              <span style="flex:1;height:1px;background:rgba(255,255,255,0.08);"></span>
              {$Lang.use_other_login}
              <span style="flex:1;height:1px;background:rgba(255,255,255,0.08);"></span>
            </div>
            <div style="display:flex;justify-content:center;gap:0.5rem;">
              {foreach $Oauth as $list}
              <a href="{$list.url}" target="blank" style="display:inline-flex;align-items:center;justify-content:center;width:36px;height:36px;border-radius:50%;background:rgba(255,255,255,0.08);border:1px solid rgba(255,255,255,0.1);transition:all 0.2s;">
                {$list.img}
              </a>
              {/foreach}
            </div>
          </div>
          {/if}

        </div>
      </div>
    </div>

    <div style="text-align:center;margin-top:1.5rem;color:rgba(255,255,255,0.35);font-size:0.72rem;">
      &copy; {$Setting.company_name}.
      <a href="https://beian.miit.gov.cn" target="_blank" rel="noopener" style="color:rgba(255,255,255,0.4);text-decoration:none;">浙ICP备2023036308号-8</a>
    </div>

  </div>
</div>

<script type="text/javascript">
  {if $Get.action=="phone_code"}
  phoneCheck("","allow_login_phone_captcha")
  {else/}
  phoneCheck("","allow_login_code_captcha")
  {/if}

  function loginGoStep2() {
    var val = document.getElementById('loginEmailInput').value.trim();
    if (!val) {
      toastr.error('{$Lang.please_enter_your}{$Lang.mailbox}');
      return;
    }
    document.getElementById('loginStep1').classList.remove('active');
    document.getElementById('loginStep2').classList.add('active');
    document.getElementById('loginEmailDisplay').textContent = val;
    if (loginMethod === 'email') {
      document.getElementById('loginEmailHidden').value = val;
      document.getElementById('loginForm').style.display = 'block';
      document.getElementById('loginFormPhone').style.display = 'none';
      document.getElementById('loginForm').action = '/login?action=email';
      setTimeout(function() { document.getElementById('emailPwdInp').focus(); }, 300);
    } else {
      document.getElementById('loginPhoneHidden').value = val;
      document.getElementById('loginForm').style.display = 'none';
      document.getElementById('loginFormPhone').style.display = 'block';
      document.getElementById('loginFormPhone').action = '/login?action=phone';
      setTimeout(function() { document.getElementById('phonePwdInp').focus(); }, 300);
    }
  }

  function loginBackStep1() {
    document.getElementById('loginStep2').classList.remove('active');
    document.getElementById('loginStep1').classList.add('active');
    setTimeout(function() { document.getElementById('loginEmailInput').focus(); }, 300);
  }

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
