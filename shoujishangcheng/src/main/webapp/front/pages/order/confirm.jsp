<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!-- 个人中心 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>新闻资讯</title>
		<link rel="stylesheet" href="../../layui/css/layui.css">
		<!-- 样式 -->
		<link rel="stylesheet" href="../../css/style.css" />
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="../../css/theme.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="../../css/common.css" />
	</head>
	<body>

		<div id="app">
			<!-- 轮播图 -->
			<div class="layui-carousel" id="swiper">
				<div carousel-item id="swiper-item">
					<div v-for="(item,index) in swiperList" v-bind:key="index">
						<img class="swiper-item" :src="item.img">
					</div>
				</div>
			</div>
			<!-- 轮播图 -->

			<!-- 标题 -->
			<h2 style="margin-top: 20px;" class="index-title">CONFIRM / ORDER</h2>
			<div class="line-container">
				<p class="line"> 确认下单 </p>
			</div>
			<!-- 标题 -->

			<div class="container">
				<h2 v-if="seat!=1">选择收货地址</h2>
				<table v-if="seat!=1" class="layui-table address-table" lay-skin="nob">
					<!-- <colgroup>
				    <col width="150">
				    <col width="200">
				    <col>
				  </colgroup> -->
					<thead>
						<tr>
							<th>选择</th>
							<th>收件人</th>
							<th>联系方式</th>
							<th>地址</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="(item,index) in addressList" v-bind:key="index">
							<td><input type="radio" :value="index" name="address" /></td>
							<td>{{item.name}} </td>
							<td>{{item.phone}}</td>
							<td>{{item.address}}</td>
						</tr>
					</tbody>
				</table>
				<h2>清单列表</h2>
				<table class="layui-table" lay-skin="nob" style="border: 3px dotted #EEEEEE;margin: 20px 0;">
					<thead>
						<tr>
							<th>购买商品</th>
							<th>价格</th>
							<th v-if="seat==1">座位</th>
							<th v-else>数量</th>
							<th>总价</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="(item,index) in dataList" v-bind:key="index">
							<td style="display: flex;text-align: left;">
								<img :src="item.picture" style="width: 100px;height: 100px;object-fit: cover;">
								<div style="margin-left: 10px;margin-top: 10px;">
									{{item.goodname}}
								</div>
							</td>
							<td v-if="type==2" style="width: 100px;">{{item.discountprice}} 积分</td>
							<td v-else style="width: 100px;">{{item.discountprice}} RMB</td>
							<td v-if="seat==1" style="width: 140px;">
								{{item.activeSeat}}
							</td>
							<td  v-else style="width: 140px;">
								{{item.buynumber}}
							</td>
							<td v-if="type==2" style="width: 100px;">{{item.discountprice*item.buynumber}} 积分</td>
							<td v-else-if="seat==1"  style="width: 100px;">{{item.totalPrice}} RMB</td>
							<td v-else  style="width: 100px;">{{item.discountprice*item.buynumber}} RMB</td>
						</tr>
					</tbody>
				</table>

				<div v-if="seat==1" class="btn-container">
					<span style="font-size: 18px;font-weight: bold;color: #ce0b07;margin-right: 20px;">
						总价：{{dataList[0].total}}RMB
					</span>
					<button @click="xuanzuoClick()" type="button" class="layui-btn layui-btn-lg btn-theme">
						<i class="layui-icon">&#xe657;</i> 支付
					</button>
				</div>
				<div v-else-if="type==2" class="btn-container">
					<span style="font-size: 18px;font-weight: bold;color: #ce0b07;margin-right: 20px;">
						总价：{{totalPrice}}积分
					</span>
					<button @click="jifenClick()" type="button" class="layui-btn layui-btn-lg btn-theme">
						<i class="layui-icon">&#xe657;</i> 兑换
					</button>
				</div>
				<div v-else class="btn-container">
					<%--<div>
						<label style="display: inline-block;">
							<label class="next-checkbox-wrapper checkbox__checkbox checked ">
								<input type="checkbox" id="updateMoney" @change="updateMoney()">
								<span class="next-checkbox-label">使用积分{{user.jifen}}</span>
							</label>
						</label>
						<div class="label checkbox__price"></div>
					</div>--%>
					<span style="font-size: 18px;font-weight: bold;color: #ce0b07;margin-right: 20px;">
						总价：{{totalPrice}}RMB
					</span>
					<button @click="payClick()" type="button" class="layui-btn layui-btn-lg btn-theme">
						<i class="layui-icon">&#xe657;</i> 支付
					</button>
				</div>
			</div>

		</div>

		<!-- layui -->
		<script src="../../layui/layui.js"></script>
		<!-- vue -->
		<script src="../../js/vue.js"></script>
		<!-- 组件配置信息 -->
		<script src="../../js/config.js"></script>
		<!-- 扩展插件配置信息 -->
		<script src="../../modules/config.js"></script>
		<!-- 工具方法 -->
		<script src="../../js/utils.js"></script>
		<!-- 校验格式工具类 -->
		<script src="../../js/validate.js"></script>
		<script src="../../../resources/js/jquery-3.2.1.min.js"></script>

		<script>
			var vue = new Vue({
				el: '#app',
				data: {
					// 轮播图
					swiperList: [{
						img: '../../img/banner.jpg'
					}],
					dataList: [],
					addressList: [],
					seat: 0,
					type: 0,
					// 当前用户信息
					user: {},
                    // tempJifen: 0,
                    shiyongJifen: 0,
                    totalPrice: null
				},
				computed: {
					// totalPrice: function() {
					// 	var total = 0;
					// 	for (var item of this.dataList) {
					// 		total += item.discountprice * item.buynumber
					// 	}
					// 	return total;
					// }
				},
				methods: {
                    updateMoney(){
                        var total = 0;
                        var temp =0; //temp为临时变量,存的是总价格
                        for (var item of this.dataList) {
                            temp += item.discountprice * item.buynumber;
                        }
                        if(document.getElementById("updateMoney").checked){
                            //使用积分
                            var jifen = this.user.jifen;
                            if(jifen>temp){
                                //积分大于总价格
                                this.shiyongJifen=temp;//使用积分为总价格
                                //total=0;  // 积分大于总价格 就是付款0元
                                //
							}else if(jifen<temp){
                                //积分小于总价格
                                this.shiyongJifen=jifen;//使用积分为总积分
                                total=temp-jifen;  // 积分小于总价格,就是总价格减去积分 就是要付款的钱
							}else{
                                //积分等于总价格
                                this.shiyongJifen=temp;
                                //total=0;  // 积分大于总价格 就是付款0元
							}
                        }else{
                            //不使用积分
                            total=temp;//价格就是总价格
                            this.shiyongJifen=0;//使用积分为0
                        }
                        this.totalPrice =total;
                    },
					jump(url) {
						jump(url)
					},
					// 正常下单，生成订单，减少余额，添加积分，减少库存，修改状态已支付
					payClick() {
						console.log('payClick')
						var index = layui.jquery('input[name=address]:checked').val();
						console.log(index);
						if (!index) {
							layui.layer.msg('请选择收货地址', {
								time: 2000,
								icon: 5
							});
							return
						}

						// 生成订单
						for (let item of this.dataList) {

							// 获取商品详情信息
							layui.http.request(`${item.tablename}/info/${item.goodid}`, 'get', {}, (res) => {
								// 订单编号
								debugger
								var orderId = genTradeNo();
								let data = res.data;
								// 减少库存
								data.shuliang = data.shuliang - item.buynumber;
								// 更新库存信息
								layui.http.requestJson(`${item.tablename}/update`, 'post', data, (res) => {
									// 添加订单信息
									let order = {
										orderid: orderId,
										tablename: item.tablename,
										userid: this.user.id,
										goodid: item.goodid,
										goodname: item.goodname,
										picture: item.picture,
										buynumber: item.buynumber,
										discountprice: item.discountprice,
										price: item.price,
										total: item.price * item.buynumber,
										discounttotal: item.discountprice * item.buynumber,
										type: 1,
										address: this.addressList[index].address,
										status: '未支付'
									}
									layui.http.requestJson(`orders/add`, 'post', order, (res) => {
										// 减少余额，更新订单状态
										// 判断余额是否充足
										if (this.user.money < this.totalPrice) {
											layui.layer.msg('余额不足，请先充值', {
												time: 2000,
												icon: 5
											});
											return
										}
										// 如果该商品存在积分
										var date = new Date();
                            			var dateformat = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
										var s =Number(this.shiyongJifen);
										if(s !=0){// 使用积分不为0
                                            let jifenjilu = {
                                                yonghuId: this.user.id,
                                                shangpinxinxiId:item.goodid,
                                                jifenjiluTypes:"使用",
                                                buynumber:this.shiyongJifen,
                                                insertTime:dateformat
                                            }
                                            layui.http.requestJson(`jifenjilu/add`, 'post', jifenjilu, (res) => {});
										}
										var a = Number(this.user.jifen)-s;
										if (data.jifen) {
										    debugger
											// this.user.jifen = Number(this.user.jifen) + Number(data.jifen * item.buynumber);
											//用户积分-这次使用的积分+这次订单的积分
                                            a+=Number(data.jifen * item.buynumber);
                                            let jifenjilu = {
                                                yonghuId: this.user.id,
                                                shangpinxinxiId:item.goodid,
                                                jifenjiluTypes:"添加",
                                                buynumber:Number(data.jifen * item.buynumber),
                                                insertTime:dateformat
                                            }
                                            layui.http.requestJson(`jifenjilu/add`, 'post', jifenjilu, (res) => {});
										}
                            			this.user.jifen=a;
										this.user.money = this.user.money - this.totalPrice;
										// 更新用户余额
										layui.http.requestJson(`${localStorage.getItem("userTable")}/update`, 'post', this.user, (res) => {
											order.status = '已支付'
											layui.http.request(`orders/list`, 'get', {
												orderid: orderId,
												page: 1,
												limit: 1,
											}, (res) => {
												order.id = res.data.list[0].id;
												layui.http.requestJson(`orders/update`, 'post', order, (res) => {
													// 删除购物车数据(如果是购物车下单)
													if (item.id) {
														layui.http.requestJson(`cart/delete`, 'post', [item.id], (res) => {});
													}
													layui.layer.msg('购买成功', {
														time: 2000,
														icon: 6
													}, function() {
														window.location.href='../order/list.jsp'
													});
												});
											});
										});
									})
								})
							});
						}
					},
					// 积分兑换，生成订单，减少用户积分，减少库存
					jifenClick() {
						console.log('jifenClick')
						var index = layui.jquery('input[name=address]:checked').val();
						console.log(index);
						if (!index) {
							layui.layer.msg('请选择收货地址', {
								time: 2000,
								icon: 5
							});
							return
						}

						// 生成订单
						for (let item of this.dataList) {
							// 订单编号
							var orderId = genTradeNo();
							layui.http.request(`${item.tablename}/info/${item.goodid}`, 'get', {}, (res) => {
								let data = res.data;
								// 减少库存
								data.alllimittimes = data.alllimittimes - item.buynumber;
								// 更新库存信息
								layui.http.requestJson(`${item.tablename}/update`, 'post', data, (res) => {
									// 判断积分是否充足
									if (this.user.jifen < this.totalPrice) {
										layui.layer.msg('积分不足，兑换失败', {
											time: 2000,
											icon: 5
										});
										return
									}
									// 添加订单信息
									let order = {
										orderid: orderId,
										tablename: item.tablename,
										userid: this.user.id,
										goodid: item.goodid,
										goodname: item.goodname,
										picture: item.picture,
										buynumber: item.buynumber,
										discountprice: item.discountprice,
										price: item.price,
										total: item.price * item.buynumber,
										discounttotal: item.discountprice * item.buynumber,
										type: 2,
										total: this.totalPrice,
										address: this.addressList[index].address,
										status: '已支付'
									}
									layui.http.requestJson(`orders/add`, 'post', order, (res) => {
										this.user.jifen = this.user.jifen - this.totalPrice;
										// 更新用户余额
										layui.http.requestJson(`${localStorage.getItem("userTable")}/update`, 'post', this.user, (res) => {
											layui.layer.msg('兑换成功', {
												time: 2000,
												icon: 6
											}, function() {
												window.location.href='../order/list.jsp'
											});
										});
									})
								})
							});
						}
					},
					// 选座下单,生成订单，减少余额，添加积分，减少库存，修改状态为已支付
					xuanzuoClick() {
						console.log('xuanzuoClick')
						// 生成订单
						for (let item of this.dataList) {
							// 订单编号
							var orderId = genTradeNo();
							// 获取商品详情信息
							layui.http.request(`${item.tablename}/info/${item.goodid}`, 'get', {}, (res) => {
								let data = res.data;
								// 减少库存
								data.alllimittimes = data.alllimittimes - item.buynumber;
								// 获取已经被预定的座位号
								let selectArray = data.selected.split(',');
								// 获取用户预定的座位号
								let activeArray = item.address.split(',');
								// 新的预定座位号
								let newSelectArray = selectArray.concat(activeArray);
								// 赋值给参数
								data.selected = newSelectArray.join(',');
								// 更新库存,座位信息
								layui.http.requestJson(`${item.tablename}/update`, 'post', data, (res) => {
									// 添加订单信息
									let order = {
										orderid: orderId,
										tablename: item.tablename,
										userid: this.user.id,
										goodid: item.goodid,
										goodname: item.goodname,
										picture: item.picture,
										buynumber: item.buynumber,
										discountprice: item.discountprice,
										price: item.price,
										total: item.total,
										discounttotal: item.discountprice * item.buynumber,
										type: 1,
										address: item.address,
										status: '未支付'
									}
									layui.http.requestJson(`orders/add`, 'post', order, (res) => {
										// 减少余额，更新订单状态
										// 判断余额是否充足
										if (this.user.money < this.totalPrice) {
											layui.layer.msg('余额不足，请先充值', {
												time: 2000,
												icon: 5
											});
											return
										}
										// 如果该商品存在积分
										if (data.jifen) {
											this.user.jifen = Number(this.user.jifen) + Number(data.jifen * item.buynumber);
										}
										this.user.money = this.user.money - this.totalPrice;
										// 更新用户余额
										layui.http.requestJson(`${localStorage.getItem("userTable")}/update`, 'post', this.user, (res) => {
											order.status = '已支付'
											layui.http.request(`orders/list`, 'get', {
												orderid: orderId,
												page: 1,
												limit: 1,
											}, (res) => {
												order.id = res.data.list[0].id;
												layui.http.requestJson(`orders/update`, 'post', order, (res) => {
													layui.layer.msg('购买成功', {
														time: 2000,
														icon: 6
													}, function() {
														window.location.href='../order/list.jsp'
													});
												});
											});
										});
									})
								})
							});
						}
					}
				}
			})

			layui.use(['layer', 'element', 'carousel', 'http', 'jquery', 'form', 'upload'], function() {
				var layer = layui.layer;
				var element = layui.element;
				var carousel = layui.carousel;
				var http = layui.http;
				var jquery = layui.jquery;
				var form = layui.form;
				var upload = layui.upload;

				// 订单类型，2则是积分兑换，其他是正常下单
				vue.type = http.getParam('type');
				// 订单类型，seat存在值则是选座下单，否则是其他类型
				vue.seat = http.getParam('seat');

				// 充值
				jquery('#btn-recharge').click(function(e) {
					layer.open({
						type: 2,
						title: '用户充值',
						area: ['900px', '600px'],
						content: '../recharge/recharge.jsp'
					});
				});

				// 获取轮播图 数据
				http.request('config/list', 'get', {
					page: 1,
					limit: 5
				}, function(res) {
					if (res.data.list.length > 0) {
						var swiperItemHtml = '';
						for (let item of res.data.list) {
							if (item.name.indexOf('picture') >= 0 && item.value && item.value != "" && item.value != null) {
								swiperItemHtml +=
									'<div>' +
									'<img class="swiper-item" src="' + item.value + '">' +
									'</div>';
							}
						}
						jquery('#swiper-item').html(swiperItemHtml);
						// 轮播图
						carousel.render({
							elem: '#swiper',
							width: swiper.width,height:swiper.height,
							arrow: swiper.arrow,
							anim: swiper.anim,
							interval: swiper.interval,
							indicator: "none"
						});
					}
				});

				// 获取地址数据
				http.request('address/list', 'get', {
					userid: localStorage.getItem('userid')
				}, function(res) {
					vue.addressList = res.data.list
				})

				// 获取商品购买的清单列表
				var orderGoods = localStorage.getItem('orderGoods')
				// 转换成json类型，localstorage保存的是string数据
				vue.dataList = JSON.parse(orderGoods);
				debugger

				// 用户当前用户信息
				let table = localStorage.getItem("userTable");
				http.request(`${table}/session`, 'get', {}, function(data) {
					vue.user = data.data;
				});
                var total = 0;
                for (var item of vue.dataList) {
                    total += item.discountprice * item.buynumber
                }
                vue.totalPrice =total;
                // vue.tempJifen=user.jifen;
                // vue.shiyongJifen=0;

			});
		</script>
	</body>
</html>
