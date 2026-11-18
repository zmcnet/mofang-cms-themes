{if $TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken' && $TplName != 'product' && $TplName != 'viewcart' && $TplName != 'configureproduct' && $TplName != 'complete' && $TplName != 'ordersummary' && $TplName != 'sidebar-categories' && $TplName != 'configureproduct-v10-cloud' && $TplName != 'configureproduct-v10-common' && $TplName != 'configureproduct-v10-dcim' }
</div>
</div>
</div>

<footer class="footer">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6">
				&copy; {$Setting.company_name}.
				{if !$Setting.company_icp && !$Setting.company_beian}
					<a href="https://beian.miit.gov.cn" target="_blank" rel="noopener" style="color:#86909c;text-decoration:none;margin-left:4px;">浙ICP备2023036308号-8</a>
				{/if}
			</div>
			<div class="col-sm-6">
				<div class="text-sm-right d-none d-sm-block footer-links">
					{if $Setting.company_icp}
						<a href="https://beian.miit.gov.cn" target="_blank" rel="noopener">{$Setting.company_icp}</a>
					{elseif !$Setting.company_beian}
						<a href="https://beian.miit.gov.cn" target="_blank" rel="noopener">浙ICP备2023036308号-8</a>
					{/if}
					{if $Setting.company_beian}
						<span class="mx-2">|</span>
						<span>{$Setting.company_beian}</span>
					{/if}
				</div>
			</div>
		</div>
	</div>
</footer>
{/if}
<script src="/themes/clientarea/ysyplat/assets/js/app.js?v={$Ver}"></script>
{if $TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken'}
{php}$hooks=hook('client_area_footer_output');{/php}
{if $hooks}
	{foreach $hooks as $item}
		{$item}
	{/foreach}
{/if}
{/if}
</body>

</html>
