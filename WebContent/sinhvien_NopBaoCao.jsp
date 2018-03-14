<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="Controller.*,Model.*" %>
<!DOCTYPE html>
<html lang="en"><head>
<title> Example </title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">  
<script type="text/javascript" src="vendor/bootstrap.js"></script>
<script type="text/javascript" src="1.js"></script>
<script type="text/javascript" src="jquery.validate.min.js"></script>
<script type="text/javascript" src="angular.min.js"></script>
<script type="text/javascript" src="ng-table.js"></script>
<link rel="stylesheet" href="vendor/bootstrap.css">
<link rel="stylesheet" href="1.css">
<link rel="stylesheet" href="vendor/font-awesome.css">
<script>
$( document ).ready(function() {
	$('#DSDeTai_SV tr').each(function() {
	    var customerId = $(this).find(".trangthaiDT").text();
	    if(customerId != "Đang tiến hành")
	    {
    		$(this).find(".dsDeTai_actionButton").attr("disabled",true);
    	}
	 });
});
</script>
</head>
<body >
<% TB_TK_Controller cttb= new TB_TK_Controller();
	ThongBao_Controller tb= new ThongBao_Controller();
	DeTai_Controller dt= new DeTai_Controller();
	TrangThai_Controller tt=  new TrangThai_Controller();
	CTNghiemThu_Controller ctnt= new CTNghiemThu_Controller();
	TaiKhoan_Controller tk=new TaiKhoan_Controller();
	BaoCaoDT_Controller bc= new BaoCaoDT_Controller();
	DeTai ctdt=new DeTai();
	String maDT = "";
	if (request.getParameter("MaDT") != null) {
		maDT = request.getParameter("MaDT");
		ctdt = dt.getDeTai(maDT);
	}
%>
	<div class="page">
		<div class="menu">
			<div class="row">
				<div class="pictureMain">
					<img src="images/skpt_banner_2.jpg" class="img-responsive" alt="Image">
				</div>
				<div class="menuBar">
					<nav class="navbar navbar-default " role="navigation">
						<div class="container" id="container_menuBar">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
									<span class="sr-only">Toggle navigation</span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
							</div>

							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse navbar-ex1-collapse" id="menuMain">
								<ul class="nav navbar-nav">
									<li><a href="#">Trang chủ</a></li>
									<li><a href="#">Biểu Mẫu</a></li>
									<li><a href="#">Liên Hệ</a></li>
									<li><a href="#">Hướng dẫn</a></li>
								</ul>
								<ul class="nav navbar-nav navbar-right">
									<li><a href="#"><span  style="color:blue"><%=session.getAttribute("Email") %></span></a></li>
										<li><a href="mainPage.jsp">Đăng xuất</a></li>
								</ul>
							</div><!-- /.navbar-collapse -->
						</div>
					</nav>
				</div>
			</div>	
		</div>
		<div class="svContent">
			<div class="row">
				<div class="col-md-2">
					<ul class="nav nav-pills nav-stacked">
						<li ><a class="list-group-item" href="#thongbao" data-toggle="pill">
							<span class="glyphicon glyphicon-home"></span> Thông báo</a>
						</li>
						<li style="margin-top:0px;"><a href="#dsDeTai" class="list-group-item" data-toggle="pill">
							<span class="glyphicon glyphicon-list-alt"></span> Danh sách đề tài</a>
						</li>
						<li style="margin-top:0px;"><a href="#dkDeTai" class="list-group-item" data-toggle="pill" style="border-radius:0px;">
							<span class="glyphicon glyphicon-inbox"></span> Đăng ký đề tài NCKH</a></li>
						<li style="margin-top:0px;"><a href="#kqNghiemThu" class="list-group-item" data-toggle="pill">
							<span class="glyphicon glyphicon-check"></span> Kết quả nghiệm thu</a></li>
						<li style="margin-top:0px;"><a href="#ttTaiKhoan" class="list-group-item" data-toggle="pill">
							<span class="glyphicon glyphicon-user"></span> Thông tin tài khoản</a>
						</li>
					</ul>
				</div>
				<div class="col-md-10">
					<div class="tab-content">
						<div class="tab-pane active" id="NopBaoCao">
							<div class="sv_NopBC" style="background:white;height:500px;border-radius:3px;overflow:auto;">
								<h2 class="tieude_theh" >NỘP BÁO CÁO ĐỀ TÀI</h2><hr>
								<div class="gv_bcdt" style="margin:15px 0px 10px 15px;">
								
									<label>Mã số đề tài: <%=ctdt.getMaDT() %></label><br>
									<label>Tên đề tài: <%=ctdt.getTenDT()%></label>
								</div>
								
								<div class="ad_table_qltk" style="margin:0px 5px 0px 5px;">
									<table class="table table-striped table-hover">
										<thead class="thead-default">
											<tr class="success">
												<th>Ngày Upload</th>
												<th>File báo cáo</th>
												<th>Mô tả</th>	
											</tr>
										</thead>
										<tbody>
										<%
				     						for (BaoCaoDT nbc: bc.getListBaoCaoDT(maDT)) {
											%>
											<tr>
												<td><%=nbc.getNgayBC() %></td>
												<td><a href="sinhvien_BaoCaoTienDo.jsp?MaBC=<%=nbc.getMaBC()%>"><%=nbc.getTenBC() %></a></td>
												<td><%=nbc.getTenBC() %></td>

											</tr>
											
											<%
			    								}
											%>
										</tbody>
									</table>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="margin-left:-10px">
										
										<div class="fileinput fileinput-new" data-provides="fileinput">
									    <span class="btn btn-default btn-file">
									    		<input accept=".pdf,.docx" type="file" multiple />
									    </span>
																		</div>
									</div>
									<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
										<button type="submit" class="btn btn-primary btn-md">Nộp file</button>
									</div>
								</div>
								<script type="text/javascript">
								$(function() {
									var x=4;
									$("#NopBaoCao button:submit").on('click', function() {
										if($('#input_file').val()=='')
											alert("Chọn file upload");
										else
										{
											alert('Nộp thành công');
										$('#input_file').val('');
										var newRowContent = "<tr> "+
												"<td>20/10/2014</td>"+
												"<td><a href='sinhvien_BaoCaoTienDo.jsp'>Báo cáo tiến độ "+x+"</a></td>"+
												"<td>Nghiên cứu qui trình 4</td></tr>";
										$('#NopBaoCao tbody').prepend(newRowContent);
										x=x+1;
										}
									});
								});
								$(document).ready(function(){
									$("#tbUpload").change(function() {
										$("#btnUpload").trigger('click');
									});
								});

								</script>
							</div>
						</div>
						<div class="tab-pane" id="thongbao">
									<div class="row">
										<div class="svThongBao " style="background:white;height:500px;margin-right:15px;border-radius:3px">
											<h2 class="tieude_theh" >THÔNG BÁO</h2><hr>
											<div class="sv_table_thongbao" ng-app="sortApp" ng-controller="mainController">
												<form>
													<div class="form-group">
														<div class="input-group col-xs-8" style="margin-left:50px;" >
															<div class="input-group-addon"><i class="fa fa-search"></i></div>
															<input type="text" class="form-control" placeholder="Search da Fish" ng-model="searchFish">
														</div>      
													</div>
												</form>
												<table class="table table-striped table-hover">
													<thead>
														<tr class="success">
															<th><input type="checkbox" name="" id="selectAll_ThongBao" value=""></th>
															<th>
																<a href="#" ng-click="sortType = 'name'; sortReverse = !sortReverse">
																	Thông báo
																	<span ng-show="sortType == 'name' && !sortReverse" class="fa fa-caret-down"></span>
																	<span ng-show="sortType == 'name' && sortReverse" class="fa fa-caret-up"></span>
																</a>
															</th>
															<th>
																<a href="#" ng-click="sortType = 'fish'; sortReverse = !sortReverse">
																	Người gửi
																	<span ng-show="sortType == 'fish' && !sortReverse" class="fa fa-caret-down"></span>
																	<span ng-show="sortType == 'fish' && sortReverse" class="fa fa-caret-up"></span>
																</a>
															</th>
															<th>
																<a href="#" ng-click="sortType = 'fish'; sortReverse = !sortReverse">
																	Ngày gửi
																	<span ng-show="sortType == 'fish' && !sortReverse" class="fa fa-caret-down"></span>
																	<span ng-show="sortType == 'fish' && sortReverse" class="fa fa-caret-up"></span>
																</a>
															</th>
															<th>
																<a href="#" ng-click="sortType = 'tastiness'; sortReverse = !sortReverse">
																	Chi tiết 
																	<span ng-show="sortType == 'tastiness' && !sortReverse" class="fa fa-caret-down"></span>
																	<span ng-show="sortType == 'tastiness' && sortReverse" class="fa fa-caret-up"></span>
																</a>
															</th>
														</tr>
													</thead>
		
													<tbody>
														<%
				     										for (TB_TK tbtk: cttb.getListTB_TKByMaTK(session.getAttribute("Email").toString())) {
														%>
														<tr >
																<td><input type="checkbox" name=""  value=""></td>
																<td><%=tbtk.getTinTB() %></td>
																<td><%=tbtk.getTenNguoiGui() %></td>
																<td><%=tbtk.getNgayGui() %></td>
																<td><a href="sinvien_XemThongBao.jsp?MaCTTB=<%=tbtk.getMaCTTB() %>">Xem</a></td>
															</tr>
															<%
			    											}
															%>
														
													</tbody>
												</table>
												<script>
												$('#selectAll_ThongBao').change(function(){
													if($(this).prop('checked')){
														$('tbody tr td input[type="checkbox"]').each(function(){
															$(this).prop('checked', true);
														});
													}else{
														$('tbody tr td input[type="checkbox"]').each(function(){
															$(this).prop('checked', false);
														});
													}
												});
												
												</script>
											</div>
											<button type="button" class="btn btn-danger" id="btn_Xoa" style="float:right; margin-right:10px">
												<span class="glyphicon glyphicon-trash"></span> Xóa thông báo</button>
										</div>
									</div>
								</div>
									<div class="tab-pane" id="dsDeTai"  >
										<div class="row" id="ttt">
											<div class="svdsDeTai" style="background:white;height:500px;margin-right:15px;border-radius:3px">
												<h2 class="tieude_theh">DANH SÁCH ĐỀ TÀI</h2><hr>
												<div class="sv_table_dsDeTai">
													<table class="table table-striped table-hover">
														<thead class="thead-default">
															<tr class="success">
																<th>Mã số</th>
																<th>Tên đề tài</th>
																<th>Ngày đăng ký</th>	
																<th>Hạn nghiệm thu</th>
																<th>Trạng thái</th>
																<th>Chi tiết</th>
																<th>Nộp báo cáo</th>
																<th>Chức năng</th>
															</tr>
														</thead>
														<tbody>
														<%
				     										for (DeTai detai: dt.getListDeTaiByMaCN(session.getAttribute("Email").toString())) {
				     											
														%>
															<tr>
																<td><%=detai.getMaDT() %></td>
																<td><%=detai.getTenDT() %></td>
																<td><%=detai.getNgayThucHien() %></td>
																<td><%=detai.getNgayKetThuc()%></td>
																<td><%=detai.getTenTT()%></td>
																<td><a href="sinhvien_XemCTDT.jsp?MaDT=<%=detai.getMaDT()%>">Xem</a></td>
																<td><a href="sinhvien_NopBaoCao.jsp?MaDT=<%=detai.getMaDT()%>">Nộp</a></td>
																<td class="dropdown"><a class="btn btn-default dsDeTai_actionButton" data-toggle="dropdown" href="#"> Action </a></td>
																<ul id="contextMenu" class="dropdown-menu" role="menu">
																<li><a tabindex="-1" href="sinhvien_GiaHanDT.jsp?MaDT=<%=detai.getMaDT() %>" >Gia Hạn</a></li>
																<li><a tabindex="-1" href="sinhvien_LyDoHyGHDT.jspMaDT=<%=detai.getMaDT() %>">Hủy</a></li>
																</ul>
															</tr>
														<%
			    											}
															%>
														
														</tbody>
													</table>
													
													
												</div>
												
											</div>
										</div>
									</div>

									
									<div class="tab-pane" id="dkDeTai">
										<div class="row" style="margin-right:0px;">
											<div class="svdkDeTai" style="background:white;border-radius:3px">
												<h2 class="tieude_theh">ĐĂNG KÝ ĐỀ TÀI</h2>
												<hr>
												<div class="container" style="width:800px">
													<div class="row">
														<div class="mota">
															<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
																<form action=" " onsubmit="" method="POST" role="form" class="form-horizontal">
																	<div class="form-group">
																		<label class="col-sm-2 control-label" for="tendetai">Tên đề tài:</label>
																		<div class="col-sm-10" style="margin-bottom:5px">
																			<input type="text" name="mota" class="form-control required mota" placeholder="Đề tài 1"  id="" required minlength="6" data-placement="right" data-trigger="hover" data-content="Bạn cần phải nhập vào trường này,ít nhất 6 ký tự.">
																		</div>
																		<label class="col-sm-2 control-label" for="mota">Mô tả:</label>
																		<div class="col-sm-10">
																			<textarea type="text" name="mota" class="form-control required mota" placeholder="tạo 1 website bán hàng"  id="" required  data-placement="right" data-trigger="hover" data-content="Bạn cần phải nhập vào trường này" rows="2" required></textarea>
																		</div>
																		<br>
																		<br>
																		<label class="col-sm-2 control-label" for="linhvucnghiencuu">Lĩnh vực:</label>
																		<div class="col-sm-10" id="linhvucnghiencuu">
																			<label class="radio-inline"><input type="radio" value="tunhien" name="linhvucnghiencuu" checked="checked"> Tự nhiên</label>
																			<label class="radio-inline"><input type="radio" value="xhnv" name="linhvucnghiencuu">Xã hội nhân văn</label>
																			<label class="radio-inline"><input type="radio" value="giaoduc" name="linhvucnghiencuu">Giáo dục</label>
																			<label class="radio-inline"><input type="radio" value="kythuat" name="linhvucnghiencuu">Kỹ thuật</label>
																			<label class="radio-inline"><input type="radio" value="nong_ngulam" name="linhvucnghiencuu">Nông-ngư lâm</label>
																			<label class="radio-inline"><input type="radio" value="yduoc" name="linhvucnghiencuu">Y dược</label>
																			<label class="radio-inline"><input type="radio" value="moitruong" name="linhvucnghiencuu">Môi trường</label>
																		</div>
																		<br>
																		<br>
																		<label class="col-sm-2 control-label" for="loaihinhnghiencuu">Loại hình:</label>
																		<div class="col-sm-10" id="loaihinhnghiencuu">
																			<label class="radio-inline"><input type="radio" value="coban" name="loaihinhnghiencuu" checked="checked"> Cơ bản:</label>
																			<label class="radio-inline"><input type="radio" value="ungdung" name="loaihinhnghiencuu">Ứng dụng:</label>
																			<label class="radio-inline"><input type="radio" value="trienkhai" name="loaihinhnghiencuu">Triển khai:</label>
																		</div>
																		<br>
																		<br><br>
																		<div class="container" style="margin-top:35px; margin-left:20px;width:800px">
																			<div class="row">
																				<label class="col-sm-2 control-label" for="thoigianthuchien">Thời gian thực hiện:</label>
																				<div class="col-sm-10" id="thoigianthuchien">
																					<div class="row">
																						<label class="col-sm-1 control-label" for="thoigianbatdau">Từ:</label>
																						<div class="col-sm-4" style="margin-bottom:5px;">
																							<input type="text" type="text" name="ngay" class="form-control required ngay"  id="" required data-placement="right" data-trigger="hover" data-content="Vui lòng nhập theo định dạng mm/dd/yy" placeholder="mm/dd/yy" style="float:left; margin-top:10px;"required>
																						</div>
																						<label class="col-sm-1 control-label" for="thoigianketthuc">Đến:</label>
																						<div class="col-sm-4" style="margin-bottom:5px;">
																							<input type="text" type="text" name="ngay" class="form-control required ngay"  id="" required data-placement="right" data-trigger="hover" data-content="Vui lòng nhập theo định dạng mm/dd/yy" placeholder="mm/dd/yy" style="float:left; margin-left:10px; margin-top:10px;"required>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<label class="col-sm-2 control-label" for="coquanchutri">Cơ quan chủ trì:</label>
																		<div class="col-sm-10">
																			<input class="form-control" id="tendetai" type="text" placeholder="Khoa/Bộ môn trực thuộc">
																		</div>
																		<br>
																		<div class="container" style="margin-top:35px;width:800px">
																			<div class="row">
																				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
																					<label style="margin-left:60px">Chủ nhiệm đề tài:</label><br>
																					<div class="row" style="margin-bottom:5px">
																						<label class="col-sm-4 control-label" for="hoten1">Họ và tên:</label>
																						<div class="col-sm-8">
																							<input type="text" name="name" class="form-control required name" placeholder="Lê Văn A"  id="" required minlength="3" data-placement="right" data-trigger="hover" data-content="Bạn cần phải nhập vào trường này,ít nhất 3 ký tự.">
																						</div>
																					</div>
																					<div class="row" style="margin-bottom:5px">
																						<label class="col-sm-4 control-label" for="mssv1">MSSV:</label>
																						<div class="col-sm-8">
																							<input type="text" name="mssv" class="form-control required mssv" placeholder="141101"  id="" required minlength="6" data-placement="right" data-trigger="hover" data-content="Bạn cần phải nhập vào trường này,ít nhất 6 ký tự.">
																						</div>
																					</div>
																					<div class="row" style="margin-bottom:5px">
																						<label class="col-sm-4 control-label" for="mail1">Email:</label>
																						<div class="col-sm-8">
																							<input type="text" name="email" class="form-control required email" placeholder="LVA@gmail.com"  id="" required data-placement="right" data-trigger="hover" data-content="Bạn cần phải nhập vào trường này">
																						</div>
																					</div>
																					<br>
																					<label style="margin-left:60px">Sinh viên cùng thực hiện:</label><br>
																					<div class="row" style="margin-bottom:5px">
																						<label class="col-sm-4 control-label" for="hoten1">Họ và tên:</label>
																						<div class="col-sm-8">
																							<input class="form-control" id="hoten1" type="text">
																						</div>
																					</div>
																					<div class="row" style="margin-bottom:5px">
																						<label class="col-sm-4 control-label" for="mssv1">MSSV:</label>
																						<div class="col-sm-8">
																							<input class="form-control" id="mss1" type="text">
																						</div>
																					</div>
																				</div>
																				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
																					<label style="margin-left:60px">Giảng viên hướng dẫn:</label><br>
																					<div class="row" style="margin-bottom:5px">
																						<label class="col-sm-4 control-label" for="hoten1">Họ và tên:</label>
																						<div class="col-sm-8">
																							<input type="text" name="name" class="form-control required name" placeholder="Lê B"  id="" required minlength="3" data-placement="right" data-trigger="hover" data-content="Bạn cần phải nhập vào trường này,ít nhất 3 ký tự.">
																						</div>
																					</div>
																					<div class="row" style="margin-bottom:5px">
																						<label class="col-sm-4 control-label" for="mssv1">Email:</label>
																						<div class="col-sm-8">
																							<input type="text" name="email" class="form-control required email" placeholder="LVA@gmail.com"  id="" required data-placement="right" data-trigger="hover" data-content="Bạn cần phải nhập vào trường này">
																						</div>
																						<br><br><br><br><br><br>
																						<label style="margin-left:60px">Sinh viên cùng thực hiện(2):</label><br>
																						<div class="row" style="margin-bottom:5px">
																							<label class="col-sm-4 control-label" for="hoten1">Họ và tên:</label>
																							<div class="col-sm-8">
																								<input class="form-control" id="hoten1" type="text">
																							</div>
																						</div>
																						<div class="row" style="margin-bottom:5px">
																							<label class="col-sm-4 control-label" for="mssv1">MSSV:</label>
																							<div class="col-sm-8">
																								<input class="form-control" id="mss1" type="text">
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<label class="control-label" for="">Tình hình nghiên cứu trong và ngoài nước:</label><br>
																		<label class="col-sm-2 control-label" for="mota">Trong nước:</label>
																		<div class="col-sm-10" style="margin-bottom:5px">
																			<textarea type="text" name="mota" class="form-control required mota" placeholder="Tình hình nghiên cứu trong nước"  id="" required  data-placement="right" data-trigger="hover" data-content="Bạn cần phải nhập vào trường này" rows="2" required></textarea>
																		</div>
																		<label class="col-sm-2 control-label" for="mota">Ngoài nước:</label><br><br>
																		<div class="col-sm-10" style="margin-bottom:5px">
																			<textarea type="text" name="mota" class="form-control required mota" placeholder="Tình hình nghiên cứu ngoài nước"  id="" required  data-placement="right" data-trigger="hover" data-content="Bạn cần phải nhập vào trường này" rows="2" required></textarea>
																		</div>

																		<label class="col-sm-2 control-label" for="mota">Tính cấp thiết:</label>
																		<div class="col-sm-10" style="margin-bottom:5px">
																			<textarea type="text" name="mota" class="form-control required mota" placeholder="Tính cấp thiết"  id="" required  data-placement="right" data-trigger="hover" data-content="Bạn cần phải nhập vào trường này" rows="2" required></textarea>
																		</div>

																		<label class="col-sm-2 control-label" for="mota">Mục tiêu:</label>
																		<div class="col-sm-10" style="margin-bottom:5px">
																			<textarea type="text" name="mota" class="form-control required mota" placeholder="Mục tiêu của đề tài"  id="" required  data-placement="right" data-trigger="hover" data-content="Bạn cần phải nhập vào trường này" rows="2" required></textarea>
																		</div>

																		<label class="col-sm-2 control-label" for="mota">Phương pháp nghiên cứu:</label>
																		<div class="col-sm-10" style="margin-bottom:5px">
																			<textarea type="text" name="mota" class="form-control required mota" placeholder="Phương pháp và phạm vi nghiên cứu"  id="" required  data-placement="right" data-trigger="hover" data-content="Bạn cần phải nhập vào trường này" rows="2" required></textarea>
																		</div>

																		<label class="col-sm-2 control-label" for="mota">Nội dung nghiên cứu:</label>
																		<div class="col-sm-10" style="margin-bottom:5px">
																			<textarea type="text" name="mota" class="form-control required mota" placeholder="Nội dung nghiên cứu và tiến độ thực hiện"  id="" required  data-placement="right" data-trigger="hover" data-content="Bạn cần phải nhập vào trường này" rows="2" required></textarea>
																		</div>

																		<label class="col-sm-2 control-label" for="sanphamdukiem">Sản phẩm dự kiến:</label>
																		<div class="col-sm-10" style="margin-bottom:5px">
																			<textarea type="text" name="mota" class="form-control required mota" placeholder="Sản phẩm dự kiến"  id="" required  data-placement="right" data-trigger="hover" data-content="Bạn cần phải nhập vào trường này" rows="2" required></textarea>
																		</div>


																		<label class="col-sm-2 control-label" for="diachiungdung">Địa chỉ ứng dụng:</label>
																		<div class="col-sm-10" style="margin-bottom:5px">
																			<input class="form-control" id="diachiungdung" type="text" required>
																		</div>

																		<label class="col-sm-2 control-label" for="dxuatkinhphi">Đề xuất kinh phí:</label>
																		<div class="col-sm-10" style="margin-bottom:5px">
																			<input type="text" name="dxuatkinhphi" class="form-control required dxuatkinhphi" placeholder="2000000" minlength="0" maxlength="6" id="" required data-placement="right" data-trigger="hover" data-content="Bạn cần phải nhập vào trường này">
																		</div>

																		<label class="col-sm-2 control-label" for="tendetai">Tải file chi tiết:</label>
																		<div class="col-sm-10" style="margin-bottom:10px">
																			<input class="form-control" id="tendetai" type="file">
																		</div>

																		<div id="guidon" style="">
																			<button type="submit" id="btn_GuiDon" style="color: #fff;background-color: #5bc0de;border-color: #46b8da; height:35px;width:150px;background-image: none;border: 1px solid transparent;border-radius: 4px; margin-right:15px;float:right;">Gửi đơn đăng ký</button>
																			<a class="btn btn-warning" href="sinhvien_DeTaiDeXuat.jsp" role="button" style="margin-left:10px">Đăng ký đề tài được đề xuất</a>

																		</div>
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="tab-pane" id="kqNghiemThu">
										<div class="row">
											<div class="svkqNghiemThu" style="background:white;height:500px;margin-right:15px;border-radius:3px">
												<h2 class="tieude_theh">KẾT QUẢ NGHIỆM THU</h2><hr>
												<div class="sv_table_kqNghiemThu">
													<table class="table table-striped table-hover">
														<thead class="thead-default">
															<tr class="success">
																<th>Mã số đề tài</th>
																<th>Tên đề tài</th>
																<th>Ngày đăng ký</th>
																<th>Ngày nghiệm thu</th>
																<th>Kết quả chi tiết</th>
															</tr>
														</thead>
														<tbody>
															<%
				     										for (DeTai detai: dt.getListDeTaiNT(session.getAttribute("Email").toString())) {
															%>
															<tr>
																<td><%=detai.getMaDT() %></td>
																<td><%=detai.getTenDT() %></td>
																<td><%=detai.getNgayThucHien() %></td>
																<td><%=detai.getNgayNT() %></td>
																<td><a href="sinhvien_ketqua.jsp?MaDT=<%=detai.getMaDT()%>">Xem</a></td>
															</tr>
															<%
			    											}
															%>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
									<div class="tab-pane" id="ttTaiKhoan">
										<div class="row">
											<div class="svttTaiKhoan" style="background:white;height:500px;margin-right:15px;border-radius:3px">
												<h2 class="tieude_theh">THÔNG TIN TÀI KHOẢN</h2><hr>
												<div class="ttTaiKhoan_content">
													<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
														<div class="svAnhDaiDien">
															<img src="images/daidien.jpg" alt="Image" width="85%" height="250px" style="margin-left:18px; margin-top:15px;">
															<form action="">
																<input type="file" name="pic" accept="image/*">
															</form>
														</div>
													</div>
													<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
														<div class="row">
														<%
				     										TaiKhoan taikhoan= tk.getTaiKhoanByMaTK(session.getAttribute("Email").toString());
															%>
															<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
																<br>
																
																	<b>
																		<p>Tên chủ nhiệm: <%=taikhoan.getHoTen() %></p>
																		<p>MSSV: <%=taikhoan.getMatKhau() %></p>
																		<p>Ngày sinh: <%=taikhoan.getNgaySinh() %></p>
																		<p>Thuộc khoa: <%=taikhoan.getNganh() %></p>
																		<p>Quê quán: Quảng Ngãi</p>
																	</b>
																
															</div>
															<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
																<br>
																
																	<b>
																		<p>Mail: <%=taikhoan.getEmail() %></p>
																		<p>Ngành:<%=taikhoan.getNganh() %></p>
																		<p>Mã số ngân hàng: <%=taikhoan.getMSNH() %></p>
																		<p>Chi nhánh ngân hàng: <%=taikhoan.getCNNH() %></p>
																		<p>Đơn vị công tác: ZXC</p>
																	</b>
															</div>
															<%
				     										
																%>
														</div>
														<div class="row">
															<div class="container">
																<a class="btn btn-warning" style="margin-top:40px;margin-left:80px;" data-toggle="modal" href='#modal-id'>Đổi mật khẩu</a>
																<div class="modal fade" id="modal-id">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<div class="modal-header">
																				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
																				<h4 class="modal-title">Modal title</h4>
																			</div>
																			<div class="modal-body panel panel-success">
																				<div class="title panel-heading" style=" text-align:center; margin-bottom:15px;">
																					<h2> ĐỔI MẬT KHẨU </h2>
																					
																				</div>
																				<div class="doi panel-body">
																					<form action="" id="register-form" name="doipass" method="POST" class="form-horizontal" role="form">
																						<div class="form-group has-feedback" style="margin-left:65px;">
																							<div class="col-xs-10">
																								<label for="pass">Mật khẩu cũ<span>:</span></label> 
																								<input class="form-control" name="pass" id="pass" type="password"  required />
																								<span class="glyphicon form-control-feedback" id="pass1"></span>
																							</div>
																						</div>
																						<div class="form-group has-feedback" style="margin-left:65px;">
																							<div class="col-xs-10">
																								<label for="npass">Mật khẩu mới<span>:</span></label> 
																								<input class="form-control " name="npass"  type="password" id="npass" required />
																								<span class="glyphicon form-control-feedback" id="npass1"></span>
																							</div>
																						</div>
																						<div class="form-group has-feedback" style="margin-left:65px;">
																							<div class="col-xs-10">
																								<label for="cfpass">Mật khẩu mới<span>:</span></label> 
																								<input class="form-control" name="cfpass" id="cfpass"  type="password" required />
																								<span class="glyphicon form-control-feedback" id="cfpass1"></span>
																							</div>
																						</div>
																						<div class="modal-footer">
																							<button type="button" class="btn btn-danger"  data-dismiss="modal">Hủy</button>
																							<button type="submit" id="btnsm" class="btn btn-primary">Lưu</button>
																						</div>
																					</form>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<a class="btn btn-primary" data-toggle="modal" href="#modaltt" style="margin-top:40px; margin-left:30px;">Cập nhật thông tin</a>
																<div class="modal fade" id="modaltt">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<div class="modal-header">
																				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
																				<h4 class="modal-title">Modal title</h4>
																			</div>
																			<div class="modal-body">
																				<div class="row">
																					<div class="title " style=" text-align:center; margin-bottom:15px;">
																						<h2> CẬP NHẬT THÔNG TIN </h2>
																					</div>
																				</div>
																				<div class="row">
																					<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" style="padding-right:0px;">
																						<div class="svAnhDaiDien" style="margin-top:20px;" >
																							<img src="images/daidien.jpg" alt="Image" width="90%" height="250px" style="margin-left:10px; margin-top:10px;">
																							<form action="">
																								<input type="file" name="pic" accept="image/*">
																							</form>
																						</div>
																					</div>
																					<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
																						<form action="TaiKhoan_Servlet" id="formcntt" method="post" class="form-horizontal">
																							<input type="hidden" name="command" value="update">
																							<input type="hidden" name="MaTK" value=<%=session.getAttribute("Email").toString()%>>
																							<input type="hidden" name="Quyen" value="Student">
																							<div class="form-group has-feedback" style="margin-left:20px;">
																								<div class="col-xs-11">
																									<label for="email">Mail<span>:</span></label> 
																									<input class="form-control" name="email" id="email" type="email" required/>
																									<span class="glyphicon form-control-feedback" id="email1"></span>
																								</div>
																							</div>
																							<div class="form-group has-feedback" style="margin-left:20px;">
																								<div class="col-xs-11">
																									<label for="sodt">Ngành<span>:</span></label>
																									<input class="form-control" name="nganh" id="nganh" type="text"  required/>
																									<span class="glyphicon form-control-feedback" id="nganh1"></span>
																								</div>
																							</div>
																							<div class="form-group has-feedback" style="margin-left:20px;">
																								<div class="col-xs-11">
																									<label for="cnnganhang">Chi nhánh ngân hàng<span>:</span></label> 
																									<input class="form-control" name="cnnganhang" id="cnnganhang" type="text" required/>
																									<span class="glyphicon form-control-feedback" id="cnnganhang1"></span>
																								</div>
																							</div>
																							<div class="form-group has-feedback" style="margin-left:20px;">
																								<div class="col-xs-11">
																									<label for="donvi">Mã số ngân hàng<span>:</span></label> 
																									<input class="form-control" name="masoNH" id="donvi" type="text" required/>
																									<span class="glyphicon form-control-feedback" id="donvi1"></span>
																								</div>
																							</div>
																							</div>
																							<div class="modal-footer">
																								<button type="button" class="btn btn-danger" data-dismiss="modal">Hủy</button>
																								<button type="submit" class="btn btn-primary" >Lưu</button>
																							</div>
																						</form>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
					</div>
					</div>
				</div>
				 <div id='bttop'>
            <img src="images/backtotop.png" alt="backtotop" width="50px" height="50px">
        </div>
        <footer style="margin-bottom:0px;margin-top:10px;">
            <pre style="margin-bottom:0px;">
                Copyright@ Phòng nghiên cứu khoa học và quan hệ quốc tế
            </pre>
				</div>
					</div>
	
</body>
</html>