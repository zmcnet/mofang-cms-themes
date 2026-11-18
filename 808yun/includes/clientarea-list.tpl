<!-- start：资源列表 -->
<div class="tc-resource-table-wrapper">
  <div class="table-responsive">
    <table class="table tc-resource-table mb-0">
      <colgroup>
        <col width="30%">
        <col width="15%">
        <col width="20%">
        <col width="20%">
        <col width="15%">
      </colgroup>
      <thead>
        <tr>
          <th>{$Lang.host_name|default='产品名称'}</th>
          <th class="text-center">{$Lang.machine_status|default='状态'}</th>
          <th class="text-center">{$Lang.due_date|default='到期时间'}</th>
          <th class="text-center">{$Lang.cost|default='费用'}</th>
          <th class="text-center">IP</th>
        </tr>
      </thead>
      <tbody>
        {if $ClientArea.hostlist}
        {foreach $ClientArea.hostlist as $list}
        <tr>
          <td>
            <div>
              <a href="servicedetail?id={$list.id}" class="tc-resource-name">{$list.productname}</a>
              {if $list.domain}
              <div class="tc-resource-domain">{$list.domain}</div>
              {/if}
            </div>
          </td>
          <td class="text-center">
            <div class="d-flex align-items-center justify-content-center">
              <span class="tc-status-dot bg-success"></span>
              <span class="ml-1">{$list.domainstatus_desc|default='正常'}</span>
            </div>
          </td>
          <td class="text-center">
            {if $list.billingcycle!="free" && $list.cycle_desc!='一次性'}
            {$list.nextduedate|date="Y-m-d H:i"}
            {else}
            <span class="text-muted">-</span>
            {/if}
          </td>
          <td class="text-center">
            {if $list.billingcycle!="free"}
            {$list.price_desc}/{$list.cycle_desc}
            {else}
            <span class="tc-package-badge tc-package-free">{$list.cycle_desc|default='免费版'}</span>
            {/if}
          </td>
          <td class="text-center">
            {if $list.dedicatedip}
            {$list.dedicatedip}
            {else}
            <span class="text-muted">-</span>
            {/if}
          </td>
        </tr>
        {/foreach}
        {else}
        <tr>
          <td colspan="5" class="text-center py-5">
            <div class="tc-no-data">{$Lang.nothing_content|default='暂无数据'}</div>
          </td>
        </tr>
        {/if}
      </tbody>
    </table>
  </div>
  <!-- 分页 -->
  <div class="table-footer">
    <div class="table-tools"></div>
    <div class="table-pagination">
      <div class="table-pageinfo mr-2">
        <span>{$Lang.common|default='共'} {$ClientArea.Total} {$Lang.strips|default='条'}</span>
        <span class="mx-2">
          {$Lang.each_page|default='每页'}
          <select name="" id="sourcelimitSel">
            <option value="5" {if $ClientArea.Limit==5}selected{/if}>5</option>
            <option value="10" {if $ClientArea.Limit==10}selected{/if}>10</option>
            <option value="15" {if $ClientArea.Limit==15}selected{/if}>15</option>
            <option value="20" {if $ClientArea.Limit==20}selected{/if}>20</option>
            <option value="50" {if $ClientArea.Limit==50}selected{/if}>50</option>
            <option value="100" {if $ClientArea.Limit==100}selected{/if}>100</option>
          </select> {$Lang.strips|default='条'}
        </span>
      </div>
      <ul class="pagination pagination-sm">
        {$ClientArea.Pages}
      </ul>
    </div>
  </div>
</div>
<script>
  $(function () {
    // 排序
    $('.tc-resource-table thead th').on('click', function () {
      if (!$(this).attr('prop')) return false
      getSourceList('sort', $(this).attr('prop'))
    })
    
    //改变排序样式
    changeStyle()
    function changeStyle() {
        $('.tc-resource-table thead th.pointer span').children().css('color','rgba(0, 0, 0, 0.1)')
        let index
        let sort = localStorage.getItem('sort')
        if( sort=== 'desc') {
          index = 1
        } else if(sort=== 'asc'){
          index = 0
        }
        $('.tc-resource-table thead th.pointer span').children().eq(index).css('color','rgba(0, 0, 0, 0.8)')
    }

    // 每页数量选择改变
    $('#sourcelimitSel').on('change', function () {
      getSourceList('limit')
    })

    // 分页
    $(document).on('click', '.page-link', function (e) {
      e.preventDefault()
      var href = $(this).attr('href')
      if (href) {
        $.get('' + href, function (data) {
          $('#sourceListBox').html(data)
        })
      }
    })
    
    // 重新绑定事件（因为内容是通过AJAX加载的）
    $(document).on('change', '#sourcelimitSel', function () {
      getSourceList('limit')
    })
  })

  function getSourceList(searchType, orderby) {
    // 搜索条件
    var searchObj = {
      action: 'list'
    }

    if (searchType == 'sort') {
      searchObj.sort = (localStorage.getItem('sort') == 'asc') ? 'desc' : 'asc'
      localStorage.setItem('sort', searchObj.sort)
      searchObj.orderby = orderby
    }
    if (searchType == 'limit') {
      searchObj.limit = $('#sourcelimitSel').val()
      searchObj.page = 1
    }
    $.ajax({
      type: "get",
      url: '' + '/clientarea',
      data: searchObj,
      success: function (data) {
        $('#sourceListBox').html(data)
      }
    });
  }
</script>
