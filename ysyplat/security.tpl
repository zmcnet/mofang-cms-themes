{include file="includes/modal"}
<script src="/themes/clientarea/ysyplat/assets/js/public.js?v={$Ver}"></script>

<style>
/* 腾讯云风格 - 安全设置页面 */
:root {
	--tc-primary: #006eff;
	--tc-primary-light: #e8f3ff;
	--tc-success: #00a870;
	--tc-success-light: #e8fff3;
	--tc-warning: #ff9c00;
	--tc-warning-light: #fff8e8;
	--tc-danger: #e34d59;
	--tc-text-primary: #242424;
	--tc-text-secondary: #666;
	--tc-text-placeholder: #999;
	--tc-border: #e7e7e7;
	--tc-bg-page: #f5f6f7;
	--tc-bg-card: #fff;
	--tc-shadow: 0 1px 4px rgba(0,0,0,0.05);
}

.tc-security-page {
	background: var(--tc-bg-page);
	min-height: 100vh;
	padding: 24px;
	width: 100%;
	box-sizing: border-box;
}

/* 顶部用户信息卡片 */
.tc-user-header {
	background: linear-gradient(135deg, #006eff 0%, #0052cc 100%);
	border-radius: 8px;
	padding: 32px;
	margin-bottom: 24px;
	position: relative;
	overflow: hidden;
}

.tc-user-header::before {
	content: '';
	position: absolute;
	right: -50px;
	top: -50px;
	width: 200px;
	height: 200px;
	background: rgba(255,255,255,0.1);
	border-radius: 50%;
}

.tc-user-header::after {
	content: '';
	position: absolute;
	right: 80px;
	bottom: -80px;
	width: 160px;
	height: 160px;
	background: rgba(255,255,255,0.05);
	border-radius: 50%;
}

.tc-user-content {
	display: flex;
	align-items: center;
	position: relative;
	z-index: 1;
}

.tc-user-avatar {
	width: 72px;
	height: 72px;
	background: rgba(255,255,255,0.2);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 28px;
	font-weight: 600;
	color: #fff;
	margin-right: 24px;
	flex-shrink: 0;
	border: 3px solid rgba(255,255,255,0.3);
}

.tc-user-info {
	flex: 1;
	color: #fff;
}

.tc-user-name {
	font-size: 20px;
	font-weight: 600;
	margin-bottom: 8px;
	display: flex;
	align-items: center;
	gap: 12px;
}

.tc-badge {
	font-size: 12px;
	padding: 2px 8px;
	border-radius: 4px;
	font-weight: 400;
}

.tc-badge-success {
	background: var(--tc-success);
	color: #fff;
}

.tc-badge-default {
	background: rgba(255,255,255,0.2);
	color: #fff;
}

.tc-user-meta {
	display: flex;
	flex-wrap: wrap;
	gap: 24px;
	margin-top: 16px;
	font-size: 14px;
	opacity: 0.9;
}

.tc-user-meta-item {
	display: flex;
	align-items: center;
	gap: 6px;
}

.tc-user-meta-item i {
	font-size: 14px;
	opacity: 0.8;
}

/* 安全强度指示器 */
.tc-security-strength {
	background: rgba(255,255,255,0.15);
	border-radius: 6px;
	padding: 12px 16px;
	margin-top: 16px;
	max-width: 300px;
}

.tc-strength-label {
	font-size: 13px;
	margin-bottom: 8px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.tc-strength-text {
	font-weight: 600;
}

.tc-strength-bar {
	height: 6px;
	background: rgba(255,255,255,0.2);
	border-radius: 3px;
	overflow: hidden;
}

.tc-strength-progress {
	height: 100%;
	border-radius: 3px;
	transition: width 0.3s ease;
}

.tc-strength-low { background: #ff4d4f; }
.tc-strength-medium { background: #faad14; }
.tc-strength-high { background: #52c41a; }

/* 主内容区域 */
.tc-main-content {
	display: grid;
	grid-template-columns: 1fr 380px;
	gap: 24px;
	width: 100%;
	box-sizing: border-box;
}

/* 卡片通用样式 */
.tc-card {
	background: var(--tc-bg-card);
	border-radius: 8px;
	box-shadow: var(--tc-shadow);
	border: 1px solid var(--tc-border);
	width: 100%;
	box-sizing: border-box;
}

.tc-card-header {
	padding: 16px 20px;
	border-bottom: 1px solid var(--tc-border);
	font-size: 16px;
	font-weight: 600;
	color: var(--tc-text-primary);
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 8px;
}

.tc-card-header i {
	color: var(--tc-primary);
}

.tc-card-body {
	padding: 0;
}

/* 安全项目列表 */
.tc-security-list {
	list-style: none;
	margin: 0;
	padding: 16px;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 16px;
}

.tc-security-item {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 24px 16px;
	border: 1px solid var(--tc-border);
	border-radius: 8px;
	transition: all 0.2s;
	text-align: center;
	background: #fafbfc;
	box-sizing: border-box;
	width: 100%;
}

.tc-security-item:hover {
	background: #fff;
	box-shadow: 0 2px 8px rgba(0,0,0,0.08);
}

.tc-item-icon {
	width: 52px;
	height: 52px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 22px;
	margin-bottom: 12px;
	flex-shrink: 0;
}

.tc-icon-primary {
	background: var(--tc-primary-light);
	color: var(--tc-primary);
}

.tc-icon-success {
	background: var(--tc-success-light);
	color: var(--tc-success);
}

.tc-icon-warning {
	background: var(--tc-warning-light);
	color: var(--tc-warning);
}

.tc-item-content {
	flex: 1;
	min-width: 0;
	text-align: center;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin-bottom: 12px;
}

.tc-item-title {
	font-size: 15px;
	font-weight: 500;
	color: var(--tc-text-primary);
	margin-bottom: 6px;
	display: block;
	text-align: center;
}

.tc-item-status {
	font-size: 12px;
	padding: 2px 6px;
	border-radius: 4px;
	font-weight: 400;
	display: inline-block;
}

.tc-item-status-row {
	text-align: center;
	margin-bottom: 6px;
}

.tc-status-success {
	background: var(--tc-success-light);
	color: var(--tc-success);
}

.tc-status-warning {
	background: var(--tc-warning-light);
	color: var(--tc-warning);
}

.tc-item-desc {
	font-size: 13px;
	color: var(--tc-text-secondary);
	line-height: 1.5;
	text-align: center;
}

.tc-item-value {
	font-size: 13px;
	color: var(--tc-text-placeholder);
	margin-top: 2px;
	text-align: center;
}

.tc-item-action {
	flex-shrink: 0;
	text-align: center;
}

/* 按钮样式 */
.tc-btn {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	padding: 8px 16px;
	font-size: 14px;
	border-radius: 4px;
	border: none;
	cursor: pointer;
	transition: all 0.2s;
	text-decoration: none;
	white-space: nowrap;
	min-width: 88px;
}

.tc-btn-primary {
	background: var(--tc-primary);
	color: #fff;
}

.tc-btn-primary:hover {
	background: #0052cc;
	color: #fff;
}

.tc-btn-outline {
	background: #fff;
	color: var(--tc-primary);
	border: 1px solid var(--tc-primary);
}

.tc-btn-outline:hover {
	background: var(--tc-primary-light);
	color: var(--tc-primary);
}

.tc-btn-text {
	background: transparent;
	color: var(--tc-primary);
	padding: 8px 12px;
}

.tc-btn-text:hover {
	background: var(--tc-primary-light);
}

.tc-btn:disabled {
	opacity: 0.5;
	cursor: not-allowed;
}

/* 右侧边栏卡片 */
.tc-sidebar {
	display: flex;
	flex-direction: column;
	gap: 16px;
}

.tc-sidebar-card {
	background: var(--tc-bg-card);
	border-radius: 8px;
	box-shadow: var(--tc-shadow);
	border: 1px solid var(--tc-border);
	padding: 20px;
}

.tc-sidebar-title {
	font-size: 15px;
	font-weight: 600;
	color: var(--tc-text-primary);
	margin-bottom: 16px;
	display: flex;
	align-items: center;
	gap: 8px;
}

.tc-sidebar-title i {
	color: var(--tc-primary);
}

/* 第三方登录 */
.tc-oauth-list {
	display: flex;
	flex-direction: column;
	gap: 12px;
}

.tc-oauth-item {
	display: flex;
	align-items: center;
	padding: 12px;
	background: #fafbfc;
	border-radius: 6px;
	transition: background 0.2s;
}

.tc-oauth-item:hover {
	background: #f0f2f5;
}

.tc-oauth-icon {
	width: 36px;
	height: 36px;
	margin-right: 12px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.tc-oauth-icon img,
.tc-oauth-icon svg {
	max-width: 100%;
	max-height: 100%;
}

.tc-oauth-info {
	flex: 1;
}

.tc-oauth-name {
	font-size: 14px;
	font-weight: 500;
	color: var(--tc-text-primary);
}

.tc-oauth-status {
	font-size: 12px;
	color: var(--tc-text-placeholder);
}

/* 提醒设置卡片 */
.tc-reminder-item {
	display: flex;
	align-items: flex-start;
	justify-content: space-between;
}

.tc-reminder-info h4 {
	font-size: 14px;
	font-weight: 500;
	color: var(--tc-text-primary);
	margin: 0 0 4px 0;
}

.tc-reminder-info p {
	font-size: 13px;
	color: var(--tc-text-secondary);
	margin: 0;
}

/* 模态框样式覆盖 */
.tc-modal .modal-content {
	border-radius: 8px;
	border: none;
	box-shadow: 0 4px 20px rgba(0,0,0,0.15);
}

.tc-modal .modal-header {
	padding: 16px 20px;
	border-bottom: 1px solid var(--tc-border);
}

.tc-modal .modal-title {
	font-size: 16px;
	font-weight: 600;
	color: var(--tc-text-primary);
}

.tc-modal .modal-body {
	padding: 24px 20px;
}

.tc-modal .modal-footer {
	padding: 16px 20px;
	border-top: 1px solid var(--tc-border);
	gap: 12px;
}

.tc-modal .close {
	opacity: 0.5;
	transition: opacity 0.2s;
}

.tc-modal .close:hover {
	opacity: 1;
}

/* 表单样式 */
.tc-form-group {
	margin-bottom: 20px;
}

.tc-form-label {
	display: block;
	font-size: 14px;
	color: var(--tc-text-primary);
	margin-bottom: 8px;
	font-weight: 500;
}

.tc-form-control {
	width: 100%;
	padding: 10px 12px;
	font-size: 14px;
	border: 1px solid var(--tc-border);
	border-radius: 4px;
	transition: border-color 0.2s, box-shadow 0.2s;
}

.tc-form-control:focus {
	outline: none;
	border-color: var(--tc-primary);
	box-shadow: 0 0 0 2px rgba(0,110,255,0.1);
}

.tc-form-control::placeholder {
	color: var(--tc-text-placeholder);
}

.tc-input-group {
	display: flex;
	gap: 8px;
}

.tc-input-group .tc-form-control {
	flex: 1;
}

/* 响应式 */
@media (max-width: 1200px) {
	.tc-security-list {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media (max-width: 1024px) {
	.tc-main-content {
		grid-template-columns: 1fr;
	}
	
	.tc-security-list {
		grid-template-columns: repeat(3, 1fr);
	}
}

@media (max-width: 900px) {
	.tc-security-list {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media (max-width: 768px) {
	.tc-security-page {
		padding: 8px;
		background: var(--tc-bg-page);
		width: 100%;
	}
	
	.tc-user-header {
		padding: 16px;
		margin-bottom: 8px;
		border-radius: 6px;
		width: 100%;
		box-sizing: border-box;
	}
	
	.tc-user-content {
		flex-direction: column;
		text-align: center;
	}
	
	.tc-user-avatar {
		width: 60px;
		height: 60px;
		font-size: 24px;
		margin-right: 0;
		margin-bottom: 12px;
	}
	
	.tc-user-name {
		font-size: 18px;
		flex-wrap: wrap;
		justify-content: center;
	}
	
	.tc-user-meta {
		justify-content: center;
		gap: 12px;
		font-size: 13px;
	}
	
	.tc-user-meta-item {
		width: 100%;
		justify-content: center;
	}
	
	.tc-security-strength {
		max-width: 100%;
		margin: 16px auto 0;
	}
	
	.tc-main-content {
		gap: 8px;
		width: 100%;
	}
	
	.tc-card {
		border-radius: 6px;
		margin-bottom: 8px;
		width: 100%;
	}
	
	.tc-card-header {
		padding: 12px;
		font-size: 15px;
	}
	
	.tc-security-list {
		padding: 8px;
		grid-template-columns: repeat(2, 1fr);
		gap: 8px;
		width: 100%;
		box-sizing: border-box;
	}
	
	.tc-security-item {
		padding: 12px 8px;
	}
	
	.tc-item-icon {
		width: 40px;
		height: 40px;
		font-size: 16px;
		margin-bottom: 8px;
	}
	
	.tc-item-title {
		font-size: 13px;
	}
	
	.tc-item-desc {
		font-size: 11px;
	}
	
	.tc-item-value {
		font-size: 11px;
	}
	
	.tc-btn {
		padding: 6px 10px;
		font-size: 12px;
		min-width: 64px;
	}
	
	.tc-sidebar {
		gap: 8px;
		width: 100%;
	}
	
	.tc-sidebar-card {
		padding: 12px;
		border-radius: 6px;
		width: 100%;
		box-sizing: border-box;
	}
	
	.tc-sidebar-title {
		font-size: 14px;
		margin-bottom: 12px;
	}
	
	.tc-reminder-item {
		flex-direction: column;
		align-items: stretch;
		gap: 12px;
	}
	
	.tc-reminder-action {
		text-align: center;
	}
	
	.tc-reminder-action .tc-btn {
		width: 100%;
	}
	
	.tc-oauth-item {
		padding: 10px;
	}
	
	.tc-oauth-icon {
		width: 32px;
		height: 32px;
		margin-right: 10px;
	}
	
	.tc-oauth-name {
		font-size: 13px;
	}
	
	.tc-oauth-action .tc-btn {
		padding: 6px 10px;
		font-size: 12px;
		min-width: 60px;
	}
}

@media (max-width: 480px) {
	.tc-security-page {
		padding: 6px;
	}
	
	.tc-user-header {
		padding: 12px;
		margin-bottom: 6px;
		border-radius: 4px;
	}
	
	.tc-user-avatar {
		width: 50px;
		height: 50px;
		font-size: 20px;
	}
	
	.tc-user-name {
		font-size: 16px;
	}
	
	.tc-badge {
		font-size: 11px;
		padding: 1px 6px;
	}
	
	.tc-user-meta {
		font-size: 12px;
		gap: 8px;
	}
	
	.tc-security-strength {
		padding: 10px 12px;
	}
	
	.tc-strength-label {
		font-size: 12px;
	}
	
	.tc-main-content {
		gap: 6px;
	}
	
	.tc-card {
		margin-bottom: 6px;
		border-radius: 4px;
	}
	
	.tc-security-list {
		padding: 6px;
		grid-template-columns: 1fr 1fr;
		gap: 6px;
	}
	
	.tc-security-item {
		padding: 10px 6px;
		border-radius: 4px;
	}
	
	.tc-item-icon {
		width: 36px;
		height: 36px;
		font-size: 14px;
	}
	
	.tc-sidebar {
		gap: 6px;
	}
	
	.tc-sidebar-card {
		padding: 10px;
		border-radius: 4px;
	}
	
	.tc-item-status {
		font-size: 11px;
		padding: 1px 4px;
	}
}

.novalid {
	min-width: 80px;
	height: 26px;
	line-height: 20px;
	background-color: rgba(253, 254, 254, 0.32);
	box-shadow: 0px 6px 14px 2px rgba(6, 31, 179, 0.26);
	border-radius: 4px;
	color: #fff;
}
</style>

<div class="tc-security-page">
	<!-- 顶部用户信息卡片 -->
	<div class="tc-user-header">
		<div class="tc-user-content">
			<div class="tc-user-avatar">
				{if preg_match("/^[0-9]*[A-Za-z]+$/is", substr($Userinfo.user.username,0,1))}
				{$Userinfo.user.username|substr=0,1|upper}
				{elseif preg_match("/^[\x7f-\xff]*$/", substr($Userinfo.user.username,0,3))}
				{$Userinfo.user.username|substr=0,3}
				{else}
				{$Userinfo.user.username|substr=0,1|upper}
				{/if}
			</div>
			<div class="tc-user-info">
				<div class="tc-user-name">
					{$Userinfo.user.username}
					{if $Setting.certifi_open==1}
						{if $Userinfo.user.certifi.status == '1'}
						<span class="tc-badge tc-badge-success">{$Lang.real_name_authentication}</span>
						{else}
						<span class="tc-badge tc-badge-default">{$Lang.no_real_name_authentication}</span>
						{/if}
					{/if}
				</div>
				<div class="tc-user-meta">
					<div class="tc-user-meta-item">
						<i class="fas fa-envelope"></i>
						{if $Userinfo.user.email}{$Userinfo.user.email}{else}{$Lang.unbound}{/if}
					</div>
					<div class="tc-user-meta-item">
						<i class="fas fa-mobile-alt"></i>
						{if $Userinfo.user.phonenumber}{$Userinfo.user.phonenumber}{else}{$Lang.unbound}{/if}
					</div>
					<div class="tc-user-meta-item">
						<i class="fas fa-calendar-alt"></i>
						{$Userinfo.user.create_time|date="Y-m-d H:i:s"}
					</div>
				</div>
				<div class="tc-security-strength">
					<div class="tc-strength-label">
						<span>{$Lang.account_security_strength}</span>
						<span class="tc-strength-text">{$percentage[0]}</span>
					</div>
					<div class="tc-strength-bar">
						<div class="tc-strength-progress tc-strength-{if $percentage[1]<40}low{elseif $percentage[1]<70}medium{else}high{/if}" style="width: {$percentage[1]}%"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 主内容区域 -->
	<div class="tc-main-content">
		<!-- 左侧安全设置 -->
		<div class="tc-card">
			<div class="tc-card-header">
				<i class="fas fa-shield-alt"></i>
				安全设置
			</div>
			<div class="tc-card-body">
				<ul class="tc-security-list">
					<!-- 登录密码 -->
					<li class="tc-security-item">
						<div class="tc-item-icon tc-icon-primary">
							<i class="fas fa-fingerprint"></i>
						</div>
						<div class="tc-item-content">
							<div class="tc-item-title">{$Lang.login_password}</div>
							{if $Userinfo.user.is_password}
							<div class="tc-item-status-row"><span class="tc-item-status tc-status-success"><i class="fas fa-check"></i> {$Lang.set}</span></div>
							{/if}
							<div class="tc-item-desc">{$Lang.regularly_details}</div>
						</div>
						<div class="tc-item-action">
							{if $Userinfo.user.is_password}
							<a class="tc-btn tc-btn-outline" data-toggle="modal" data-target="#modifyPasswordModal" onclick="showPassword()">{$Lang.modify}</a>
							{else}
							<a class="tc-btn tc-btn-primary" data-toggle="modal" data-target="#modifyPasswordModal" onclick="showPassword()">{$Lang.set_password}</a>
							{/if}
						</div>
					</li>

					<!-- 手机绑定 -->
					{if $Userinfo.shd_allow_sms_send}
					<li class="tc-security-item">
						<div class="tc-item-icon tc-icon-success">
							<i class="fas fa-mobile-alt"></i>
						</div>
						<div class="tc-item-content">
							<div class="tc-item-title">{$Lang.mobile_phone_binding}</div>
							{if $Userinfo.user.phonenumber}
							<div class="tc-item-status-row"><span class="tc-item-status tc-status-success"><i class="fas fa-check"></i> {$Lang.set}</span></div>
							{/if}
							<div class="tc-item-desc">{$Lang.regularly_details}</div>
							{if $Userinfo.user.phonenumber}
							<div class="tc-item-value">{$Userinfo.user.phonenumber|substr=0,3}****{$Userinfo.user.phonenumber|substr=7,11}</div>
							{/if}
						</div>
						<div class="tc-item-action">
							{if $Userinfo.user.phonenumber&&$BindPhoneChange==0}
							<a class="tc-btn tc-btn-outline" data-toggle="modal" data-target="#bindPhoneChangeModal1" id="bindPhoneChangeBtn1">{$Lang.modify}</a>
							{elseif $Userinfo.user.phonenumber&&$BindPhoneChange==1}
							<a class="tc-btn tc-btn-outline" data-toggle="modal" data-target="#bindPhoneChangeModal2" id="bindPhoneChangeBtn2">{$Lang.modify}</a>
							{else}
							<a class="tc-btn tc-btn-primary" data-toggle="modal" data-target="#bindPhoneModal">{$Lang.bind_now}</a>
							{/if}
						</div>
					</li>
					{/if}

					<!-- 邮箱绑定 -->
					{if $Userinfo.shd_allow_email_send}
					<li class="tc-security-item">
						<div class="tc-item-icon tc-icon-primary">
							<i class="fas fa-envelope"></i>
						</div>
						<div class="tc-item-content">
							<div class="tc-item-title">{$Lang.mailbox_binding}</div>
							{if $Userinfo.user.email}
							<div class="tc-item-status-row"><span class="tc-item-status tc-status-success"><i class="fas fa-check"></i> {$Lang.set}</span></div>
							{/if}
							<div class="tc-item-desc">{$Lang.reset_password_notice}</div>
							{if $Userinfo.user.email}
							<div class="tc-item-value">{$Userinfo.user.email}</div>
							{/if}
						</div>
						<div class="tc-item-action">
							{if $Userinfo.user.email&&$BindEmailChange==0}
							<a class="tc-btn tc-btn-outline" data-toggle="modal" data-target="#changeEmailHandleModal1">{$Lang.modify}</a>
							{elseif $Userinfo.user.email&&$BindEmailChange==1}
							<a class="tc-btn tc-btn-outline" data-toggle="modal" data-target="#changeEmailHandleModal2">{$Lang.modify}</a>
							{else}
							<a class="tc-btn tc-btn-primary" data-toggle="modal" data-target="#bindEmailHandleModal">{$Lang.mailbox_binding}</a>
							{/if}
						</div>
					</li>
					{/if}

					<!-- 实名认证 -->
					{if $Setting.certifi_open==1}
					<li class="tc-security-item">
						<div class="tc-item-icon tc-icon-warning">
							<i class="fas fa-id-card"></i>
						</div>
						<div class="tc-item-content">
							<div class="tc-item-title">{$Lang.real_name_authentications}</div>
							{if $Userinfo.user.certifi.status==1}
							<div class="tc-item-status-row"><span class="tc-item-status tc-status-success"><i class="fas fa-check"></i> {$Lang.set}</span></div>
							{/if}
							<div class="tc-item-desc">{$Lang.personal_security}</div>
						</div>
						<div class="tc-item-action">
							{if $Userinfo.user.certifi.status == 1}
								{if $Userinfo.user.certifi.type == 'certifi_person'}
								<a href="verified?action=enterprises&step=info" class="tc-btn tc-btn-outline">去企业认证</a>
								{else}
								<a href="verified" class="tc-btn tc-btn-outline">{$Lang.certified}</a>
								{/if}
							{else}
							<a href="verified" class="tc-btn tc-btn-primary">{$Lang.not_certified}</a>
							{/if}
						</div>
					</li>
					{/if}

					<!-- 二次验证 -->
					{if $Userinfo.allow_second_verify}
					<li class="tc-security-item">
						<div class="tc-item-icon tc-icon-success">
							<i class="fas fa-shield-alt"></i>
						</div>
						<div class="tc-item-content">
							<div class="tc-item-title">{$Lang.secondary_verification}</div>
							{if $Userinfo.user.second_verify}
							<div class="tc-item-status-row"><span class="tc-item-status tc-status-success"><i class="fas fa-check"></i> {$Lang.set}</span></div>
							{/if}
							<div class="tc-item-desc">{$Lang.secondary_verification_details}</div>
						</div>
						<div class="tc-item-action">
							{if $Userinfo.user.second_verify}
							<a class="tc-btn tc-btn-outline" onclick="closeSecondHandleClick()">{$Lang.close}</a>
							{else}
							<a class="tc-btn tc-btn-primary" data-toggle="modal" data-target="#toggleSecondVerifyModalOpen">{$Lang.opens_two}</a>
							{/if}
						</div>
					</li>
					{/if}

					<!-- API -->
					{if $Userinfo.allow_resource_api}
					<!-- <li class="tc-security-item">
						<div class="tc-item-icon tc-icon-primary">
							<i class="fas fa-key"></i>
						</div>
						<div class="tc-item-content">
							<div class="tc-item-title">API</div>
							<div class="tc-item-desc">{$Lang.administration_details}</div>
						</div>
						<div class="tc-item-action">
							<a class="tc-btn tc-btn-primary" onclick="showApiPwdHandleClick()">{$Lang.view_secret_key}</a>
						</div>
					</li> -->
					{/if}

					<!-- 互联授权 -->
					{if $Bot==1}
					<li class="tc-security-item">
						<div class="tc-item-icon tc-icon-primary">
							<i class="fas fa-link"></i>
						</div>
						<div class="tc-item-content">
							<div class="tc-item-title">{$Lang.interflow_license}</div>
							<div class="tc-item-desc">{$Lang.interflow_license_details}</div>
						</div>
						<div class="tc-item-action">
							<a class="tc-btn tc-btn-primary" onclick="showInterflowlicenseHandleClick()">{$Lang.license}</a>
						</div>
					</li>
					{/if}
				</ul>
			</div>
		</div>

		<!-- 右侧边栏 -->
		<div class="tc-sidebar">
			<!-- 短信提醒 -->
			{if $Userinfo.shd_allow_sms_send}
			<div class="tc-sidebar-card">
				<div class="tc-sidebar-title">
					<i class="fas fa-comment-dots"></i>
					{$Lang.sms_reminder}
				</div>
				<div class="tc-reminder-item">
					<div class="tc-reminder-info">
						<p>{$Lang.sms_settings}</p>
					</div>
					<div class="tc-reminder-action">
						{if !$Userinfo.user.phonenumber}
						<button disabled class="tc-btn tc-btn-outline">{$Lang.need_bind_mobile_phone}</button>
						{elseif $Userinfo.user.is_login_sms_reminder==1}
						<a class="tc-btn tc-btn-outline" data-toggle="modal" data-target="#loginSmsReminderModal">{$Lang.cancel}</a>
						{else}
						<a class="tc-btn tc-btn-primary" data-toggle="modal" data-target="#loginSmsReminderModalOpen">{$Lang.opens_two}</a>
						{/if}
					</div>
				</div>
			</div>
			{/if}

			<!-- 邮箱提醒 -->
			{if $Userinfo.shd_allow_email_send}
			<div class="tc-sidebar-card">
				<div class="tc-sidebar-title">
					<i class="fas fa-bell"></i>
					{$Lang.email_reminder}
				</div>
				<div class="tc-reminder-item">
					<div class="tc-reminder-info">
						<p>{$Lang.mailbox_settings}</p>
					</div>
					<div class="tc-reminder-action">
						{if !$Userinfo.user.email}
						<button disabled class="tc-btn tc-btn-outline">{$Lang.need_bind_mailbox}</button>
						{elseif $Userinfo.user.email_remind==1}
						<a class="tc-btn tc-btn-outline" data-toggle="modal" data-target="#loginEmailReminderModal">{$Lang.cancel}</a>
						{else}
						<a class="tc-btn tc-btn-primary" data-toggle="modal" data-target="#loginEmailReminderModalOpen">{$Lang.set_up_now}</a>
						{/if}
					</div>
				</div>
			</div>
			{/if}

			<!-- 第三方登录 -->
			{if $Security.oauthBind}
			<div class="tc-sidebar-card">
				<div class="tc-sidebar-title">
					<i class="fas fa-plug"></i>
					{$Lang.third_party_login}
				</div>
				<div class="tc-oauth-list">
					{foreach $Security.oauthBind as $oauth}
					<div class="tc-oauth-item">
						<div class="tc-oauth-icon">
							{$oauth.img}
						</div>
						<div class="tc-oauth-info">
							<div class="tc-oauth-name">{$oauth.name}</div>
							<div class="tc-oauth-status">
								{if $oauth.oauth=="bind"}
								{$Lang.nickname}：{$oauth.username}
								{elseif $oauth.oauth == 'unbind'}
								{$Lang.unbound}
								{/if}
							</div>
						</div>
						<div class="tc-oauth-action">
							{if $oauth.oauth == 'unbind'}
							<a href="{$oauth.url}" class="tc-btn tc-btn-primary">{$Lang.binding}</a>
							{elseif $oauth.oauth == 'bind'}
							<a href="javascript: getModal('oauthBind/untie/{$oauth.dirName}', '{$Lang.prompt}', '{$Lang.make_sure_unbind}{$oauth.name}?', {status: 1});" class="tc-btn tc-btn-outline">{$Lang.solution}</a>
							{/if}
						</div>
					</div>
					{/foreach}
				</div>
			</div>
			{/if}
		</div>
	</div>
</div>


<!-- start: 修改密码模态框 -->
<div class="modal fade tc-modal" id="modifyPasswordModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">{if $Userinfo.user.is_password}{$Lang.change_password}{else}{$Lang.set_password}{/if}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="modifyPwdForm" class="needs-validation" novalidate>
					{if $Userinfo.user.is_password}
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right">{$Lang.original_password}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="password" name="old_password" class="form-control old_password" id="oldPwd" onblur="oldPwdBlur()" placeholder="{$Lang.security_please_enter_password}" required />
								<div class="input-group-append">
									<button type="button" class="btn btn-secondary old_password_btn">
										<i class="fas fa-eye"></i>
									</button>
								</div>
							</div>
							<input type="hidden" name="flag" vaule="1" />
						</div>
					</div>
					{else/}
					<input type="hidden" name="flag" vaule="2" />
					{/if}
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right">{if $Userinfo.user.is_password}{$Lang.new_password}{else}{$Lang.password}{/if}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="password" name="password" class="form-control password" id="pwd" onblur="pwdBlur()" placeholder="{if $Userinfo.user.is_password}{$Lang.security_please_new_password}{else}{$Lang.security_please_password}{/if}" required />
								<div class="input-group-append">
									<button type="button" class="btn btn-secondary password_btn">
										<i class="fas fa-eye"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right">{if $Userinfo.user.is_password}{$Lang.repeat_new_password}{else}{$Lang.repeat_then_password}{/if}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="password" name="re_password" class="form-control re_password" id="rePwd" onblur="rePwdBlur()" placeholder="{if $Userinfo.user.is_password}{$Lang.repeat_new_password}{else}{$Lang.repeat_password}{/if}" required />
								<div class="input-group-append">
									<button type="button" class="btn btn-secondary re_password_btn">
										<i class="fas fa-eye"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					{if $Verify.allow_resetpwd_captcha==1&&$Userinfo.user.is_password}
					{include file="includes/verify" type="allow_resetpwd_captcha"}
					{elseif $Verify.allow_setpwd_captcha==1&&!$Userinfo.user.is_password}
					{include file="includes/verify" type="allow_setpwd_captcha"}
					{/if}
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
				<button type="button" class="btn btn-primary" id="modifyPwdSubmit" onclick="modifyPwdCheckForm()">{$Lang.determine}</button>
			</div>
		</div>
	</div>
</div>

<script>
	var _url = '';
	var phoneType = '{$BindPhoneChange}'
	var is_password = '{$Userinfo.user.is_password}';
	var emailType = '{$BindEmailChange}'
	var WebUrl = '/';
	
	function oldPwdBlur() {
		var oldPwd = document.getElementById('oldPwd')
		if (oldPwd && oldPwd.value == '') {
			oldPwd.classList.remove("is-valid");
			oldPwd.classList.add("is-invalid");
			return
		} else if (oldPwd) {
			oldPwd.classList.remove("is-invalid");
			oldPwd.classList.add("is-valid");
		}
	}

	function validateCode() {
		var valCode = document.getElementById('loginSmsReminderCode')
		if (valCode.value == '') {
			valCode.classList.remove("is-valid");
			valCode.classList.add("is-invalid");
			return
		} else if (valCode) {
			valCode.classList.remove("is-invalid");
			valCode.classList.add("is-valid");
		}
	}

	function emailReminderCode() {
		var emailReminderCode = document.getElementById('loginEmailReminderCode')
		if (emailReminderCode.value == '') {
			emailReminderCode.classList.remove("is-valid");
			emailReminderCode.classList.add("is-invalid");
			return
		} else if (emailReminderCode) {
			emailReminderCode.classList.remove("is-invalid");
			emailReminderCode.classList.add("is-valid");
		}
	}

	function pwdBlur() {
		var pwd = document.getElementById('pwd')
		if (pwd.value == '') {
			pwd.classList.remove("is-valid");
			pwd.classList.add("is-invalid");
			return
		} else {
			pwd.classList.remove("is-invalid");
			pwd.classList.add("is-valid");
		}
	}

	function rePwdBlur() {
		var rePwd = document.getElementById('rePwd')
		if (rePwd.value == '') {
			rePwd.classList.remove("is-valid");
			rePwd.classList.add("is-invalid");
			return
		} else {
			rePwd.classList.remove("is-invalid");
			rePwd.classList.add("is-valid");
		}
	}

	function bindPhoneChangeCode1Blur() {
		var code1 = document.getElementById('bindPhoneChangeCode1')
		if (code1.value == '') {
			code1.classList.remove("is-valid");
			code1.classList.add("is-invalid");
			return
		} else {
			code1.classList.remove("is-invalid");
			code1.classList.add("is-valid");
		}
	}

	function changeEmailHandleCodeBlur() {
		var code1 = document.getElementById('changeEmailHandleCode1')
		if (code1.value == '') {
			code1.classList.remove("is-valid");
			code1.classList.add("is-invalid");
			return
		} else {
			code1.classList.remove("is-invalid");
			code1.classList.add("is-valid");
		}
	}
</script>
<!-- end: 修改密码模态框 -->

<!-- start: 手机绑定模态框 -->
<div class="modal fade tc-modal" id="bindPhoneModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">{$Lang.mobile_phone_binding}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="{$Token}" />
					<input type="hidden" name="phone_code" value="+86" />
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right">{$Lang.phone_number}</label>
						<div class="col-sm-8">
							<input type="text" name="phone" class="form-control" id="phoneNum" placeholder="{$Lang.input_mobile}" />
						</div>
					</div>
					{if $Verify.allow_phone_bind_captcha==1}
					{include file="includes/verify" type="allow_phone_bind_captcha" id="captchaPhone1"}
					{/if}
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right">{$Lang.verification_code}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" class="form-control" id="code" placeholder="{$Lang.please_enter_code}" />
								<div class="input-group-append">
									<button onclick="getCheckCode('bind_phone','phone','bind-phone-button','post', undefined, 'bindPhoneModal','captcha_allow_phone_bind_captchacaptchaPhone1')" class="btn btn-primary bind-phone-button" type="button">{$Lang.get_code}</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
				<button type="button" class="btn btn-primary" id="bindPhoneSubmit" onclick="bindPhoneCheckForm()">{$Lang.determine}</button>
			</div>
		</div>
	</div>
</div>

<!-- start: 修改手机绑定 -->
<div class="modal fade tc-modal" id="bindPhoneChangeModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">{$Lang.verify_original_phone}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="{$Token}" />
					<input type="hidden" name="type" value="{if $BindPhoneChange==0}1{else}2{/if}" />
					<input type="hidden" name="phone_code" value="+86" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right">{$Lang.phone_number}</label>
						<div class="col-sm-8">
							{if $Userinfo.user.phonenumber}
							<input type="text" name="tel" readonly id="oldTel" value="{$Userinfo.user.phonenumber|substr=0,3}****{$Userinfo.user.phonenumber|substr=7,11}" class="form-control" placeholder="{$Lang.input_mobile}" />
							{/if}
						</div>
					</div>
					{if $Verify.allow_phone_bind_captcha==1}
					{include file="includes/verify" type="allow_phone_bind_captcha" id="captchaPhone2"}
					{/if}
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right">{$Lang.verification_code}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" id="bindPhoneChangeCode1" class="form-control" onblur="bindPhoneChangeCode1Blur()" placeholder="{$Lang.please_enter_code}" />
								<div class="input-group-append">
									<button onclick="getCheckCode('bind_phone_code','tel','bind-phone-button1','get',1, 'bindPhoneChangeModal1','captcha_allow_phone_bind_captchacaptchaPhone2')" class="btn btn-primary bind-phone-button1" type="button">{$Lang.get_code}</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
				<button type="button" class="btn btn-primary" id="bindPhoneChangeSubmit1" onclick="phoneChangeBtn()">{$Lang.determine}</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade tc-modal" id="bindPhoneChangeModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">{$Lang.bind_mobile_phone}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="{$Token}" />
					<input type="hidden" name="type" value="{if $BindPhoneChange==0}1{else}2{/if}" />
					<input type="hidden" name="phone_code" value="+86" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right">{$Lang.phone_number}</label>
						<div class="col-sm-8">
							<input type="text" name="tel" id="newTel" class="form-control" placeholder="{$Lang.input_mobile}" />
						</div>
					</div>
					{if $Verify.allow_phone_bind_captcha==1}
					{include file="includes/verify" type="allow_phone_bind_captcha" id="captchaPhone3"}
					{/if}
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right">{$Lang.verification_code}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" id="bindPhoneChangeCode2" class="form-control" placeholder="{$Lang.please_enter_code}" />
								<div class="input-group-append">
									<button id="bindPhoneChangeCodeBtn2" onclick="getCheckCode('bind_phone_code','tel','bind-phone-button2','get',2, 'bindPhoneChangeModal2','captcha_allow_phone_bind_captchacaptchaPhone3')" class="btn btn-primary bind-phone-button2" type="button">{$Lang.get_code}</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
				<button type="button" class="btn btn-primary" id="bindPhoneChangeSubmit2" onclick="phoneChangeBtn2()">{$Lang.determine}</button>
			</div>
		</div>
	</div>
</div>

<!-- start 短信提醒 关闭 -->
<div class="modal fade tc-modal" id="loginSmsReminderModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">{$Lang.turn_off_sms_alert}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="{$Token}" />
					<input type="hidden" name="phone_code" value="+86" />
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right">{$Lang.phone_number}</label>
						<div class="col-sm-8">
							<input type="text" name="name" readonly value="{$Userinfo.user.phonenumber|substr=0,3}****{$Userinfo.user.phonenumber|substr=7,11}" class="form-control" placeholder="{$Lang.input_mobile}" />
						</div>
					</div>
					{if $Verify.allow_cancel_sms_captcha==1}
					{include file="includes/verify" type="allow_cancel_sms_captcha" id="captchaSms1"}
					{/if}
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right">{$Lang.verification_code}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" class="form-control" id="loginSmsReminderCode" placeholder="{$Lang.please_enter_code}" onblur="validateCode()" />
								<div class="input-group-append">
									<button onclick="getCheckCode('remind_send','phone','bind-phone-button','get', undefined, 'loginSmsReminderModal',id='captcha_allow_cancel_sms_captchacaptchaSms1')" class="btn btn-primary bind-phone-button" type="button">{$Lang.get_code}</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
				<button type="button" class="btn btn-primary" id="loginSmsReminderSubmit" onclick="loginSmsReminderCheckForm()">{$Lang.determine}</button>
			</div>
		</div>
	</div>
</div>

<!-- start: 短信提醒 开启 -->
<div class="modal fade tc-modal" id="loginSmsReminderModalOpen" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$Lang.prompt}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="d-flex align-items-center">
					<i class="fas fa-exclamation-circle fs-20 text-warning mr-2"></i>
					{$Lang.on_reminder}
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
				<button type="button" class="btn btn-primary" id="loginSmsReminderSubmitOpen" onclick="smsSubmitOpenBtn()">{$Lang.determine}</button>
			</div>
		</div>
	</div>
</div>

<!-- start: 邮箱绑定 -->
<div class="modal fade tc-modal" id="bindEmailHandleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$Lang.mailbox_binding}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="{$Token}" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right">{$Lang.mailbox}</label>
						<div class="col-sm-8">
							<input type="text" name="email" class="form-control" placeholder="{$Lang.please_input_email}" id="bindEmailHandleEmail" />
						</div>
					</div>
					{if $Verify.allow_email_bind_captcha==1}
					{include file="includes/verify" type="allow_email_bind_captcha" id="captchaEmail1"}
					{/if}
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right">{$Lang.verification_code}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" class="form-control" placeholder="{$Lang.please_enter_code}" id="bindEmailHandleCode" />
								<div class="input-group-append">
									<button class="btn btn-primary bind-email-button" onclick="getCheckCode('bind_email','email','bind-email-button','post', undefined, 'bindEmailHandleModal','captcha_allow_email_bind_captchacaptchaEmail1')" type="button" id="button-addon2">{$Lang.get_code}</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
				<button type="button" class="btn btn-primary" id="bindEmailHandleSubmit" onclick="bindEmailHandleCheckForm()">{$Lang.determine}</button>
			</div>
		</div>
	</div>
</div>

<!-- start: 邮箱修改 -->
<div class="modal fade tc-modal" id="changeEmailHandleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$Lang.verify_original_email}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="{$Token}" />
					<input type="hidden" name="type" value="{if $BindEmailChange==0}1{else}2{/if}" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right">{$Lang.mailbox}</label>
						<div class="col-sm-8">
							<input type="text" name="email" id="changeEmailHandleEmail1" readonly value="{$Userinfo.user.email}" class="form-control" placeholder="{$Lang.please_input_email}" />
						</div>
					</div>
					{if $Verify.allow_email_bind_captcha==1}
					{include file="includes/verify" type="allow_email_bind_captcha" id="captchaEmail2"}
					{/if}
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right">{$Lang.verification_code}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" id="changeEmailHandleCode1" onblur="changeEmailHandleCodeBlur()" class="form-control" placeholder="{$Lang.please_enter_code}" />
								<div class="input-group-append">
									<button class="btn btn-primary bind-email-button1" onclick="getCheckCode('change_email','email','bind-email-button1','post',1, 'changeEmailHandleModal1','captcha_allow_email_bind_captchacaptchaEmail2')" type="button" id="button-addon2">{$Lang.get_code}</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
				<button type="button" class="btn btn-primary" id="changeEmailHandleSubmit1" onclick="changeEmailBtn()">{$Lang.determine}</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade tc-modal" id="changeEmailHandleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$Lang.bind_new_mailbox}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="{$Token}" />
					<input type="hidden" name="type" value="{if $BindEmailChange==0}1{else}2{/if}" id="captcha3" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right">{$Lang.mailbox}</label>
						<div class="col-sm-8">
							<input type="text" name="email" id="changeEmailHandleEmail2" class="form-control" placeholder="{$Lang.please_input_email}" />
						</div>
					</div>
					{if $Verify.allow_email_bind_captcha==1}
					{include file="includes/verify" type="allow_email_bind_captcha" id="captchaEmail3"}
					{/if}
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right">{$Lang.verification_code}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" id="changeEmailHandleCode2" class="form-control" placeholder="{$Lang.please_enter_code}" />
								<div class="input-group-append">
									<button class="btn btn-primary bind-email-button2" onclick="getCheckCode('change_email','email','bind-email-button2','post',2, 'changeEmailHandleModal2','captcha_allow_email_bind_captchacaptchaEmail3')" type="button" id="button-addon2">{$Lang.get_code}</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
				<button type="button" class="btn btn-primary" id="changeEmailHandleSubmit2" onclick="changeEmailBtn2()">{$Lang.determine}</button>
			</div>
		</div>
	</div>
</div>

<!-- start: 邮箱提醒 关闭 -->
<div class="modal fade tc-modal" id="loginEmailReminderModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$Lang.off_reminder}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="{$Token}" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right">{$Lang.mailbox}</label>
						<div class="col-sm-8">
							<input type="text" name="email" readonly value="{$Userinfo.user.email}" class="form-control" placeholder="{$Lang.please_input_email}" />
						</div>
					</div>
					{if $Verify.allow_cancel_email_captcha==1}
					{include file="includes/verify" type="allow_cancel_email_captcha"}
					{/if}
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right">{$Lang.verification_code}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" id="loginEmailReminderCode" class="form-control" placeholder="{$Lang.please_enter_code}" onblur="emailReminderCode()" />
								<div class="input-group-append">
									<button class="btn btn-primary bind-email-button" onclick="getCheckCode('remind_email_send','email','bind-email-button','get', undefined, 'loginEmailReminderModal','captcha_allow_cancel_email_captcha')" type="button" id="button-addon2">{$Lang.get_code}</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
				<button type="button" class="btn btn-primary" id="loginEmailReminderSubmit" onclick="loginEmailReminderCheckForm()">{$Lang.determine}</button>
			</div>
		</div>
	</div>
</div>

<!-- start: 邮箱提醒 开启 -->
<div class="modal fade tc-modal" id="loginEmailReminderModalOpen" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$Lang.prompt}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="d-flex align-items-center">
					<i class="fas fa-exclamation-circle fs-20 text-warning mr-2"></i>
					{$Lang.open_mailbox_reminder}
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
				<button type="button" class="btn btn-primary" id="loginEmailReminderSubmitOpen" onclick="loginEmailReminderSubmitOpen()">{$Lang.determine}</button>
			</div>
		</div>
	</div>
</div>

<!-- start: 二次验证 开启 -->
<div class="modal fade tc-modal" id="toggleSecondVerifyModalOpen" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$Lang.prompt}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="d-flex align-items-center">
					<i class="fas fa-exclamation-circle fs-20 text-warning mr-2"></i>
					{$Lang.determine_verification}
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
				<button type="button" class="btn btn-primary" id="toggleSecondVerifySubmitOpen" onclick="toggleSecondVerifySubmitOpen()">{$Lang.determine}</button>
			</div>
		</div>
	</div>
</div>

<!-- start: api -->
<div class="modal fade tc-modal" id="getapiModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$Lang.modify_key}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label text-right">{$Lang.api_key}</label>
						<div class="col-sm-9">
							<div class="input-group">
								<input id="copy-apiss" type="password" name="api" value="{$Userinfo.user.api_password}" data-clipboard-text="{$Userinfo.user.api_password}" class="form-control api_passwordss" placeholder="{$Lang.please_enter_code}" />
								<div class="input-group-append">
									<button type="button" class="btn btn-secondary btn-password">
										<i class="fas fa-eye"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group row mb-0">
						<label class="col-sm-2"></label>
						<div class="col-sm-8">
							<button type="button" class="btn btn-default btn-sm btn-copies w-xs mr-1" data-clipboard-target="#copy-apiss" id="btn-copies" onclick="cpBtn()">
								{$Lang.copy}
							</button>
							<button type="button" onClick="getApiPwd()" class="btn btn-default btn-sm btn-random w-xs">
								{$Lang.reset}
							</button>
						</div>
					</div>
				</form>
				<script src="/themes/clientarea/ysyplat/assets/libs/clipboard/clipboard.min.js"></script>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
				<button type="button" class="btn btn-primary" id="getapiModalSubmit" onclick="getapiModalCheckForm()">{$Lang.determine}</button>
			</div>
		</div>
	</div>
</div>

<!-- start: interflow -->
<div class="modal fade tc-modal" id="interflowModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$Lang.seting_license}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="accountbind-form">
					<div class="form-group row">
						<label class="col-sm-2 col-form-label text-right" name="i_type"></label>
						<div class="col-sm-9">
							<div class="input-group">
								<input id="copy-apiss" name="qq" class="form-control"/>
							</div>
						</div>
					</div>
				</form>
				<script src="/themes/clientarea/ysyplat/assets/libs/clipboard/clipboard.min.js"></script>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
				<button type="button" class="btn btn-primary" id="getapiModalSubmit" onclick="getapiModalCheckForm()">{$Lang.determine}</button>
			</div>
		</div>
	</div>
</div>

<script src="/themes/clientarea/ysyplat/assets/js/security.js?v={$Ver}"></script>
