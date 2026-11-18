<script src="/themes/clientarea/808yun/assets/libs/echarts/echarts.min.js?v={$Ver}"></script>
<script>
  $(function () {
    var credit = '{$ClientArea.index.client.credit}' // 余额
    var unpaid = '{$ClientArea.index.invoice_unpaid}' // 未支付
    var creditNum = parseFloat(credit.replace('{$Lang.element}', ''))
    var unpaidNum = parseFloat(unpaid.replace('{$Lang.element}', ''))

    var percentage = parseFloat(creditNum / (creditNum + unpaidNum)).toFixed(2)

    if (creditNum === 0 || (creditNum === 0 && unpaidNum === 0)) {
      percentage = 0
    }
    var myChart = echarts.init(document.getElementById("balanceCharts"));
    var
      option = {
        title: {
          text: '{a|' + credit + '}\n\n{c|' + '{$Lang.current_balance}' + '}',
          x: 'center',
          y: 'center',
          textStyle: {
            rich: {
              a: {
                fontSize: 16,
                color: '#007bfc'
              },
              c: {
                fontSize: 12,
                color: '#000000',
                padding: [5, 0]
              },

            }
          }
        },
        series: [
          {
            type: 'gauge',
            radius: '80%',
            clockwise: true,
            startAngle: '270',
            endAngle: '-89.9999',
            //调整间隔距离
            splitNumber: 0,
            detail: {
              offsetCenter: [0, -20],
              formatter: ' '
            },
            pointer: {
              show: false
            },
            axisLine: {
              show: true,
              lineStyle: {
                color: [
                  [0, '#228cfc'],
                  //计算比例
                  [percentage, '#228cfc'],

                  [1, '#efefef']
                ],
                width: 9
              }
            },
            axisTick: {
              show: false
            },
            splitLine: {
              show: false,
              length: 32,
              lineStyle: {
                color: '#fff',
                width: 6
              }
            },
            axisLabel: {
              show: false
            }
          }
        ]
      };
    myChart.setOption(option, true);
    
    // echarts 随屏幕大小改变大小
    window.addEventListener("resize",function () {
      myChart.resize();
    });

    // 资源列表
    getSourceList()
  })

  function getSourceList() {
    $('#sourceListBox').html(`<div class="h-100 d-flex align-items-center justify-content-center">{$Lang.data_loading}......</div>`)
    $.ajax({
      type: "get",
      url: '/clientarea',
      data: {
        action: 'list'
      },
      success: function (data) {
        $('#sourceListBox').html(data)
      }
    });
  }

</script>

<div class="tc-dashboard">
  <div class="row tc-row-gap">
    <!-- 左侧：我的资源（资源列表 + 产品导航） -->
    <section class="col-12 col-md-12 col-lg-8 tc-resource-section">
      <div class="card tc-panel tc-panel-main">
        <div class="tc-panel-header d-flex justify-content-between align-items-center">
          <div>
            <h4 class="tc-panel-title">{$Lang.my_resource|default='我的资源'}</h4>
            <p class="tc-panel-subtitle mb-0">{$Lang.resource_overview|default='当前已开通产品与资源总览'}</p>
          </div>
        </div>

        <!-- 资源列表（异步加载） -->
        <div class="tc-panel-body p-0">
          <div id="sourceListBox" class="tc-resource-list">
          </div>
        </div>

        <!-- 已开通产品分组 -->
        <div class="tc-panel-footer">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <span class="tc-block-title">{$Lang.products_launched_all}</span>
          </div>
          <div class="user-center_product_grid">
            {foreach $ClientArea.index.host_nav as $list}
            <a href="service?groupid={$list.id}" class="user-center_product">
              <span>
                <i class="bx bxs-grid-alt"></i>
                {$list.groupname}
              </span>
              <span>({$list.count})</span>
            </a>
            {/foreach}
          </div>
        </div>
      </div>

      <!-- 公告通知：放在我的资源卡片下方 -->
      <div class="card tc-panel tc-panel-main mt-3">
        <div class="tc-panel-header d-flex justify-content-between align-items-center">
          <h4 class="tc-panel-title mb-0">{$Lang.announcement}</h4>
          <a href="news" class="tc-link-small">{$Lang.view_more}</a>
        </div>
        <div class="tc-panel-body">
          <!-- 公告列表：网格布局 -->
          <div class="tc-notice-grid">
            {if $ClientArea.index.news}
            {foreach $ClientArea.index.news as $list}
            <a href="newsview?id={$list.id}" class="tc-notice-grid-item">
              <div class="tc-notice-item-content">
                <i class="bx bx-file-blank tc-notice-icon"></i>
                <div class="tc-notice-item-text">
                  <div class="tc-notice-title">{$list.title}</div>
                  <div class="tc-notice-time">{$list.push_time|date="Y-m-d H:i"}</div>
                </div>
              </div>
            </a>
            {/foreach}
            {else}
            <div class="tc-notice-empty-wrapper">
              <span class="tc-notice-empty">{$Lang.nothing}</span>
            </div>
            {/if}
          </div>
        </div>
      </div>
    </section>

    <!-- 右侧：账户信息 + 费用信息 -->
    <section class="col-12 col-md-12 col-lg-4 tc-account-section">
      <!-- 账户信息 -->
      <div class="card tc-panel tc-panel-right mb-3">
        <div class="tc-panel-header">
          <h4 class="tc-panel-title mb-0">{$Lang.account_information|default='账户信息'}</h4>
        </div>
        <div class="tc-panel-body tc-account-card">
          <div class="d-flex align-items-center">
            <div class="tc-avatar-wrapper">
              <div class="user-center_header d-flex align-items-center justify-content-center">
                {if preg_match("/^[0-9]*[A-Za-z]+$/is", substr($Userinfo.user.username,0,1))} 
                  {$Userinfo.user.username|substr=0,1|upper} 
                {elseif preg_match("/^[\x7f-\xff]*$/", substr($Userinfo.user.username,0,3))} 
                  {$Userinfo.user.username|substr=0,3}
                {else}
                  {$Userinfo.user.username|substr=0,1|upper} 
                {/if}
              </div>
            </div>
            <div class="ml-3 flex1">
              <div class="d-flex justify-content-between align-items-center">
                <div>
                  <div class="tc-account-name">
                    {$Userinfo.user.username}
                  </div>
                  <div class="tc-account-id">
                    ID:{$Userinfo.user.id}
                  </div>
                </div>
              </div>
              <div class="tc-account-contact mt-1">
                <span>
                  {if $Userinfo.user.phonenumber}
                    {$Userinfo.user.phonenumber|substr=0,3}***{$Userinfo.user.phonenumber|substr=7}
                  {/if}
                </span>
              </div>
            </div>
          </div>

          <div class="tc-account-security mt-3">
            <a href="security" class="tc-security-item" {if $Userinfo.user.certifi.status!=1} data-status="off" {/if}>
              <i class="bx bx-check-shield"></i>
              <span>{$Lang.real_name_authentications}</span>
            </a>
            <a href="security" class="tc-security-item" {if !$Userinfo.user.phonenumber} data-status="off" {/if}>
              <i class="bx bx-phone-call"></i>
              <span>{$Lang.bind_phone|default='手机绑定'}</span>
            </a>
            <a href="security" class="tc-security-item" {if !$Userinfo.user.email} data-status="off" {/if}>
              <i class="bx bx-mail-send"></i>
              <span>{$Lang.bind_email|default='邮箱绑定'}</span>
            </a>
          </div>

          <div class="tc-account-todo mt-3">
            <div class="tc-account-todo-item">
              <div class="tc-account-todo-num text-warning">
                {$ClientArea.index.ticket_count}
              </div>
              <div class="tc-account-todo-label">
                {$Lang.pending_work_order}
              </div>
              <a href="supporttickets" class="stretched-link"></a>
            </div>
            <div class="tc-account-todo-item">
              <div class="tc-account-todo-num text-primary">
                {$ClientArea.index.order_count}
              </div>
              <div class="tc-account-todo-label">
                {$Lang.unpaid_order}
              </div>
              <a href="billing" class="stretched-link"></a>
            </div>
            <div class="tc-account-todo-item">
              <div class="tc-account-todo-num text-success">
                {$ClientArea.index.host}
              </div>
              <div class="tc-account-todo-label">
                {$Lang.number_of_products}
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 费用信息 -->
      <div class="card tc-panel tc-panel-right">
        <div class="tc-panel-header d-flex justify-content-between align-items-center">
          <h4 class="tc-panel-title mb-0">{$Lang.fee_information|default='费用信息'}</h4>
          {if $ClientArea.index.allow_recharge == '1'}
          <a href="/addfunds" class="btn btn-primary btn-sm tc-fee-recharge-btn">{$Lang.recharge}</a>
          {/if}
        </div>

        <div class="tc-panel-body">
          <!-- 顶部：账户余额 + 导航 -->
          <div class="d-flex justify-content-between align-items-center tc-fee-header">
            <div class="tc-fee-balance">
              <div class="tc-fee-balance-label">
                {$Lang.account_balance|default='账户余额'} ({$Lang.element|default='元'})
              </div>
              <div class="tc-fee-balance-value">
                {$ClientArea.index.client.credit}
              </div>
            </div>
            <div class="tc-fee-tabs d-none d-md-flex">
              <a href="billing">{$Lang.my_order|default='我的订单'}</a>
              <a href="transaction">{$Lang.income_expenditure|default='收支明细'}</a>
              <a href="supporttickets">{$Lang.fee_bill|default='工单列表'}</a>
              <a href="knowledgebase">{$Lang.cost_management|default='帮助中心'}</a>
            </div>
          </div>

          <!-- 中部：隐藏的图表容器，仅用于兼容现有 JS -->
          <div class="tc-balance-chart d-none">
            <div id="balanceCharts" class="w-100 h-100"></div>
          </div>

          <!-- 底部：两块统计卡片 -->
          <div class="row mt-3">
            <div class="col-12 col-md-6 mb-2">
              <div class="tc-fee-card">
                <div class="tc-fee-card-label">
                  {$Lang.records_of_consumption|default='消费记录'}
                </div>
                <div class="tc-fee-card-value">
                  {$ClientArea.index.intotal|default='0'}
                </div>
              </div>
            </div>
            <div class="col-12 col-md-6 mb-2">
              <div class="tc-fee-card">
                <div class="tc-fee-card-label">
                  {$Lang.order_records|default='订单记录'}
                </div>
                <div class="tc-fee-card-value">
                  {$ClientArea.index.invoice_unpaid|default='0'}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</div>