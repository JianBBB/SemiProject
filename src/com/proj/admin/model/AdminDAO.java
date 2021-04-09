package com.proj.admin.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.proj.db.ConnectionPoolMgr2;

public class AdminDAO {
	private ConnectionPoolMgr2 pool;
	
	public AdminDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	//가입
	public int insertAdmin(AdminVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			String sql="insert into brand(brandno, brandname)"
					+ " values(brand_seq.nextval,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, );
			
			
			
			ps=con.prepareStatement(sql);
		}finally {
			
		}
	}
	
	
	//관리자 로그인 일치 브랜드매니저 MEMBERSERVICE.STATUS=2 통합매니저 =3 
	
	//승인요청 업데이트 - 통합관리자만 가능 adId=Admin_001
	
	
	//관리자 아이디 중복확인
	
	
}
