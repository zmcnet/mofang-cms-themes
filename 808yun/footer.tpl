{if $TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken' }
</div>
</div>
</div>

<footer class="footer">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6">
				&copy; {$Setting.company_name}.
			</div>
			<div class="col-sm-6">
				<div class="text-sm-right d-none d-sm-block footer-links">
					{if $Setting.company_icp}
						<a href="https://beian.miit.gov.cn" target="_blank" rel="noopener">{$Setting.company_icp}</a>
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
<script src="/themes/clientarea/808yun/assets/js/app.js?v={$Ver}"></script>
{php}$hooks=hook('client_area_footer_output');{/php}
{if $hooks}
	{foreach $hooks as $item}
		{$item}
	{/foreach}
{/if}
</body>

</html>