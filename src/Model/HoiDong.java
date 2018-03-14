package Model;

import java.util.ArrayList;

public class HoiDong {
	private String MaHD;
    private String PhanBien;
    private String TenChuTich;
    private String TenPhanBien;
  //TÍNBAT DAU TINBAT DAU TINBAT DAU TINBAT DAU TINBAT DAU TINBAT DAU TIN
    private String TenUyVien;
    private String NgayThanhLap;
    private String MaDT;
	public String getMaDT() {
		return MaDT;
	}

	public void setMaDT(String maDT) {
		MaDT = maDT;
	}

	public String getNgayThanhLap() {
		return NgayThanhLap;
	}

	public void setNgayThanhLap(String ngayThanhLap) {
		NgayThanhLap = ngayThanhLap;
	}
    public String getTenUyVien() {
		return TenUyVien;
	}

	public void setTenUyVien(String tenUyVien) {
		TenUyVien = tenUyVien;
	}
	
    //HẾT TÍNBAT DAU TINBAT DAU TINBAT DAU TINBAT DAU TIN
    private ArrayList<CTNghiemThu> dsCTNghiemThu= new ArrayList<CTNghiemThu>();
    
	public HoiDong() {
		super();
	}

	public HoiDong(String maHD, String phanBien, String tenChuTich, String tenPhanBien,
			ArrayList<CTNghiemThu> dsCTNghiemThu) {
		super();
		MaHD = maHD;
		PhanBien = phanBien;
		TenChuTich = tenChuTich;
		TenPhanBien = tenPhanBien;
		this.dsCTNghiemThu = dsCTNghiemThu;
	}

	public String getMaHD() {
		return MaHD;
	}

	public void setMaHD(String maHD) {
		MaHD = maHD;
	}

	public String getPhanBien() {
		return PhanBien;
	}

	public void setPhanBien(String phanBien) {
		PhanBien = phanBien;
	}

	public String getTenChuTich() {
		return TenChuTich;
	}

	public void setTenChuTich(String tenChuTich) {
		TenChuTich = tenChuTich;
	}

	public String getTenPhanBien() {
		return TenPhanBien;
	}

	public void setTenPhanBien(String tenPhanBien) {
		TenPhanBien = tenPhanBien;
	}

	public ArrayList<CTNghiemThu> getDsCTNghiemThu() {
		return dsCTNghiemThu;
	}

	public void setDsCTNghiemThu(ArrayList<CTNghiemThu> dsCTNghiemThu) {
		this.dsCTNghiemThu = dsCTNghiemThu;
	}
	

	
}
