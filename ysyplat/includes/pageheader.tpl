
<div class="container-fluid">
    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-flex align-items-center justify-content-between">
                {if $TplName == 'viewbilling'}
                <h4 class="mb-0 font-size-18" style="border-left:3px solid #6366f1;padding-left:10px;">{$Title} - {$Get.id}</h4>
                {else}
                <div style="display:flex;align-items:center;">
                    
                    <a href="javascript:history.go(-1)" class="backBtn" style="display: none;width:32px;height:32px;border-radius:50%;background:#f5f3ff;display:inline-flex;align-items:center;justify-content:center;margin-right:6px;"><i class="bx bx-chevron-left" style="font-size:22px;color:#6366f1;"></i></a>
                    <h4 class="mb-0 font-size-18" style="border-left:3px solid #6366f1;padding-left:10px;">{$Title}</h4>
                </div>
                {/if}
                <div class="page-title-right">
	                {if !$ShowBreadcrumb}
                    {include file="includes/breadcrumb"}
                    {/if}
                </div>

            </div>
        </div>
    </div>
    <!-- end page title -->    
</div>
<script>
    $(function(){
        $('.backBtn').hide()
    })
</script>